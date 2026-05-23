#!/usr/bin/env python3
"""
Generate MIX_*.sqf files from the repo root.

Run from repo root:
  python generateMixTemplates.py
  python generateMixTemplates.py --overwrite
  python generateMixTemplates.py --dry-run

Default paths:
  Source templates:
    A3A/addons/core/Templates/Templates/

  Layout/template:
    A3A/addons/core/Templates/Templates/custom_mixed/MIX_empty.sqf

  Rival layout/template:
    A3A/addons/core/Templates/Templates/custom_mixed/MIX_Rivals_empty.sqf

  Output:
    A3A/addons/core/Templates/Templates/custom_mixed/<FactionFolder>/MIX_*.sqf

Special case:
  *_Vehicle_Attributes.sqf is NOT converted.
  It is copied as-is to custom_mixed/<FactionFolder>/.

Template handling:
  Only files with `_AI_` or `_Riv_` in the filename are processed.
  Files with `_AI_` use MIX_empty.sqf.
  Files with `_Riv_` use MIX_Rivals_empty.sqf.
  Other faction types like `_Civ_` and `_Reb_` are skipped for now.
"""
from __future__ import annotations

import argparse
import importlib.util
import re
import shutil
import sys
from pathlib import Path


DEFAULT_TEMPLATES_ROOT = Path("A3A/addons/core/Templates/Templates")
DEFAULT_CUSTOM_MIXED = DEFAULT_TEMPLATES_ROOT / "custom_mixed"
DEFAULT_LAYOUT = DEFAULT_CUSTOM_MIXED / "MIX_empty.sqf"
DEFAULT_RIVAL_LAYOUT = DEFAULT_CUSTOM_MIXED / "MIX_Rivals_empty.sqf"

SKIP_FOLDERS = {
    "custom_mixed",
    "INCLUDES",
    "#Examples",
    "Misc",
    "FactionDefaults",
    "DLC_content",
    "MOD_content",
    "vehicleAnimations",
    "vehicleVariants",
}

SKIP_FILE_NAMES = {
    "templates.hpp",
    "MIX_empty.sqf",
    "MIX_Rivals_empty.sqf",
    "MIX_emptyRivals.sqf",
}


def load_converter(repo_root: Path):
    candidates = [
        repo_root / "convertAntistasiTemplate.py",
        repo_root / "convert_antistasi_template.py",
    ]

    for path in candidates:
        if path.exists():
            spec = importlib.util.spec_from_file_location("convertAntistasiTemplate", path)
            if spec is None or spec.loader is None:
                raise RuntimeError(f"Could not load converter from {path}")
            module = importlib.util.module_from_spec(spec)
            sys.modules["convertAntistasiTemplate"] = module
            spec.loader.exec_module(module)
            return module

    raise FileNotFoundError(
        "Could not find converter. Put convertAntistasiTemplate.py in the repo root."
    )



def is_rival_template(source_file: Path, converter=None) -> bool:
    """Rival templates in Antistasi Ultimate have `_Riv_` in their filename."""
    if converter is not None and hasattr(converter, "is_rival_template_path"):
        return bool(converter.is_rival_template_path(source_file))
    return "_Riv_" in source_file.name


def is_ai_template(source_file: Path) -> bool:
    """Normal army templates use `_AI_` in their filename."""
    return "_AI_" in source_file.name


def template_kind(source_file: Path, converter=None) -> str | None:
    """Return `ai`, `rival`, or None.

    The generator intentionally ignores other template types for now,
    such as `_Civ_` and `_Reb_`, so they can be handled later with
    their own empty/layout files.
    """
    if is_rival_template(source_file, converter):
        return "rival"
    if is_ai_template(source_file):
        return "ai"
    return None


def extract_values_compatible(converter, source_text: str, *, is_rival: bool):
    """Call old or new converter.extract_all_values without breaking backwards compatibility."""
    if not hasattr(converter, "extract_all_values"):
        return None
    try:
        return converter.extract_all_values(source_text, is_rival=is_rival)
    except TypeError:
        return converter.extract_all_values(source_text)


def convert_one_compatible(converter, source_file: Path, layout_text: str, *, is_rival: bool) -> str:
    """Call old or new converter.convert_one without breaking backwards compatibility."""
    try:
        return converter.convert_one(source_file, layout_text, is_rival=is_rival)
    except TypeError:
        return converter.convert_one(source_file, layout_text)


