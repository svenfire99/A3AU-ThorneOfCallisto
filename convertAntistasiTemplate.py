#!/usr/bin/env python3
"""
Convert old Antistasi faction .sqf template format to a newer MIX_*.sqf append format.

Usage examples:
  python convertAntistasiTemplate.py AMF_AI_Army_Tan.sqf MIX_AMF_Arid.sqf -o output/MIX_AMF_Army_Tan.sqf
  python convertAntistasiTemplate.py old_folder/*.sqf MIX_AMF_Arid.sqf -o converted/

The second argument is a new-format file used as layout/template. The script replaces matching
`_var append ...;` lines with values scraped from the old file.

Patch notes:
  - Rival saveToTemplate vehicle keys are mapped to the normal MIX variables:
      vehiclesRivalsLightArmed -> _lightArmed
      vehiclesRivalsTrucks     -> _Trucks
  - Rival templates are detected by `_Riv_` in the filename and can automatically use
    MIX_Rivals_empty.sqf via --rival-template.
  - `_loadoutData set [...]` is parsed too, which is required for rival infantry gear.
"""
from __future__ import annotations

import argparse
import re
from pathlib import Path


def strip_comments_preserve_length(text: str) -> str:
    """Replace SQF // and /* */ comments with spaces, preserving indexes and line breaks."""
    out = []
    i = 0
    quote = None
    escape = False

    while i < len(text):
        ch = text[i]

        if quote:
            out.append(ch)
            if escape:
                escape = False
            elif ch == "\\":
                escape = True
            elif ch == quote:
                quote = None
            i += 1
            continue

        if ch == '"':
            quote = ch
            out.append(ch)
            i += 1
            continue

        if text.startswith("//", i):
            out.extend("  ")
            i += 2
            while i < len(text) and text[i] not in "\r\n":
                out.append(" ")
                i += 1
            continue

        if text.startswith("/*", i):
            out.extend("  ")
            i += 2
            while i < len(text) and not text.startswith("*/", i):
                out.append("\n" if text[i] in "\r\n" else " ")
                i += 1
            if i < len(text):
                out.extend("  ")
                i += 2
            continue

        out.append(ch)
        i += 1

    return "".join(out)


def line_context(text: str, pos: int, context_lines: int = 4) -> tuple[int, str]:
    line_no = text[:pos].count("\n") + 1
    lines = text.splitlines()
    start = max(0, line_no - context_lines - 1)
    end = min(len(lines), line_no + context_lines)

    chunk = []
    for i in range(start, end):
        marker = ">>" if i + 1 == line_no else "  "
        chunk.append(f"{marker} {i + 1}: {lines[i]}")
    return line_no, "\n".join(chunk)


def is_rival_template_path(path: Path) -> bool:
    """Antistasi Ultimate rival templates consistently include `_Riv_` in the filename."""
    return "_Riv_" in path.name


def is_ai_template_path(path: Path) -> bool:
    """Normal army templates consistently include `_AI_` in the filename."""
    return "_AI_" in path.name


def template_kind_from_path(path: Path) -> str | None:
    """Return `ai`, `rival`, or None for unsupported template types.

    `_Civ_`, `_Reb_`, and other variants are intentionally skipped for now
    so they can get their own converter/layout pass later.
    """
    if is_rival_template_path(path):
        return "rival"
    if is_ai_template_path(path):
        return "ai"
    return None


def template_append_vars(template_text: str) -> set[str]:
    return {
        m.group("var")
        for m in re.finditer(
            r'(?m)^\s*(?P<var>_\w+)\s+append\s+.*?;',
            template_text,
        )
    }


def missing_template_vars(values: dict[str, str], template_text: str) -> list[str]:
    existing = template_append_vars(template_text)
    return sorted(var for var in values if var not in existing)



