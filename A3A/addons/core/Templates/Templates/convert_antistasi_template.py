#!/usr/bin/env python3
"""
Convert old Antistasi faction .sqf template format to a newer MIX_*.sqf append format.

Usage examples:
  python convert_antistasi_template.py AMF_AI_Army_Tan.sqf MIX_AMF_Arid.sqf -o output/MIX_AMF_Army_Tan.sqf
  python convert_antistasi_template.py old_folder/*.sqf MIX_AMF_Arid.sqf -o converted/

The second argument is a new-format file used as layout/template. The script replaces matching
`_var append ...;` lines with values scraped from the old file.
"""
from __future__ import annotations

import argparse
import re
from pathlib import Path

# Old saveToTemplate keys -> new append variable names
SAVE_MAP = {
    "vehiclesBasic": "_basic",
    "vehiclesLightUnarmed": "_unarmedVehicles",
    "vehiclesLightArmed": "_armedVehicles",
    "vehiclesTrucks": "_Trucks",
    "vehiclesCargoTrucks": "_cargoTrucks",
    "vehiclesAmmoTrucks": "_ammoTrucks",
    "vehiclesRepairTrucks": "_repairTrucks",
    "vehiclesFuelTrucks": "_fuelTrucks",
    "vehiclesMedical": "_medicalTrucks",
    "vehiclesLightAPCs": "_lightAPCs",
    "vehiclesAPCs": "_APCs",
    "vehiclesIFVs": "_IFVs",
    "vehiclesAirborne": "_airborneVehicles",
    "vehiclesTanks": "_tanks",
    "vehiclesLightTanks": "_lightTanks",
    "vehiclesAA": "_aa",
    "vehiclesTransportBoats": "_transportBoat",
    "vehiclesGunBoats": "_gunBoat",
    "vehiclesAmphibious": "_Amphibious",
    "vehiclesPlanesCAS": "_planesCAS",
    "vehiclesPlanesAA": "_planesAA",
    "vehiclesPlanesTransport": "_planesTransport",
    "vehiclesHelisLight": "_helisLight",
    "vehiclesHelisTransport": "_transportHelicopters",
    "vehiclesHelisLightAttack": "_helisLightAttack",
    "vehiclesHelisAttack": "_helisAttack",
    "vehiclesArtillery": "_artillery",
    "magazines": "_artilleryMags",
    "uavsAttack": "_uavsAttack",
    "uavsPortable": "_uavsPortable",
    "vehiclesMilitiaLightArmed": "_militiaLightArmed",
    "vehiclesMilitiaTrucks": "_militiaTrucks",
    "vehiclesMilitiaCars": "_militiaCars",
    "vehiclesMilitiaAPCs": "_militiaAPCs",
    "vehiclesPolice": "_policeVehs",
    "staticMGs": "_staticMG",
    "staticAT": "_staticAT",
    "staticAA": "_staticAA",
    "staticMortars": "_staticMortars",
    "staticHowitzers": "_howitzers",
    "vehicleRadar": "_radar",
    "vehicleSam": "_SAM",
    "minefieldAT": "_minefieldAT",
    "minefieldAPERS": "_minefieldAPERS",
    "faces": "_faces",
    "voices": "_voices",
}

LOADOUT_OBJECTS = {
    "_loadoutData": "",
    "_sfLoadoutData": "sf",
    "_eliteLoadoutData": "elite",
    "_militaryLoadoutData": "military",
    "_policeLoadoutData": "police",
    "_militiaLoadoutData": "militia",
    "_crewLoadoutData": "crew",
    "_pilotLoadoutData": "pilot",
}

# New variable suffixes with different spelling/capitalization than old keys.
KEY_SUFFIX_MAP = {
    "missileATLaunchers": "missleATLaunchers",  # typo exists in new format
    "glSidearms": "GLsidearms",
    "mgVests": "MGvests",
    "medVests": "MEDvests",
    "slVests": "SLvests",
    "sniVests": "SNIvests",
    "glVests": "GLvests",
    "slUniform": "slUniforms",  # some older files use singular
    "slUniforms": "slUniforms",
}