def show_error_context(text: str, error_text: str, context_lines: int = 5):
    match = re.search(r"position\s+(\d+)|pos\s*(\d+)", error_text, re.IGNORECASE)
    if not match:
        return None

    pos = int(next(g for g in match.groups() if g is not None))
    line_no = text[:pos].count("\n") + 1
    lines = text.splitlines()
    start = max(0, line_no - context_lines - 1)
    end = min(len(lines), line_no + context_lines)

    output = []
    for i in range(start, end):
        marker = ">>" if i + 1 == line_no else "  "
        output.append(f"{marker} {i + 1}: {lines[i]}")
    return line_no, "\n".join(output)


def mix_output_name(source_file: Path) -> str:
    stem = source_file.stem
    if stem.startswith("MIX_"):
        return source_file.name
    return f"MIX_{stem}.sqf"


def should_skip_folder(folder: Path) -> bool:
    return folder.name in SKIP_FOLDERS or folder.name.startswith(".")


def iter_source_files(templates_root: Path):
    for faction_dir in sorted(p for p in templates_root.iterdir() if p.is_dir()):
        if should_skip_folder(faction_dir):
            continue

        for source_file in sorted(faction_dir.rglob("*.sqf")):
            rel_parts = source_file.relative_to(templates_root).parts
            if any(part in SKIP_FOLDERS for part in rel_parts):
                continue
            if source_file.name in SKIP_FILE_NAMES:
                continue
            yield faction_dir, source_file


def print_failed_files(failed_files: list[dict[str, object]]) -> None:
    if not failed_files:
        return

    print("\n\n" + "=" * 100)
    print("FAILED FILES")
    print("=" * 100)

    for fail in failed_files:
        print("\n" + "-" * 100)
        print(f"FILE : {fail['file']}")
        print(f"ERROR: {fail['error']}")

        if fail.get("line"):
            print(f"LINE : {fail['line']}")

        if fail.get("context"):
            print("\nCONTEXT:")
            print(fail["context"])

        print("-" * 100)


def print_missing_vars(missing_by_file: dict[str, list[str]]) -> None:
    if not missing_by_file:
        return

    print("\n\n" + "=" * 100)
    print("MISSING VARIABLES IN SELECTED MIX LAYOUT")
    print("=" * 100)
    print("These variables came from old templates, but do not exist as an append line in the selected layout file.")
    print("For normal templates this is usually MIX_empty.sqf; for `_Riv_` files this is MIX_Rivals_empty.sqf.")
    print("Example: _crewcarbines append [];")
    print("=" * 100)

    all_vars = sorted({var for vars_ in missing_by_file.values() for var in vars_})
    print("\nAll unique missing variables:")
    for var in all_vars:
        print(f"  {var} append [];")

    print("\nPer file:")
    for file, vars_ in sorted(missing_by_file.items()):
        print(f"\n{file}")
        for var in vars_:
            print(f"  - {var}")