# Old saveToTemplate keys -> new append variable names
SAVE_MAP = {
    "vehiclesBasic": "_basic",
    "vehiclesLightUnarmed": "_lightUnarmed",
    "vehiclesLightArmed": "_lightArmed",
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

# Rival saveToTemplate keys -> variables in MIX_Rivals_empty.sqf.
# This is used only when the input filename contains `_Riv_`.
RIVAL_SAVE_MAP = dict(SAVE_MAP)
RIVAL_SAVE_MAP.update({
    "vehiclesRivalsCars": "_unarmedVehicles",
    "vehiclesRivalsLightArmed": "_armedVehicles",
    "vehiclesRivalsTrucks": "_Trucks",
    "vehiclesRivalsAPCs": "_lightAPCs",
    "vehiclesRivalsTanks": "_tanks",
    "vehiclesRivalsHelis": "_transportHelicopters",
    "vehiclesRivalsUavs": "_uavsAttack",
    "staticLowWeapons": "_staticLowWeapons",
})

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

    # Rival loadout keys -> normal MIX loadout keys.
    # AU rival templates use these names, but the MIX layout uses slRifles/SMGs.
    "tunedRifles": "slRifles",
    "enforcerRifles": "SMGs",

    # AU rival-specific loadout keys -> MIX_Rivals_empty names.
    "Rangefinder": "rangefinders",
    "headgear": "helmets",
    "heavyHelmets": "helmets",
    "offuniforms": "SLuniforms",
    "heavyUniforms": "uniforms",
    "heavyVests": "vests",
    "atBackpacks": "ATBackpacks",
    "crewHelmets": "crewhelmets",
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


# Easy configurable variable aliases.
# Left side = variable/key the converter found in an old template.
# Right side = variable that exists in MIX_empty.sqf.
# Add more entries here whenever old templates use redundant / wrong names.
VARIABLE_ALIASES = {
    # Generalizing old loadout names into universal ones
    "_shotGuns": "_SMGs",
    "_heavyATLaunchers": "_missleATLaunchers",

    "_rangefinder": "_rangefinders",

    "_cloakGlasses": "_SNIhats",
    "_slUniorms": "_SLuniforms",
    "_slUniforms": "_SLuniforms",
    "_medUniforms": "_MEDuniforms",
    "_engUniforms": "_uniforms",
    "_Hvests": "_vests",
    "_maVests": "_SNIvests",
    "_engVests": "_ENGvests",
    "_MEDIvests": "_MEDvests",
    "_atBackpacks": "_ATBackpacks",
    "_aaBackpacks": "_AABackpacks",
    "_mgBackpacks": "_MGBackpacks",
    "_MGbackpacks": "_MGBackpacks",
    "_glBackpacks": "_GLBackpacks",
    "_medBackpacks": "_MEDBackpacks",
    "_MEDIbackpacks": "_MEDBackpacks",
    "_Medbackpacks": "_MEDBackpacks",
    "_engBackpacks": "_ENGBackpacks",
    "_expBackpacks": "_EXPBackpacks",
    "_slBackpacks": "_SLBackpacks",
    "_ViperBP": "_SLBackpacks",
    "_MGhelmets": "_helmets",
    "_GLhelmets": "_helmets",
    "_medHelmets": "_MEDhelmets",
    "_Medhelmets": "_MEDhelmets",
    "_slHelmets": "_SLhelmets",
    "_slHat": "_SLhats",
    "_sniHats": "_SNIhats",

    "_glasses": "_facewear",
    "_goggles": "_facewear",
    
    # SF
    "_sfslSidearms": "_sfGLsidearms",
    "_sfmedUniforms": "_sfMEDuniforms",
    "_sfengUniforms": "_sfENGuniforms",
    "_sfslUniorms": "_sfSLuniforms",
    "_sfslUniforms": "_sfSLuniforms",
    "_sfengVests": "_sfENGvests",
    "_sfatBackpacks": "_sfATBackpacks",
    "_sfmgBackpacks": "_sfMGbackpacks",
    "_sfglBackpacks": "_sfGLbackpacks",
    "_sfMEDIvests": "_sfMEDvests",
    "_sfaaBackpacks": "_sfAABackpacks",
    "_sfengBackpacks": "_sfENGBackpacks",
    "_sfMEDIbackpacks": "_sfMEDBackpacks",
    "_sfmedBackpacks": "_sfMEDBackpacks",
    "_sfexpBackpacks": "_sfEXPBackpacks",
    "_sfslBackpacks": "_sfSLBackpacks",
    "_sfmedHelmets": "_sfMEDhelmets",
    "_sfslHelmets": "_sfSLhelmets",
    "_sfslHat": "_sfSLhats",
    "_sfsniHats": "_sfSNIhats",
    "_sfglasses": "_sffacewear",
    "_sfgoggles": "_sffacewear",

    # Elite
    "_eliteslSidearms": "_eliteGLsidearms",
    "_eliteslUniforms": "_eliteSLuniforms",
    "_eliteengVests": "_eliteENGvests",
    "_eliteatBackpacks": "_eliteATBackpacks",
    "_eliteaaBackpacks": "_eliteAABackpacks",
    "_eliteMGbackpacks": "_eliteMGBackpacks",
    "_elitemgBackpacks": "_eliteMGBackpacks",
    "_eliteglBackpacks": "_eliteGLBackpacks",
    "_eliteMEDIbackpacks": "_eliteMEDBackpacks",
    "_elitemedBackpacks": "_eliteMEDBackpacks",
    "_eliteengBackpacks": "_eliteENGBackpacks",
    "_eliteexpBackpacks": "_eliteEXPBackpacks",
    "_eliteslBackpacks": "_eliteSLBackpacks",
    "_eliteGLhelmets": "_elitehelmets",
    "_eliteMGhelmets": "_elitehelmets",
    "_eliteslHat": "_eliteSLhats",
    "_elitesniHats": "_eliteSNIhats",
    "_eliteglasses": "_elitefacewear",
    "_elitegoggles": "_elitefacewear",

    # Military
    "_militaryslUniforms": "_militarySLuniforms",
    "_militaryengVests": "_militaryENGvests",
    "_militaryatBackpacks": "_militaryATBackpacks",
    "_militaryATbackpacks": "_militaryATBackpacks",
    "_militaryaaBackpacks": "_militiaAABackpacks",
    "_militaryMGbackpacks": "_militaryMGBackpacks",
    "_militarymgBackpacks": "_militaryMGBackpacks",
    "_militaryglBackpacks": "_militaryGLBackpacks",
    "_militaryMEDIbackpacks": "_militaryMEDBackpacks",
    "_militarymedBackpacks": "_militaryMEDBackpacks",
    "_militaryengBackpacks": "_militaryENGBackpacks",
    "_militaryexpBackpacks": "_militaryEXPBackpacks",
    "_militaryslBackpacks": "_militarySLBackpacks",
    "_militaryGLhelmets": "_militaryhelmets",
    "_militaryMGhelmets": "_militaryhelmets",
    "_militaryslHat": "_militarySLhats",
    "_militarysniHats": "_militarySNIhats",
    "_militaryglasses": "_militaryfacewear",
    "_militarygoggles": "_militaryfacewear",

    # Militia
    "_militiashotguns": "_militiaSMGs",
    "_militiamedUniforms": "_militiaMEDuniforms",
    "_militiaengUniforms": "_militiaENGuniforms",
    "_militiaslUniforms": "_militiaSLuniforms",
    "_militiaslUniorms": "_militiaSLuniforms",
    "_militiaMedvests": "_militiaMEDvests",
    "_militiaSnivests": "_militiaSNIvests",
    "_militiamaVests": "_militiaSNIvests",
    "_militiaATvests": "_militiaATvests",
    "_militiaengVests": "_militiaENGvests",
    "_militiaENGVests": "_militiaENGvests",
    "_militiaatBackpacks": "_militiaATBackpacks",
    "_militiaMGbackpacks": "_militiaMGBackpacks",
    "_militiaglBackpacks": "_militiaGLBackpacks",
    "_militiamedBackpacks": "_militiaMEDBackpacks",
    "_militiaMedbackpacks": "_militiaMEDBackpacks",
    "_militiaENGbackpacks": "_militiaENGBackpacks",
    "_militiaengBackpacks": "_militiaENGBackpacks",
    "_militiaslBackpacks": "_militiaSLBackpacks",
    "_militiamedHelmets": "_militiaMEDhelmets",
    "_militiaslHelmets": "_militiaSLhelmets",
    "_militiaslHat": "_militiaSLhats",
    "_militiasniHats": "_militiaSNIhats",
    "_militiaglasses": "_militaryfacewear",
    "_militiagoggles": "_militaryfacewear",

    # Misc
    "_pilotslUniforms": "_pilotuniforms",
    "_pilotheadgear": "_pilothelmets",
    "_pilotHeadgear": "_pilothelmets",
    "_pilothelmets": "_pilothelmets",
    "_pilotglasses": "_pilotfacewear",
    "_crewslUniforms": "_crewuniforms",
    "_crewcrewHelmets": "_crewhelmets",
    "_crewCrewHelmets": "_crewhelmets",
    "_crewcrewhelmets": "_crewhelmets",
    "_crewglasses": "_crewfacewear",
    "_policepoliceWeapons": "_policeWeapons",
    "_policerifles": "_policeWeapons",
    "_policecarbines": "_policeWeapons",
    "_policeSMGs": "_policeWeapons",
    "_policesmgs": "_policeWeapons",
    "_policeshotGuns": "_policeWeapons",
    "_policeshotguns": "_policeWeapons",
    "_policeslUniforms": "_policeSLuniforms",
    "_policeslHat": "_policehelmets",
    "_policeglasses": "_policefacewear",
    

    # common old conditional vehicle variable names -> MIX_empty names
    "_unarmedVehicles": "_lightUnarmed",
    "_armedVehicles": "_lightArmed",
    "_trucks": "_Trucks",
    "_cargotrucks": "_cargoTrucks",
    "_cargoTrucks": "_cargoTrucks",
    "_ammo": "_ammoTrucks",
    "_repair": "_repairTrucks",
    "_fuel": "_fuelTrucks",
    "_medical": "_medicalTrucks",
    "_lightAPCs": "_lightAPCs",
    "_APCs": "_APCs",
    "_IFVs": "_IFVs",
    "_lightTanks": "_lightTanks",
    "_AA": "_aa",
    "_aa": "_aa",
    "_Amphibious": "_Amphibious",
    "_heliLight": "_helisLight",
    "_helisLight": "_helisLight",
    "_heliTransport": "_transportHelicopters",
    "_transportHelicopters": "_transportHelicopters",
    "_heliLightAttack": "_helisLightAttack",
    "_helisLightAttack": "_helisLightAttack",
    "_heliAttack": "_helisAttack",
    "_helisAttack": "_helisAttack",
    "_planesCAS": "_planesCAS",
    "_planesAA": "_planesAA",
    "_planesTransport": "_planesTransport",
    "_airPatrol": "_airPatrol",
    "_artillery": "_artillery",
    "_artilleryMags": "_artilleryMags",
    "_police": "_policeVehs",
    "_policeVehs": "_policeVehs",
}


# Aliases for the rival empty/layout. These keep old/normal names usable,
# but canonicalize them to the variables used in MIX_Rivals_empty.sqf.
# Normal templates still use VARIABLE_ALIASES unchanged.
RIVAL_VARIABLE_ALIASES = dict(VARIABLE_ALIASES)
RIVAL_VARIABLE_ALIASES.update({
    "_lightUnarmed": "_unarmedVehicles",
    "_unarmedVehicles": "_unarmedVehicles",
    "_lightArmed": "_armedVehicles",
    "_armedVehicles": "_armedVehicles",
    "_staticMG": "_staticLowWeapons",
    "_staticLowWeapons": "_staticLowWeapons",

    "_smgs": "_SMGs",
    
    "_offvests": "_SLvests",
    "_offbackpacks": "_SLBackpacks",
    "_offhelmets": "_SLhelmets",
    "_offfacewear": "_facewear",

    "_glasses": "_facewear",
})


def canonical_var_name(var: str, aliases: dict[str, str] | None = None) -> str:
    """Map old/redundant variable names to the variable names used by the selected template."""
    aliases = aliases or VARIABLE_ALIASES
    return aliases.get(var, var)


def add_value(values: dict[str, str], var: str, value: str, aliases: dict[str, str] | None = None) -> None:
    """Store extracted value after applying the selected alias map."""
    values[canonical_var_name(var, aliases)] = value



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
        if ch == '"':
            quote = ch
        elif ch == open_ch:
            depth += 1
        elif ch == close_ch:
            depth -= 1
            if depth == 0:
                return i
    raise ValueError(f"No matching {close_ch!r} found at position {start}")


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
        if ch == '"':
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
        if ch == '"':
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


def extract_private_assignments(old_text: str, aliases: dict[str, str] | None = None) -> dict[str, str]:
    """Extract top-level/private variable assignments from old templates.

    This fixes old templates that do this pattern:
        private _basic = ["veh1", "veh2"];
        ["vehiclesBasic", _basic] call _fnc_saveToTemplate;

    Without resolving the variable, the converter would output:
        _basic append _basic;

    The result stores both the original variable name and its canonical alias so
    redundant old names can still be resolved.
    """
    aliases = aliases or VARIABLE_ALIASES
    text = strip_comments_preserve_length(old_text)
    assignments: dict[str, str] = {}

    # Only private declarations are used here on purpose. Many conditional DLC
    # blocks use non-private `_var = ...` assignments; those blocks are copied
    # separately and should not overwrite the base gear/vehicle arrays.
    pat = re.compile(r'(?m)\bprivate\s+(?P<var>_\w+)\s*=\s*')
    for m in pat.finditer(text):
        var = m.group('var')
        raw = read_value_until_statement_end(text, m.end())
        value = normalize_value(raw)
        assignments[var] = value
        assignments[canonical_var_name(var, aliases)] = value

    return assignments


def resolve_value_references(value: str, assignments: dict[str, str], aliases: dict[str, str] | None = None) -> str:
    """If a saveToTemplate value is just a variable name, replace it with its array."""
    aliases = aliases or VARIABLE_ALIASES
    value = value.strip()
    if re.fullmatch(r'_\w+', value):
        return assignments.get(value) or assignments.get(canonical_var_name(value, aliases)) or value
    return value


def extract_save_values(old_text: str, assignments: dict[str, str] | None = None, *, save_map: dict[str, str] | None = None, aliases: dict[str, str] | None = None) -> dict[str, str]:
    save_map = save_map or SAVE_MAP
    aliases = aliases or VARIABLE_ALIASES
    text = strip_comments_preserve_length(old_text)
    assignments = assignments or extract_private_assignments(old_text, aliases)
    values = {}
    pat = re.compile(r'\[\s*"(?P<key>[^"]+)"\s*,')
    for m in pat.finditer(text):
        key = m.group("key")
        if key not in save_map:
            continue
        stmt_end = text.find(";", m.end())
        if stmt_end == -1 or "call _fnc_saveToTemplate" not in text[m.end():stmt_end + 1]:
            continue
        value = second_arg_from_outer_array(text, m.start())
        value = resolve_value_references(value, assignments, aliases)
        add_value(values, save_map[key], normalize_value(value, force_array=key in {"vehicleRadar", "vehicleSam"}), aliases)
    return values


def suffix_for_key(key: str) -> str:
    return KEY_SUFFIX_MAP.get(key, key)


def extract_loadout_values(old_text: str, aliases: dict[str, str] | None = None, assignments: dict[str, str] | None = None) -> dict[str, str]:
    aliases = aliases or VARIABLE_ALIASES
    text = strip_comments_preserve_length(old_text)
    assignments = assignments or extract_private_assignments(old_text, aliases)
    values = {}
    # Match both the base object `_loadoutData` and typed objects like
    # `_crewLoadoutData`, `_pilotLoadoutData`, etc. Rival templates put most
    # infantry gear on `_loadoutData`, so skipping it leaves rifles/uniforms empty.
    pat = re.compile(r'(?P<obj>_(?:loadoutData|\w+LoadoutData))\s+set\s+(?P<bracket>\[)\s*"(?P<key>[^"]+)"\s*,')
    for m in pat.finditer(text):
        obj = m.group("obj")
        key = m.group("key")
        if obj not in LOADOUT_OBJECTS:
            continue
        raw = second_arg_from_outer_array(text, m.start("bracket"))
        raw = resolve_value_references(raw, assignments, aliases)
        prefix = LOADOUT_OBJECTS[obj]
        if key in ITEM_KEY_TO_VAR and prefix == "":
            var = ITEM_KEY_TO_VAR[key]
        elif key.startswith("items_") or key.startswith("items_medical"):
            continue
        else:
            var = "_" + prefix + suffix_for_key(key)
        add_value(values, var, normalize_value(raw), aliases)
    return values


def extract_private_arrays(old_text: str, aliases: dict[str, str] | None = None) -> dict[str, str]:
    aliases = aliases or VARIABLE_ALIASES
    text = strip_comments_preserve_length(old_text)
    values = {}
    for name in ["_slItems", "_rItems", "_mItems", "_gItems", "_eeItems", "_latItems", "_atItems", "_aaItems", "_mgItems", "_mmItems", "_pItems", "_cItems", "_uItems"]:
        m = re.search(rf"private\s+{re.escape(name)}\s*=\s*", text)
        if not m:
            continue
        raw = read_value_until_statement_end(text, m.end())
        add_value(values, name, normalize_value(raw), aliases)
    return values



def replace_condition_variable_aliases(block: str, aliases: dict[str, str] | None = None) -> str:
    """Apply aliases inside copied conditional SQF blocks."""
    aliases = aliases or VARIABLE_ALIASES
    # Longest names first prevents partial-ish replacements from doing weird things.
    for old, new in sorted(aliases.items(), key=lambda kv: len(kv[0]), reverse=True):
        if old == new:
            continue
        block = re.sub(rf'(?<!\w){re.escape(old)}(?!\w)', new, block)
    return block


def extract_condition_blocks(old_text: str, aliases: dict[str, str] | None = None) -> list[str]:
    """Extract DLC/mod conditional blocks from old templates.

    Currently this captures blocks like:
      if (_hasGM) then { ... };
      if (isClass (configFile >> "CfgPatches" >> "SomeMod")) then { ... };

    They are copied near the bottom of the MIX output, after the Conditional Gear marker.
    """
    aliases = aliases or VARIABLE_ALIASES
    blocks: list[str] = []
    seen: set[str] = set()
    i = 0

    # Search the original text so the copied block keeps original formatting/comments.
    pattern = re.compile(r'\bif\s*\(', re.IGNORECASE)
    while True:
        m = pattern.search(old_text, i)
        if not m:
            break

        condition_start = m.start()
        paren_start = old_text.find('(', m.end() - 1)
        if paren_start == -1:
            i = m.end()
            continue

        try:
            paren_end = find_matching(old_text, paren_start, '(', ')')
        except ValueError:
            i = m.end()
            continue

        condition_text = old_text[paren_start + 1:paren_end]
        if not (re.search(r'\b_has\w+\b', condition_text) or 'isClass' in condition_text or 'CfgPatches' in condition_text):
            i = paren_end + 1
            continue

        then_match = re.search(r'\bthen\b\s*\{', old_text[paren_end:], re.IGNORECASE)
        if not then_match:
            i = paren_end + 1
            continue

        brace_start = paren_end + then_match.end() - 1
        try:
            brace_end = find_matching(old_text, brace_start, '{', '}')
        except ValueError:
            i = brace_start + 1
            continue

        end = brace_end + 1
        # Include trailing semicolon if present.
        while end < len(old_text) and old_text[end].isspace():
            end += 1
        if end < len(old_text) and old_text[end] == ';':
            end += 1

        block = old_text[condition_start:end].strip()
        block = replace_condition_variable_aliases(block, aliases)

        if block and block not in seen:
            seen.add(block)
            blocks.append(block)

        i = end

    return blocks


def insert_condition_blocks(output_text: str, condition_blocks: list[str]) -> str:
    if not condition_blocks:
        return output_text

    block_text = "\n\n".join(condition_blocks).rstrip() + "\n"

    # Prefer putting it directly below your Conditional Gear section header.
    marker = "//    Conditional Gear"
    marker_pos = output_text.find(marker)
    if marker_pos != -1:
        next_blank = output_text.find("\n\n", marker_pos)
        if next_blank != -1:
            return output_text[:next_blank].rstrip() + "\n\n" + block_text + output_text[next_blank:].lstrip("\n")
        return output_text.rstrip() + "\n\n" + block_text

    # Fallback marker, if you ever rename the section.
    fallback = "/* END CONDITIONAL GEAR */"
    if fallback in output_text:
        return output_text.replace(fallback, block_text + "\n" + fallback)

    return output_text.rstrip() + "\n\n/////////////////////////////\n//    Conditional Gear     //\n/////////////////////////////\n\n" + block_text


def extract_all_values(old_text: str, *, is_rival: bool = False) -> dict[str, str]:
    values = {}
    aliases = RIVAL_VARIABLE_ALIASES if is_rival else VARIABLE_ALIASES
    save_map = RIVAL_SAVE_MAP if is_rival else SAVE_MAP
    private_assignments = extract_private_assignments(old_text, aliases)

    # First resolve saveToTemplate keys. This now converts e.g.
    # ["vehiclesBasic", _basic] into the actual array assigned to _basic.
    values.update(extract_save_values(old_text, private_assignments, save_map=save_map, aliases=aliases))

    # Then loadout/hashmap values.
    # Pass private assignments so `_loadoutData set ["key", _someArray]` is resolved too.
    values.update(extract_loadout_values(old_text, aliases, private_assignments))

    # Finally item helper arrays used by loadouts.
    values.update(extract_private_arrays(old_text, aliases))
    return values


def convert_one(old_path: Path, template_text: str, *, report_missing: bool = False, is_rival: bool = False) -> str:
    old_text = old_path.read_text(encoding="utf-8", errors="ignore")
    aliases = RIVAL_VARIABLE_ALIASES if is_rival else VARIABLE_ALIASES
    values = extract_all_values(old_text, is_rival=is_rival)
    condition_blocks = extract_condition_blocks(old_text, aliases)

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
    out = insert_condition_blocks(out, condition_blocks)
    if report_missing:
        missing = missing_template_vars(values, template_text)
        if missing:
            print(f"[MISSING TEMPLATE VARIABLES] {old_path}")
            for var in missing:
                print(f"  - {var}")
            print("  Add these as lines like: _variable append []; in the selected empty/layout file\n")

    return out


def main() -> None:
    parser = argparse.ArgumentParser(description="Convert old Antistasi SQF templates to MIX append format.")
    parser.add_argument("old_files", nargs="+", help="Old .sqf files, wildcards allowed by your shell")
    parser.add_argument("template", help="Normal new-format MIX .sqf file used as layout")
    parser.add_argument("-o", "--output", required=True, help="Output file if one input, or output folder if multiple inputs")
    parser.add_argument(
        "--rival-template",
        default=None,
        help="Rival MIX .sqf layout/empty used when the input filename contains `_Riv_`. Defaults to MIX_Rivals_empty.sqf next to this script or in the current working directory.",
    )
    args = parser.parse_args()

    old_files = [Path(p) for p in args.old_files]
    template_text = Path(args.template).read_text(encoding="utf-8", errors="ignore")

    rival_template_path = Path(args.rival_template) if args.rival_template else None
    if rival_template_path is None:
        script_default = Path(__file__).with_name("MIX_Rivals_empty.sqf")
        cwd_default = Path("MIX_Rivals_empty.sqf")
        if script_default.exists():
            rival_template_path = script_default
        elif cwd_default.exists():
            rival_template_path = cwd_default

    rival_template_text = None
    if rival_template_path is not None and rival_template_path.exists():
        rival_template_text = rival_template_path.read_text(encoding="utf-8", errors="ignore")

    output = Path(args.output)

    if len(old_files) == 1 and output.suffix.lower() == ".sqf":
        output.parent.mkdir(parents=True, exist_ok=True)
        old = old_files[0]
        kind = template_kind_from_path(old)
        if kind is None:
            print(f"[SKIP TYPE] {old} does not contain `_AI_` or `_Riv_`; not converting.")
            return
        is_rival = kind == "rival"
        selected_template_text = rival_template_text if is_rival and rival_template_text is not None else template_text
        if is_rival and rival_template_text is None:
            print(f"[WARN] {old.name} looks like a rival template but no rival template was found; using normal template.")
        output.write_text(convert_one(old, selected_template_text, report_missing=True, is_rival=is_rival), encoding="utf-8")
        print(f"Wrote {output}" + (" [rival template]" if is_rival else " [AI template]"))
    else:
        output.mkdir(parents=True, exist_ok=True)
        for old in old_files:
            kind = template_kind_from_path(old)
            if kind is None:
                print(f"[SKIP TYPE] {old} does not contain `_AI_` or `_Riv_`; not converting.")
                continue
            name = old.stem
            if name.startswith("AMF_AI_"):
                name = name.replace("AMF_AI_", "MIX_AMF_", 1)
            elif not name.startswith("MIX_"):
                name = "MIX_" + name
            dest = output / f"{name}.sqf"
            is_rival = kind == "rival"
            selected_template_text = rival_template_text if is_rival and rival_template_text is not None else template_text
            if is_rival and rival_template_text is None:
                print(f"[WARN] {old.name} looks like a rival template but no rival template was found; using normal template.")
            dest.write_text(convert_one(old, selected_template_text, report_missing=True, is_rival=is_rival), encoding="utf-8")
            print(f"Wrote {dest}" + (" [rival template]" if is_rival else " [AI template]"))


if __name__ == "__main__":
    main()