# Old item-set keys -> new variable names
ITEM_KEY_TO_VAR = {
    "items_squadLeader_extras": "_slItems",
    "items_rifleman_extras": "_rItems",
    "items_medic_extras": "_mItems",
    "items_grenadier_extras": "_gItems",
    "items_explosivesExpert_extras": "_eeItems",
    "items_engineer_extras": "_eeItems",
    "items_lat_extras": "_latItems",
    "items_at_extras": "_atItems",
    "items_aa_extras": "_aaItems",
    "items_machineGunner_extras": "_mgItems",
    "items_marksman_extras": "_mmItems",
    "items_sniper_extras": "_mmItems",
    "items_police_extras": "_pItems",
    "items_crew_extras": "_cItems",
    "items_unarmed_extras": "_uItems",
}


def find_matching(text: str, start: int, open_ch: str, close_ch: str) -> int:
    depth = 0
    quote = None
    escape = False
    for i in range(start, len(text)):
        ch = text[i]
        if quote:
            if escape:
                escape = False
            elif ch == "\\":
                escape = True
            elif ch == quote:
                quote = None
            continue
        if ch in ('"', "'"):
            quote = ch
        elif ch == open_ch:
            depth += 1
        elif ch == close_ch:
            depth -= 1
            if depth == 0:
                return i
    raise ValueError(f"No matching {close_ch!r} found")


def read_value_until_statement_end(text: str, start: int) -> str:
    """Read a SQF value from start until the semicolon, respecting nested []/() and strings."""
    depth_square = depth_round = depth_curly = 0
    quote = None
    escape = False
    for i in range(start, len(text)):
        ch = text[i]
        if quote:
            if escape:
                escape = False
            elif ch == "\\":
                escape = True
            elif ch == quote:
                quote = None
            continue
        if ch in ('"', "'"):
            quote = ch
        elif ch == "[":
            depth_square += 1
        elif ch == "]":
            depth_square -= 1
        elif ch == "(":
            depth_round += 1
        elif ch == ")":
            depth_round -= 1
        elif ch == "{":
            depth_curly += 1
        elif ch == "}":
            depth_curly -= 1
        elif ch == ";" and depth_square == depth_round == depth_curly == 0:
            return text[start:i].strip()
    return text[start:].strip()



def split_top_level_once(s: str, sep: str = ",") -> tuple[str, str]:
    depth_square = depth_round = depth_curly = 0
    quote = None
    escape = False
    for i, ch in enumerate(s):
        if quote:
            if escape:
                escape = False
            elif ch == "\\":
                escape = True
            elif ch == quote:
                quote = None
            continue
        if ch in ('"', "'"):
            quote = ch
        elif ch == "[":
            depth_square += 1
        elif ch == "]":
            depth_square -= 1
        elif ch == "(":
            depth_round += 1
        elif ch == ")":
            depth_round -= 1
        elif ch == "{":
            depth_curly += 1
        elif ch == "}":
            depth_curly -= 1
        elif ch == sep and depth_square == depth_round == depth_curly == 0:
            return s[:i].strip(), s[i + 1:].strip()
    return s.strip(), ""


def second_arg_from_outer_array(text: str, bracket_start: int) -> str:
    end = find_matching(text, bracket_start, "[", "]")
    inside = text[bracket_start + 1:end]
    _, second = split_top_level_once(inside)
    return second.strip()

def normalize_value(value: str, *, force_array: bool = False) -> str:
    value = value.strip()
    if value.startswith("createHashMapFromArray"):
        m = re.search(r"createHashMapFromArray\s*(\[)", value)
        if m:
            start = m.start(1)
            end = find_matching(value, start, "[", "]")
            value = value[start:end + 1]
    if force_array and not value.startswith("["):
        value = f"[{value}]"
    return value


def extract_save_values(old_text: str) -> dict[str, str]:
    values = {}
    pat = re.compile(r'\[\s*"(?P<key>[^"]+)"\s*,')
    for m in pat.finditer(old_text):
        key = m.group("key")
        if key not in SAVE_MAP:
            continue
        stmt_end = old_text.find(";", m.end())
        if stmt_end == -1 or "call _fnc_saveToTemplate" not in old_text[m.end():stmt_end + 1]:
            continue
        value = second_arg_from_outer_array(old_text, m.start())
        values[SAVE_MAP[key]] = normalize_value(value, force_array=key in {"vehicleRadar", "vehicleSam"})
    return values