def main() -> int:
    parser = argparse.ArgumentParser(description="Generate custom_mixed MIX templates from repo root.")
    parser.add_argument("--templates-root", default=str(DEFAULT_TEMPLATES_ROOT), help="Path to Templates folder.")
    parser.add_argument("--custom-mixed", default=str(DEFAULT_CUSTOM_MIXED), help="Output custom_mixed folder.")
    parser.add_argument("--layout", default=str(DEFAULT_LAYOUT), help="Normal MIX_empty.sqf layout file.")
    parser.add_argument("--rival-layout", "--rival-template", default=str(DEFAULT_RIVAL_LAYOUT), help="Rival MIX_Rivals_empty.sqf layout file used for files with `_Riv_` in the filename.")
    parser.add_argument("--overwrite", action="store_true", help="Overwrite existing output files.")
    parser.add_argument("--dry-run", action="store_true", help="Show what would happen without writing files.")
    args = parser.parse_args()

    repo_root = Path.cwd()
    templates_root = (repo_root / args.templates_root).resolve()
    custom_mixed = (repo_root / args.custom_mixed).resolve()
    layout_file = (repo_root / args.layout).resolve()
    rival_layout_file = (repo_root / args.rival_layout).resolve()

    if not templates_root.exists():
        print(f"[ERROR] Templates root not found: {templates_root}")
        return 1

    if not layout_file.exists():
        print(f"[ERROR] normal MIX_empty.sqf layout not found: {layout_file}")
        return 1

    converter = load_converter(repo_root)
    layout_text = layout_file.read_text(encoding="utf-8", errors="replace")

    rival_layout_text = None
    if rival_layout_file.exists():
        rival_layout_text = rival_layout_file.read_text(encoding="utf-8", errors="replace")
    else:
        print(f"[WARN] Rival layout not found: {rival_layout_file}")
        print("[WARN] Files with `_Riv_` in the name will fall back to the normal layout.")

    failed_files: list[dict[str, object]] = []
    missing_by_file: dict[str, list[str]] = {}

    created = skipped = copied = failed = ai_templates = rivals = skipped_by_name = 0

    for faction_dir, source_file in iter_source_files(templates_root):
        kind = template_kind(source_file, converter)
        if kind is None:
            print(f"[SKIP TYPE] {source_file.relative_to(repo_root)} does not contain `_AI_` or `_Riv_`")
            skipped_by_name += 1
            skipped += 1
            continue

        faction_name = faction_dir.name
        output_dir = custom_mixed / faction_name
        source_text = source_file.read_text(encoding="utf-8", errors="replace")
        is_rival = kind == "rival"
        selected_layout_text = rival_layout_text if is_rival and rival_layout_text is not None else layout_text
        if is_rival:
            rivals += 1
        else:
            ai_templates += 1

        # IMPORTANT:
        # Vehicle_Attributes are not gear templates.
        # Do not convert them. Copy them as-is without MIX_ prefix.
        if source_file.name.endswith("_Vehicle_Attributes.sqf"):
            dest = output_dir / source_file.name

            if dest.exists() and not args.overwrite:
                print(f"[SKIP COPY] {dest.relative_to(repo_root)} already exists")
                skipped += 1
                continue

            print(f"[COPY] {source_file.relative_to(repo_root)} -> {dest.relative_to(repo_root)}")
            if not args.dry_run:
                output_dir.mkdir(parents=True, exist_ok=True)
                shutil.copy2(source_file, dest)

                # Remove old wrong generated MIX version if it exists.
                wrong_dest = output_dir / f"MIX_{source_file.name}"
                if wrong_dest.exists():
                    wrong_dest.unlink()
                    print(f"[CLEAN] Removed wrong file: {wrong_dest.relative_to(repo_root)}")

            copied += 1
            continue

        dest = output_dir / mix_output_name(source_file)

        if dest.exists() and not args.overwrite:
            print(f"[SKIP] {dest.relative_to(repo_root)} already exists")
            skipped += 1
            continue

        try:
            if hasattr(converter, "extract_all_values") and hasattr(converter, "missing_template_vars"):
                values = extract_values_compatible(converter, source_text, is_rival=is_rival)
                if values is not None:
                    missing = converter.missing_template_vars(values, selected_layout_text)
                    if missing:
                        label = str(source_file.relative_to(repo_root))
                        if is_rival:
                            label += " [RIVAL -> MIX_Rivals_empty.sqf]"
                        missing_by_file[label] = missing

            converted_text = convert_one_compatible(converter, source_file, selected_layout_text, is_rival=is_rival)

        except Exception as e:
            error_text = str(e)
            context = show_error_context(source_text, error_text)

            line_no = None
            snippet = None
            if context:
                line_no, snippet = context

            print("\n" + "=" * 100)
            print("[ERROR] Failed converting")
            print(f"FILE : {source_file.relative_to(repo_root)}")
            print(f"ERROR: {error_text}")

            if line_no:
                print(f"LINE : {line_no}")
            if snippet:
                print("\nCONTEXT:")
                print(snippet)

            print("=" * 100 + "\n")

            failed_files.append({
                "file": str(source_file.relative_to(repo_root)),
                "error": error_text,
                "line": line_no,
                "context": snippet,
            })
            failed += 1
            continue

        action = "[OVERWRITE]" if dest.exists() else "[CREATE]"
        layout_label = " [rival layout]" if is_rival else " [AI layout]"
        print(f"{action} {source_file.relative_to(repo_root)} -> {dest.relative_to(repo_root)}" + layout_label)

        if not args.dry_run:
            output_dir.mkdir(parents=True, exist_ok=True)
            dest.write_text(converted_text, encoding="utf-8")

        created += 1

    print("\n" + "=" * 100)
    print("SUMMARY")
    print("=" * 100)
    print(f"Created/converted : {created}")
    print(f"Copied attributes : {copied}")
    print(f"Skipped           : {skipped}")
    print(f"Failed            : {failed}")
    print(f"AI templates      : {ai_templates}")
    print(f"Rival templates   : {rivals}")
    print(f"Skipped by name   : {skipped_by_name}")

    print_missing_vars(missing_by_file)
    print_failed_files(failed_files)

    return 0 if failed == 0 else 2


if __name__ == "__main__":
    raise SystemExit(main())