def suffix_for_key(key: str) -> str:
    return KEY_SUFFIX_MAP.get(key, key)


def extract_loadout_values(old_text: str) -> dict[str, str]:
    values = {}
    pat = re.compile(r'(?P<obj>_\w+LoadoutData)\s+set\s+(?P<bracket>\[)\s*"(?P<key>[^"]+)"\s*,')
    for m in pat.finditer(old_text):
        obj = m.group("obj")
        key = m.group("key")
        if obj not in LOADOUT_OBJECTS:
            continue
        raw = second_arg_from_outer_array(old_text, m.start("bracket"))
        prefix = LOADOUT_OBJECTS[obj]
        if key in ITEM_KEY_TO_VAR and prefix == "":
            var = ITEM_KEY_TO_VAR[key]
        elif key.startswith("items_") or key.startswith("items_medical"):
            continue
        else:
            var = "_" + prefix + suffix_for_key(key)
        values[var] = normalize_value(raw)
    return values

def extract_private_arrays(old_text: str) -> dict[str, str]:
    values = {}
    for name in ["_slItems", "_rItems", "_mItems", "_gItems", "_eeItems", "_latItems", "_atItems", "_aaItems", "_mgItems", "_mmItems", "_pItems", "_cItems", "_uItems"]:
        m = re.search(rf"private\s+{re.escape(name)}\s*=\s*", old_text)
        if not m:
            continue
        raw = read_value_until_statement_end(old_text, m.end())
        values[name] = normalize_value(raw)
    return values


def convert_one(old_path: Path, template_text: str) -> str:
    old_text = old_path.read_text(encoding="utf-8", errors="ignore")
    values = {}
    values.update(extract_save_values(old_text))
    values.update(extract_loadout_values(old_text))
    values.update(extract_private_arrays(old_text))

    # Optional: generate header faction name from old ["name", ...]
    name_match = re.search(r'\[\s*"name"\s*,\s*"([^"]+)"\s*\]\s*call _fnc_saveToTemplate', old_text)
    faction_name = name_match.group(1) if name_match else old_path.stem

    def replace_append(m: re.Match) -> str:
        var = m.group("var")
        indent = m.group("indent")
        comment = m.group("comment") or ""
        if var not in values:
            return m.group(0)
        return f"{indent}{var} append {values[var]};{comment}"

    out = re.sub(
        r'(?m)^(?P<indent>\s*)(?P<var>_\w+)\s+append\s+(?P<value>.*?);(?P<comment>\s*//.*)?$',
        replace_append,
        template_text,
    )
    out = re.sub(r'(?s)/\*\s*Faction\s*:.*?\*/', f'/* Faction : {faction_name}\n * Converted from: {old_path.name}\n */', out, count=1)
    return out


def main() -> None:
    parser = argparse.ArgumentParser(description="Convert old Antistasi SQF templates to MIX append format.")
    parser.add_argument("old_files", nargs="+", help="Old .sqf files, wildcards allowed by your shell")
    parser.add_argument("template", help="New-format MIX .sqf file used as layout")
    parser.add_argument("-o", "--output", required=True, help="Output file if one input, or output folder if multiple inputs")
    args = parser.parse_args()

    old_files = [Path(p) for p in args.old_files]
    template_text = Path(args.template).read_text(encoding="utf-8", errors="ignore")
    output = Path(args.output)

    if len(old_files) == 1 and output.suffix.lower() == ".sqf":
        output.parent.mkdir(parents=True, exist_ok=True)
        output.write_text(convert_one(old_files[0], template_text), encoding="utf-8")
        print(f"Wrote {output}")
    else:
        output.mkdir(parents=True, exist_ok=True)
        for old in old_files:
            name = old.stem
            if name.startswith("AMF_AI_"):
                name = name.replace("AMF_AI_", "MIX_AMF_", 1)
            elif not name.startswith("MIX_"):
                name = "MIX_" + name
            dest = output / f"{name}.sqf"
            dest.write_text(convert_one(old, template_text), encoding="utf-8")
            print(f"Wrote {dest}")


if __name__ == "__main__":
    main()
