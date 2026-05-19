/*
    GearFaction.sqf
    Place in: Templates/Templates/.../INCLUDES/GearFaction.sqf next to Init_Base.sqf and Init_Layouts.sqf

    Goal: allow coalition templates to include multiple faction files,
    while keeping infantry gear faction-consistent.

    Usage in a coalition template:
        #include "INCLUDES\Init_Base.sqf"
        #include "INCLUDES\GearFaction.sqf"

        private _gearFactionSnapshot = call _fnc_gearFactionSnapshot;
        #include "Vanilla\MIX_NATO_Temparate.sqf"
        ["NATO", _gearFactionSnapshot] call _fnc_gearFactionCapture;

        _gearFactionSnapshot = call _fnc_gearFactionSnapshot;
        #include "AMF\MIX_AMF_Temperate.sqf"
        ["AMF", _gearFactionSnapshot] call _fnc_gearFactionCapture;

        ["AMF"] call _fnc_gearFactionApply;       // fixed gear faction
        // or:
        ["RANDOM"] call _fnc_gearFactionApply;    // one random faction per template load

        #include "INCLUDES\Init_Layouts.sqf"

    Important:
    - Vehicles stay mixed/global.
    - Only loadout gear arrays are captured and rolled back per faction.
    - Include this AFTER Init_Base and BEFORE faction includes.
*/

private _gearFactionPools = createHashMap;

private _fnc_gearFactionSnapshot = {
    createHashMapFromArray [
        ["slRifles", +_slRifles],
        ["rifles", +_rifles],
        ["carbines", +_carbines],
        ["grenadeLaunchers", +_grenadeLaunchers],
        ["designatedGrenadeLaunchers", +_designatedGrenadeLaunchers],
        ["SMGs", +_SMGs],
        ["machineGuns", +_machineGuns],
        ["marksmanRifles", +_marksmanRifles],
        ["sniperRifles", +_sniperRifles],
        ["lightATLaunchers", +_lightATLaunchers],
        ["lightHELaunchers", +_lightHELaunchers],
        ["ATLaunchers", +_ATLaunchers],
        ["missleATLaunchers", +_missleATLaunchers],
        ["AALaunchers", +_AALaunchers],
        ["sidearms", +_sidearms],
        ["GLsidearms", +_GLsidearms],
        ["ATMines", +_ATMines],
        ["APMines", +_APMines],
        ["lightExplosives", +_lightExplosives],
        ["heavyExplosives", +_heavyExplosives],
        ["antiInfantryGrenades", +_antiInfantryGrenades],
        ["antiTankGrenades", +_antiTankGrenades],
        ["smokeGrenades", +_smokeGrenades],
        ["signalsmokeGrenades", +_signalsmokeGrenades],
        ["maps", +_maps],
        ["watches", +_watches],
        ["compasses", +_compasses],
        ["radios", +_radios],
        ["gpses", +_gpses],
        ["NVGs", +_NVGs],
        ["binoculars", +_binoculars],
        ["rangefinders", +_rangefinders],
        ["traitorUniforms", +_traitorUniforms],
        ["traitorVests", +_traitorVests],
        ["traitorHats", +_traitorHats],
        ["officerUniforms", +_officerUniforms],
        ["officerVests", +_officerVests],
        ["officerHats", +_officerHats],
        ["cloakUniforms", +_cloakUniforms],
        ["cloakVests", +_cloakVests],
        ["cloakRifles", +_cloakRifles],
        ["cloakCarbines", +_cloakCarbines],
        ["cloakSidearms", +_cloakSidearms],
        ["uniforms", +_uniforms],
        ["slUniforms", +_slUniforms],
        ["vests", +_vests],
        ["Hvests", +_Hvests],
        ["MGvests", +_MGvests],
        ["MEDvests", +_MEDvests],
        ["SLvests", +_SLvests],
        ["SNIvests", +_SNIvests],
        ["GLvests", +_GLvests],
        ["backpacks", +_backpacks],
        ["atBackpacks", +_atBackpacks],
        ["aaBackpacks", +_aaBackpacks],
        ["medBackpacks", +_medBackpacks],
        ["engBackpacks", +_engBackpacks],
        ["expBackpacks", +_expBackpacks],
        ["longRangeRadios", +_longRangeRadios],
        ["helmets", +_helmets],
        ["slHat", +_slHat],
        ["sniHats", +_sniHats],
        ["slItems", +_slItems],
        ["rItems", +_rItems],
        ["mItems", +_mItems],
        ["gItems", +_gItems],
        ["eeItems", +_eeItems],
        ["latItems", +_latItems],
        ["atItems", +_atItems],
        ["aaItems", +_aaItems],
        ["mgItems", +_mgItems],
        ["mmItems", +_mmItems],
        ["pItems", +_pItems],
        ["cItems", +_cItems],
        ["uItems", +_uItems],
        ["glasses", +_glasses],
        ["goggles", +_goggles],
        ["sfslRifles", +_sfslRifles],
        ["sfrifles", +_sfrifles],
        ["sfcarbines", +_sfcarbines],
        ["sfgrenadeLaunchers", +_sfgrenadeLaunchers],
        ["sfdesignatedGrenadeLaunchers", +_sfdesignatedGrenadeLaunchers],
        ["sfSMGs", +_sfSMGs],
        ["sfmachineGuns", +_sfmachineGuns],
        ["sfmarksmanRifles", +_sfmarksmanRifles],
        ["sfsniperRifles", +_sfsniperRifles],
        ["sflightATLaunchers", +_sflightATLaunchers],
        ["sflightHELaunchers", +_sflightHELaunchers],
        ["sfATLaunchers", +_sfATLaunchers],
        ["sfmissleATLaunchers", +_sfmissleATLaunchers],
        ["sfAALaunchers", +_sfAALaunchers],
        ["sfsidearms", +_sfsidearms],
        ["sfGLsidearms", +_sfGLsidearms],
        ["sfATMines", +_sfATMines],
        ["sfAPMines", +_sfAPMines],
        ["sflightExplosives", +_sflightExplosives],
        ["sfheavyExplosives", +_sfheavyExplosives],
        ["sfantiInfantryGrenades", +_sfantiInfantryGrenades],
        ["sfsmokeGrenades", +_sfsmokeGrenades],
        ["sfsignalsmokeGrenades", +_sfsignalsmokeGrenades],
        ["sfmaps", +_sfmaps],
        ["sfwatches", +_sfwatches],
        ["sfcompasses", +_sfcompasses],
        ["sfradios", +_sfradios],
        ["sfgpses", +_sfgpses],
        ["sfNVGs", +_sfNVGs],
        ["sfbinoculars", +_sfbinoculars],
        ["sfrangefinders", +_sfrangefinders],
        ["sfuniforms", +_sfuniforms],
        ["sfslUniforms", +_sfslUniforms],
        ["sfvests", +_sfvests],
        ["sfHvests", +_sfHvests],
        ["sfMGvests", +_sfMGvests],
        ["sfMEDvests", +_sfMEDvests],
        ["sfSLvests", +_sfSLvests],
        ["sfSNIvests", +_sfSNIvests],
        ["sfGLvests", +_sfGLvests],
        ["sfbackpacks", +_sfbackpacks],
        ["sfatBackpacks", +_sfatBackpacks],
        ["sfaaBackpacks", +_sfaaBackpacks],
        ["sfmedBackpacks", +_sfmedBackpacks],
        ["sfengBackpacks", +_sfengBackpacks],
        ["sfexpBackpacks", +_sfexpBackpacks],
        ["sflongRangeRadios", +_sflongRangeRadios],
        ["sfhelmets", +_sfhelmets],
        ["sfslHat", +_sfslHat],
        ["sfsniHats", +_sfsniHats],
        ["sfglasses", +_sfglasses],
        ["sfgoggles", +_sfgoggles],
        ["eliteslRifles", +_eliteslRifles],
        ["eliterifles", +_eliterifles],
        ["elitecarbines", +_elitecarbines],
        ["elitegrenadeLaunchers", +_elitegrenadeLaunchers],
        ["elitedesignatedGrenadeLaunchers", +_elitedesignatedGrenadeLaunchers],
        ["eliteSMGs", +_eliteSMGs],
        ["elitemachineGuns", +_elitemachineGuns],
        ["elitemarksmanRifles", +_elitemarksmanRifles],
        ["elitesniperRifles", +_elitesniperRifles],
        ["elitelightATLaunchers", +_elitelightATLaunchers],
        ["elitelightHELaunchers", +_elitelightHELaunchers],
        ["eliteATLaunchers", +_eliteATLaunchers],
        ["elitemissleATLaunchers", +_elitemissleATLaunchers],
        ["eliteAALaunchers", +_eliteAALaunchers],
        ["elitesidearms", +_elitesidearms],
        ["eliteGLsidearms", +_eliteGLsidearms],
        ["eliteATMines", +_eliteATMines],
        ["eliteAPMines", +_eliteAPMines],
        ["elitelightExplosives", +_elitelightExplosives],
        ["eliteheavyExplosives", +_eliteheavyExplosives],
        ["eliteantiInfantryGrenades", +_eliteantiInfantryGrenades],
        ["elitesmokeGrenades", +_elitesmokeGrenades],
        ["elitesignalsmokeGrenades", +_elitesignalsmokeGrenades],
        ["elitemaps", +_elitemaps],
        ["elitewatches", +_elitewatches],
        ["elitecompasses", +_elitecompasses],
        ["eliteradios", +_eliteradios],
        ["elitegpses", +_elitegpses],
        ["eliteNVGs", +_eliteNVGs],
        ["elitebinoculars", +_elitebinoculars],
        ["eliterangefinders", +_eliterangefinders],
        ["eliteuniforms", +_eliteuniforms],
        ["eliteslUniforms", +_eliteslUniforms],
        ["elitevests", +_elitevests],
        ["eliteHvests", +_eliteHvests],
        ["eliteMGvests", +_eliteMGvests],
        ["eliteMEDvests", +_eliteMEDvests],
        ["eliteSLvests", +_eliteSLvests],
        ["eliteSNIvests", +_eliteSNIvests],
        ["eliteGLvests", +_eliteGLvests],
        ["elitebackpacks", +_elitebackpacks],
        ["eliteatBackpacks", +_eliteatBackpacks],
        ["eliteaaBackpacks", +_eliteaaBackpacks],
        ["elitemedBackpacks", +_elitemedBackpacks],
        ["eliteengBackpacks", +_eliteengBackpacks],
        ["eliteexpBackpacks", +_eliteexpBackpacks],
        ["elitelongRangeRadios", +_elitelongRangeRadios],
        ["elitehelmets", +_elitehelmets],
        ["eliteslHat", +_eliteslHat],
        ["elitesniHats", +_elitesniHats],
        ["eliteglasses", +_eliteglasses],
        ["elitegoggles", +_elitegoggles],
        ["militaryslRifles", +_militaryslRifles],
        ["militaryrifles", +_militaryrifles],
        ["militarycarbines", +_militarycarbines],
        ["militarygrenadeLaunchers", +_militarygrenadeLaunchers],
        ["militarydesignatedGrenadeLaunchers", +_militarydesignatedGrenadeLaunchers],
        ["militarySMGs", +_militarySMGs],
        ["militarymachineGuns", +_militarymachineGuns],
        ["militarymarksmanRifles", +_militarymarksmanRifles],
        ["militarysniperRifles", +_militarysniperRifles],
        ["militarylightATLaunchers", +_militarylightATLaunchers],
        ["militarylightHELaunchers", +_militarylightHELaunchers],
        ["militaryATLaunchers", +_militaryATLaunchers],
        ["militarymissleATLaunchers", +_militarymissleATLaunchers],
        ["militaryAALaunchers", +_militaryAALaunchers],
        ["militarysidearms", +_militarysidearms],
        ["militaryGLsidearms", +_militaryGLsidearms],
        ["militaryATMines", +_militaryATMines],
        ["militaryAPMines", +_militaryAPMines],
        ["militarylightExplosives", +_militarylightExplosives],
        ["militaryheavyExplosives", +_militaryheavyExplosives],
        ["militaryantiInfantryGrenades", +_militaryantiInfantryGrenades],
        ["militarysmokeGrenades", +_militarysmokeGrenades],
        ["militarysignalsmokeGrenades", +_militarysignalsmokeGrenades],
        ["militarymaps", +_militarymaps],
        ["militarywatches", +_militarywatches],
        ["militarycompasses", +_militarycompasses],
        ["militaryradios", +_militaryradios],
        ["militarygpses", +_militarygpses],
        ["militaryNVGs", +_militaryNVGs],
        ["militarybinoculars", +_militarybinoculars],
        ["militaryrangefinders", +_militaryrangefinders],
        ["militaryuniforms", +_militaryuniforms],
        ["militaryslUniforms", +_militaryslUniforms],
        ["militaryvests", +_militaryvests],
        ["militaryHvests", +_militaryHvests],
        ["militaryMGvests", +_militaryMGvests],
        ["militaryMEDvests", +_militaryMEDvests],
        ["militarySLvests", +_militarySLvests],
        ["militarySNIvests", +_militarySNIvests],
        ["militaryGLvests", +_militaryGLvests],
        ["militarybackpacks", +_militarybackpacks],
        ["militaryatBackpacks", +_militaryatBackpacks],
        ["militaryaaBackpacks", +_militaryaaBackpacks],
        ["militarymedBackpacks", +_militarymedBackpacks],
        ["militaryengBackpacks", +_militaryengBackpacks],
        ["militaryexpBackpacks", +_militaryexpBackpacks],
        ["militarylongRangeRadios", +_militarylongRangeRadios],
        ["militaryhelmets", +_militaryhelmets],
        ["militaryslHat", +_militaryslHat],
        ["militarysniHats", +_militarysniHats],
        ["militaryglasses", +_militaryglasses],
        ["militarygoggles", +_militarygoggles],
        ["policeuniforms", +_policeuniforms],
        ["policevests", +_policevests],
        ["policehelmets", +_policehelmets],
        ["policeWeapons", +_policeWeapons],
        ["policesidearms", +_policesidearms],
        ["militiaslRifles", +_militiaslRifles],
        ["militiarifles", +_militiarifles],
        ["militiacarbines", +_militiacarbines],
        ["militiagrenadeLaunchers", +_militiagrenadeLaunchers],
        ["militiadesignatedGrenadeLaunchers", +_militiadesignatedGrenadeLaunchers],
        ["militiaSMGs", +_militiaSMGs],
        ["militiamachineGuns", +_militiamachineGuns],
        ["militiamarksmanRifles", +_militiamarksmanRifles],
        ["militiasniperRifles", +_militiasniperRifles],
        ["militialightATLaunchers", +_militialightATLaunchers],
        ["militialightHELaunchers", +_militialightHELaunchers],
        ["militiaATLaunchers", +_militiaATLaunchers],
        ["militiamissleATLaunchers", +_militiamissleATLaunchers],
        ["militiaAALaunchers", +_militiaAALaunchers],
        ["militiasidearms", +_militiasidearms],
        ["militiaGLsidearms", +_militiaGLsidearms],
        ["militiaATMines", +_militiaATMines],
        ["militiaAPMines", +_militiaAPMines],
        ["militialightExplosives", +_militialightExplosives],
        ["militiaheavyExplosives", +_militiaheavyExplosives],
        ["militiaantiInfantryGrenades", +_militiaantiInfantryGrenades],
        ["militiasmokeGrenades", +_militiasmokeGrenades],
        ["militiasignalsmokeGrenades", +_militiasignalsmokeGrenades],
        ["militiamaps", +_militiamaps],
        ["militiawatches", +_militiawatches],
        ["militiacompasses", +_militiacompasses],
        ["militiaradios", +_militiaradios],
        ["militiagpses", +_militiagpses],
        ["militiaNVGs", +_militiaNVGs],
        ["militiabinoculars", +_militiabinoculars],
        ["militiarangefinders", +_militiarangefinders],
        ["militiauniforms", +_militiauniforms],
        ["militiaslUniforms", +_militiaslUniforms],
        ["militiavests", +_militiavests],
        ["militiaHvests", +_militiaHvests],
        ["militiaMGvests", +_militiaMGvests],
        ["militiaMEDvests", +_militiaMEDvests],
        ["militiaSLvests", +_militiaSLvests],
        ["militiaSNIvests", +_militiaSNIvests],
        ["militiaGLvests", +_militiaGLvests],
        ["militiabackpacks", +_militiabackpacks],
        ["militiaatBackpacks", +_militiaatBackpacks],
        ["militiaaaBackpacks", +_militiaaaBackpacks],
        ["militiamedBackpacks", +_militiamedBackpacks],
        ["militiaengBackpacks", +_militiaengBackpacks],
        ["militiaexpBackpacks", +_militiaexpBackpacks],
        ["militialongRangeRadios", +_militialongRangeRadios],
        ["militiahelmets", +_militiahelmets],
        ["militiaslHat", +_militiaslHat],
        ["militiasniHats", +_militiasniHats],
        ["militiaglasses", +_militiaglasses],
        ["militiagoggles", +_militiagoggles],
        ["crewuniforms", +_crewuniforms],
        ["crewvests", +_crewvests],
        ["crewhelmets", +_crewhelmets],
        ["crewcarbines", +_crewcarbines],
        ["crewSMGs", +_crewSMGs],
        ["pilotuniforms", +_pilotuniforms],
        ["pilotvests", +_pilotvests],
        ["pilothelmets", +_pilothelmets],
        ["pilotSMGs", +_pilotSMGs]
    ]
};

private _fnc_gearFactionCapture = {
    params ["_factionName", "_before"];

    private _pool = createHashMapFromArray [
        ["slRifles", _slRifles - (_before getOrDefault ["slRifles", []])],
        ["rifles", _rifles - (_before getOrDefault ["rifles", []])],
        ["carbines", _carbines - (_before getOrDefault ["carbines", []])],
        ["grenadeLaunchers", _grenadeLaunchers - (_before getOrDefault ["grenadeLaunchers", []])],
        ["designatedGrenadeLaunchers", _designatedGrenadeLaunchers - (_before getOrDefault ["designatedGrenadeLaunchers", []])],
        ["SMGs", _SMGs - (_before getOrDefault ["SMGs", []])],
        ["machineGuns", _machineGuns - (_before getOrDefault ["machineGuns", []])],
        ["marksmanRifles", _marksmanRifles - (_before getOrDefault ["marksmanRifles", []])],
        ["sniperRifles", _sniperRifles - (_before getOrDefault ["sniperRifles", []])],
        ["lightATLaunchers", _lightATLaunchers - (_before getOrDefault ["lightATLaunchers", []])],
        ["lightHELaunchers", _lightHELaunchers - (_before getOrDefault ["lightHELaunchers", []])],
        ["ATLaunchers", _ATLaunchers - (_before getOrDefault ["ATLaunchers", []])],
        ["missleATLaunchers", _missleATLaunchers - (_before getOrDefault ["missleATLaunchers", []])],
        ["AALaunchers", _AALaunchers - (_before getOrDefault ["AALaunchers", []])],
        ["sidearms", _sidearms - (_before getOrDefault ["sidearms", []])],
        ["GLsidearms", _GLsidearms - (_before getOrDefault ["GLsidearms", []])],
        ["ATMines", _ATMines - (_before getOrDefault ["ATMines", []])],
        ["APMines", _APMines - (_before getOrDefault ["APMines", []])],
        ["lightExplosives", _lightExplosives - (_before getOrDefault ["lightExplosives", []])],
        ["heavyExplosives", _heavyExplosives - (_before getOrDefault ["heavyExplosives", []])],
        ["antiInfantryGrenades", _antiInfantryGrenades - (_before getOrDefault ["antiInfantryGrenades", []])],
        ["antiTankGrenades", _antiTankGrenades - (_before getOrDefault ["antiTankGrenades", []])],
        ["smokeGrenades", _smokeGrenades - (_before getOrDefault ["smokeGrenades", []])],
        ["signalsmokeGrenades", _signalsmokeGrenades - (_before getOrDefault ["signalsmokeGrenades", []])],
        ["maps", _maps - (_before getOrDefault ["maps", []])],
        ["watches", _watches - (_before getOrDefault ["watches", []])],
        ["compasses", _compasses - (_before getOrDefault ["compasses", []])],
        ["radios", _radios - (_before getOrDefault ["radios", []])],
        ["gpses", _gpses - (_before getOrDefault ["gpses", []])],
        ["NVGs", _NVGs - (_before getOrDefault ["NVGs", []])],
        ["binoculars", _binoculars - (_before getOrDefault ["binoculars", []])],
        ["rangefinders", _rangefinders - (_before getOrDefault ["rangefinders", []])],
        ["traitorUniforms", _traitorUniforms - (_before getOrDefault ["traitorUniforms", []])],
        ["traitorVests", _traitorVests - (_before getOrDefault ["traitorVests", []])],
        ["traitorHats", _traitorHats - (_before getOrDefault ["traitorHats", []])],
        ["officerUniforms", _officerUniforms - (_before getOrDefault ["officerUniforms", []])],
        ["officerVests", _officerVests - (_before getOrDefault ["officerVests", []])],
        ["officerHats", _officerHats - (_before getOrDefault ["officerHats", []])],
        ["cloakUniforms", _cloakUniforms - (_before getOrDefault ["cloakUniforms", []])],
        ["cloakVests", _cloakVests - (_before getOrDefault ["cloakVests", []])],
        ["cloakRifles", _cloakRifles - (_before getOrDefault ["cloakRifles", []])],
        ["cloakCarbines", _cloakCarbines - (_before getOrDefault ["cloakCarbines", []])],
        ["cloakSidearms", _cloakSidearms - (_before getOrDefault ["cloakSidearms", []])],
        ["uniforms", _uniforms - (_before getOrDefault ["uniforms", []])],
        ["slUniforms", _slUniforms - (_before getOrDefault ["slUniforms", []])],
        ["vests", _vests - (_before getOrDefault ["vests", []])],
        ["Hvests", _Hvests - (_before getOrDefault ["Hvests", []])],
        ["MGvests", _MGvests - (_before getOrDefault ["MGvests", []])],
        ["MEDvests", _MEDvests - (_before getOrDefault ["MEDvests", []])],
        ["SLvests", _SLvests - (_before getOrDefault ["SLvests", []])],
        ["SNIvests", _SNIvests - (_before getOrDefault ["SNIvests", []])],
        ["GLvests", _GLvests - (_before getOrDefault ["GLvests", []])],
        ["backpacks", _backpacks - (_before getOrDefault ["backpacks", []])],
        ["atBackpacks", _atBackpacks - (_before getOrDefault ["atBackpacks", []])],
        ["aaBackpacks", _aaBackpacks - (_before getOrDefault ["aaBackpacks", []])],
        ["medBackpacks", _medBackpacks - (_before getOrDefault ["medBackpacks", []])],
        ["engBackpacks", _engBackpacks - (_before getOrDefault ["engBackpacks", []])],
        ["expBackpacks", _expBackpacks - (_before getOrDefault ["expBackpacks", []])],
        ["longRangeRadios", _longRangeRadios - (_before getOrDefault ["longRangeRadios", []])],
        ["helmets", _helmets - (_before getOrDefault ["helmets", []])],
        ["slHat", _slHat - (_before getOrDefault ["slHat", []])],
        ["sniHats", _sniHats - (_before getOrDefault ["sniHats", []])],
        ["slItems", _slItems - (_before getOrDefault ["slItems", []])],
        ["rItems", _rItems - (_before getOrDefault ["rItems", []])],
        ["mItems", _mItems - (_before getOrDefault ["mItems", []])],
        ["gItems", _gItems - (_before getOrDefault ["gItems", []])],
        ["eeItems", _eeItems - (_before getOrDefault ["eeItems", []])],
        ["latItems", _latItems - (_before getOrDefault ["latItems", []])],
        ["atItems", _atItems - (_before getOrDefault ["atItems", []])],
        ["aaItems", _aaItems - (_before getOrDefault ["aaItems", []])],
        ["mgItems", _mgItems - (_before getOrDefault ["mgItems", []])],
        ["mmItems", _mmItems - (_before getOrDefault ["mmItems", []])],
        ["pItems", _pItems - (_before getOrDefault ["pItems", []])],
        ["cItems", _cItems - (_before getOrDefault ["cItems", []])],
        ["uItems", _uItems - (_before getOrDefault ["uItems", []])],
        ["glasses", _glasses - (_before getOrDefault ["glasses", []])],
        ["goggles", _goggles - (_before getOrDefault ["goggles", []])],
        ["sfslRifles", _sfslRifles - (_before getOrDefault ["sfslRifles", []])],
        ["sfrifles", _sfrifles - (_before getOrDefault ["sfrifles", []])],
        ["sfcarbines", _sfcarbines - (_before getOrDefault ["sfcarbines", []])],
        ["sfgrenadeLaunchers", _sfgrenadeLaunchers - (_before getOrDefault ["sfgrenadeLaunchers", []])],
        ["sfdesignatedGrenadeLaunchers", _sfdesignatedGrenadeLaunchers - (_before getOrDefault ["sfdesignatedGrenadeLaunchers", []])],
        ["sfSMGs", _sfSMGs - (_before getOrDefault ["sfSMGs", []])],
        ["sfmachineGuns", _sfmachineGuns - (_before getOrDefault ["sfmachineGuns", []])],
        ["sfmarksmanRifles", _sfmarksmanRifles - (_before getOrDefault ["sfmarksmanRifles", []])],
        ["sfsniperRifles", _sfsniperRifles - (_before getOrDefault ["sfsniperRifles", []])],
        ["sflightATLaunchers", _sflightATLaunchers - (_before getOrDefault ["sflightATLaunchers", []])],
        ["sflightHELaunchers", _sflightHELaunchers - (_before getOrDefault ["sflightHELaunchers", []])],
        ["sfATLaunchers", _sfATLaunchers - (_before getOrDefault ["sfATLaunchers", []])],
        ["sfmissleATLaunchers", _sfmissleATLaunchers - (_before getOrDefault ["sfmissleATLaunchers", []])],
        ["sfAALaunchers", _sfAALaunchers - (_before getOrDefault ["sfAALaunchers", []])],
        ["sfsidearms", _sfsidearms - (_before getOrDefault ["sfsidearms", []])],
        ["sfGLsidearms", _sfGLsidearms - (_before getOrDefault ["sfGLsidearms", []])],
        ["sfATMines", _sfATMines - (_before getOrDefault ["sfATMines", []])],
        ["sfAPMines", _sfAPMines - (_before getOrDefault ["sfAPMines", []])],
        ["sflightExplosives", _sflightExplosives - (_before getOrDefault ["sflightExplosives", []])],
        ["sfheavyExplosives", _sfheavyExplosives - (_before getOrDefault ["sfheavyExplosives", []])],
        ["sfantiInfantryGrenades", _sfantiInfantryGrenades - (_before getOrDefault ["sfantiInfantryGrenades", []])],
        ["sfsmokeGrenades", _sfsmokeGrenades - (_before getOrDefault ["sfsmokeGrenades", []])],
        ["sfsignalsmokeGrenades", _sfsignalsmokeGrenades - (_before getOrDefault ["sfsignalsmokeGrenades", []])],
        ["sfmaps", _sfmaps - (_before getOrDefault ["sfmaps", []])],
        ["sfwatches", _sfwatches - (_before getOrDefault ["sfwatches", []])],
        ["sfcompasses", _sfcompasses - (_before getOrDefault ["sfcompasses", []])],
        ["sfradios", _sfradios - (_before getOrDefault ["sfradios", []])],
        ["sfgpses", _sfgpses - (_before getOrDefault ["sfgpses", []])],
        ["sfNVGs", _sfNVGs - (_before getOrDefault ["sfNVGs", []])],
        ["sfbinoculars", _sfbinoculars - (_before getOrDefault ["sfbinoculars", []])],
        ["sfrangefinders", _sfrangefinders - (_before getOrDefault ["sfrangefinders", []])],
        ["sfuniforms", _sfuniforms - (_before getOrDefault ["sfuniforms", []])],
        ["sfslUniforms", _sfslUniforms - (_before getOrDefault ["sfslUniforms", []])],
        ["sfvests", _sfvests - (_before getOrDefault ["sfvests", []])],
        ["sfHvests", _sfHvests - (_before getOrDefault ["sfHvests", []])],
        ["sfMGvests", _sfMGvests - (_before getOrDefault ["sfMGvests", []])],
        ["sfMEDvests", _sfMEDvests - (_before getOrDefault ["sfMEDvests", []])],
        ["sfSLvests", _sfSLvests - (_before getOrDefault ["sfSLvests", []])],
        ["sfSNIvests", _sfSNIvests - (_before getOrDefault ["sfSNIvests", []])],
        ["sfGLvests", _sfGLvests - (_before getOrDefault ["sfGLvests", []])],
        ["sfbackpacks", _sfbackpacks - (_before getOrDefault ["sfbackpacks", []])],
        ["sfatBackpacks", _sfatBackpacks - (_before getOrDefault ["sfatBackpacks", []])],
        ["sfaaBackpacks", _sfaaBackpacks - (_before getOrDefault ["sfaaBackpacks", []])],
        ["sfmedBackpacks", _sfmedBackpacks - (_before getOrDefault ["sfmedBackpacks", []])],
        ["sfengBackpacks", _sfengBackpacks - (_before getOrDefault ["sfengBackpacks", []])],
        ["sfexpBackpacks", _sfexpBackpacks - (_before getOrDefault ["sfexpBackpacks", []])],
        ["sflongRangeRadios", _sflongRangeRadios - (_before getOrDefault ["sflongRangeRadios", []])],
        ["sfhelmets", _sfhelmets - (_before getOrDefault ["sfhelmets", []])],
        ["sfslHat", _sfslHat - (_before getOrDefault ["sfslHat", []])],
        ["sfsniHats", _sfsniHats - (_before getOrDefault ["sfsniHats", []])],
        ["sfglasses", _sfglasses - (_before getOrDefault ["sfglasses", []])],
        ["sfgoggles", _sfgoggles - (_before getOrDefault ["sfgoggles", []])],
        ["eliteslRifles", _eliteslRifles - (_before getOrDefault ["eliteslRifles", []])],
        ["eliterifles", _eliterifles - (_before getOrDefault ["eliterifles", []])],
        ["elitecarbines", _elitecarbines - (_before getOrDefault ["elitecarbines", []])],
        ["elitegrenadeLaunchers", _elitegrenadeLaunchers - (_before getOrDefault ["elitegrenadeLaunchers", []])],
        ["elitedesignatedGrenadeLaunchers", _elitedesignatedGrenadeLaunchers - (_before getOrDefault ["elitedesignatedGrenadeLaunchers", []])],
        ["eliteSMGs", _eliteSMGs - (_before getOrDefault ["eliteSMGs", []])],
        ["elitemachineGuns", _elitemachineGuns - (_before getOrDefault ["elitemachineGuns", []])],
        ["elitemarksmanRifles", _elitemarksmanRifles - (_before getOrDefault ["elitemarksmanRifles", []])],
        ["elitesniperRifles", _elitesniperRifles - (_before getOrDefault ["elitesniperRifles", []])],
        ["elitelightATLaunchers", _elitelightATLaunchers - (_before getOrDefault ["elitelightATLaunchers", []])],
        ["elitelightHELaunchers", _elitelightHELaunchers - (_before getOrDefault ["elitelightHELaunchers", []])],
        ["eliteATLaunchers", _eliteATLaunchers - (_before getOrDefault ["eliteATLaunchers", []])],
        ["elitemissleATLaunchers", _elitemissleATLaunchers - (_before getOrDefault ["elitemissleATLaunchers", []])],
        ["eliteAALaunchers", _eliteAALaunchers - (_before getOrDefault ["eliteAALaunchers", []])],
        ["elitesidearms", _elitesidearms - (_before getOrDefault ["elitesidearms", []])],
        ["eliteGLsidearms", _eliteGLsidearms - (_before getOrDefault ["eliteGLsidearms", []])],
        ["eliteATMines", _eliteATMines - (_before getOrDefault ["eliteATMines", []])],
        ["eliteAPMines", _eliteAPMines - (_before getOrDefault ["eliteAPMines", []])],
        ["elitelightExplosives", _elitelightExplosives - (_before getOrDefault ["elitelightExplosives", []])],
        ["eliteheavyExplosives", _eliteheavyExplosives - (_before getOrDefault ["eliteheavyExplosives", []])],
        ["eliteantiInfantryGrenades", _eliteantiInfantryGrenades - (_before getOrDefault ["eliteantiInfantryGrenades", []])],
        ["elitesmokeGrenades", _elitesmokeGrenades - (_before getOrDefault ["elitesmokeGrenades", []])],
        ["elitesignalsmokeGrenades", _elitesignalsmokeGrenades - (_before getOrDefault ["elitesignalsmokeGrenades", []])],
        ["elitemaps", _elitemaps - (_before getOrDefault ["elitemaps", []])],
        ["elitewatches", _elitewatches - (_before getOrDefault ["elitewatches", []])],
        ["elitecompasses", _elitecompasses - (_before getOrDefault ["elitecompasses", []])],
        ["eliteradios", _eliteradios - (_before getOrDefault ["eliteradios", []])],
        ["elitegpses", _elitegpses - (_before getOrDefault ["elitegpses", []])],
        ["eliteNVGs", _eliteNVGs - (_before getOrDefault ["eliteNVGs", []])],
        ["elitebinoculars", _elitebinoculars - (_before getOrDefault ["elitebinoculars", []])],
        ["eliterangefinders", _eliterangefinders - (_before getOrDefault ["eliterangefinders", []])],
        ["eliteuniforms", _eliteuniforms - (_before getOrDefault ["eliteuniforms", []])],
        ["eliteslUniforms", _eliteslUniforms - (_before getOrDefault ["eliteslUniforms", []])],
        ["elitevests", _elitevests - (_before getOrDefault ["elitevests", []])],
        ["eliteHvests", _eliteHvests - (_before getOrDefault ["eliteHvests", []])],
        ["eliteMGvests", _eliteMGvests - (_before getOrDefault ["eliteMGvests", []])],
        ["eliteMEDvests", _eliteMEDvests - (_before getOrDefault ["eliteMEDvests", []])],
        ["eliteSLvests", _eliteSLvests - (_before getOrDefault ["eliteSLvests", []])],
        ["eliteSNIvests", _eliteSNIvests - (_before getOrDefault ["eliteSNIvests", []])],
        ["eliteGLvests", _eliteGLvests - (_before getOrDefault ["eliteGLvests", []])],
        ["elitebackpacks", _elitebackpacks - (_before getOrDefault ["elitebackpacks", []])],
        ["eliteatBackpacks", _eliteatBackpacks - (_before getOrDefault ["eliteatBackpacks", []])],
        ["eliteaaBackpacks", _eliteaaBackpacks - (_before getOrDefault ["eliteaaBackpacks", []])],
        ["elitemedBackpacks", _elitemedBackpacks - (_before getOrDefault ["elitemedBackpacks", []])],
        ["eliteengBackpacks", _eliteengBackpacks - (_before getOrDefault ["eliteengBackpacks", []])],
        ["eliteexpBackpacks", _eliteexpBackpacks - (_before getOrDefault ["eliteexpBackpacks", []])],
        ["elitelongRangeRadios", _elitelongRangeRadios - (_before getOrDefault ["elitelongRangeRadios", []])],
        ["elitehelmets", _elitehelmets - (_before getOrDefault ["elitehelmets", []])],
        ["eliteslHat", _eliteslHat - (_before getOrDefault ["eliteslHat", []])],
        ["elitesniHats", _elitesniHats - (_before getOrDefault ["elitesniHats", []])],
        ["eliteglasses", _eliteglasses - (_before getOrDefault ["eliteglasses", []])],
        ["elitegoggles", _elitegoggles - (_before getOrDefault ["elitegoggles", []])],
        ["militaryslRifles", _militaryslRifles - (_before getOrDefault ["militaryslRifles", []])],
        ["militaryrifles", _militaryrifles - (_before getOrDefault ["militaryrifles", []])],
        ["militarycarbines", _militarycarbines - (_before getOrDefault ["militarycarbines", []])],
        ["militarygrenadeLaunchers", _militarygrenadeLaunchers - (_before getOrDefault ["militarygrenadeLaunchers", []])],
        ["militarydesignatedGrenadeLaunchers", _militarydesignatedGrenadeLaunchers - (_before getOrDefault ["militarydesignatedGrenadeLaunchers", []])],
        ["militarySMGs", _militarySMGs - (_before getOrDefault ["militarySMGs", []])],
        ["militarymachineGuns", _militarymachineGuns - (_before getOrDefault ["militarymachineGuns", []])],
        ["militarymarksmanRifles", _militarymarksmanRifles - (_before getOrDefault ["militarymarksmanRifles", []])],
        ["militarysniperRifles", _militarysniperRifles - (_before getOrDefault ["militarysniperRifles", []])],
        ["militarylightATLaunchers", _militarylightATLaunchers - (_before getOrDefault ["militarylightATLaunchers", []])],
        ["militarylightHELaunchers", _militarylightHELaunchers - (_before getOrDefault ["militarylightHELaunchers", []])],
        ["militaryATLaunchers", _militaryATLaunchers - (_before getOrDefault ["militaryATLaunchers", []])],
        ["militarymissleATLaunchers", _militarymissleATLaunchers - (_before getOrDefault ["militarymissleATLaunchers", []])],
        ["militaryAALaunchers", _militaryAALaunchers - (_before getOrDefault ["militaryAALaunchers", []])],
        ["militarysidearms", _militarysidearms - (_before getOrDefault ["militarysidearms", []])],
        ["militaryGLsidearms", _militaryGLsidearms - (_before getOrDefault ["militaryGLsidearms", []])],
        ["militaryATMines", _militaryATMines - (_before getOrDefault ["militaryATMines", []])],
        ["militaryAPMines", _militaryAPMines - (_before getOrDefault ["militaryAPMines", []])],
        ["militarylightExplosives", _militarylightExplosives - (_before getOrDefault ["militarylightExplosives", []])],
        ["militaryheavyExplosives", _militaryheavyExplosives - (_before getOrDefault ["militaryheavyExplosives", []])],
        ["militaryantiInfantryGrenades", _militaryantiInfantryGrenades - (_before getOrDefault ["militaryantiInfantryGrenades", []])],
        ["militarysmokeGrenades", _militarysmokeGrenades - (_before getOrDefault ["militarysmokeGrenades", []])],
        ["militarysignalsmokeGrenades", _militarysignalsmokeGrenades - (_before getOrDefault ["militarysignalsmokeGrenades", []])],
        ["militarymaps", _militarymaps - (_before getOrDefault ["militarymaps", []])],
        ["militarywatches", _militarywatches - (_before getOrDefault ["militarywatches", []])],
        ["militarycompasses", _militarycompasses - (_before getOrDefault ["militarycompasses", []])],
        ["militaryradios", _militaryradios - (_before getOrDefault ["militaryradios", []])],
        ["militarygpses", _militarygpses - (_before getOrDefault ["militarygpses", []])],
        ["militaryNVGs", _militaryNVGs - (_before getOrDefault ["militaryNVGs", []])],
        ["militarybinoculars", _militarybinoculars - (_before getOrDefault ["militarybinoculars", []])],
        ["militaryrangefinders", _militaryrangefinders - (_before getOrDefault ["militaryrangefinders", []])],
        ["militaryuniforms", _militaryuniforms - (_before getOrDefault ["militaryuniforms", []])],
        ["militaryslUniforms", _militaryslUniforms - (_before getOrDefault ["militaryslUniforms", []])],
        ["militaryvests", _militaryvests - (_before getOrDefault ["militaryvests", []])],
        ["militaryHvests", _militaryHvests - (_before getOrDefault ["militaryHvests", []])],
        ["militaryMGvests", _militaryMGvests - (_before getOrDefault ["militaryMGvests", []])],
        ["militaryMEDvests", _militaryMEDvests - (_before getOrDefault ["militaryMEDvests", []])],
        ["militarySLvests", _militarySLvests - (_before getOrDefault ["militarySLvests", []])],
        ["militarySNIvests", _militarySNIvests - (_before getOrDefault ["militarySNIvests", []])],
        ["militaryGLvests", _militaryGLvests - (_before getOrDefault ["militaryGLvests", []])],
        ["militarybackpacks", _militarybackpacks - (_before getOrDefault ["militarybackpacks", []])],
        ["militaryatBackpacks", _militaryatBackpacks - (_before getOrDefault ["militaryatBackpacks", []])],
        ["militaryaaBackpacks", _militaryaaBackpacks - (_before getOrDefault ["militaryaaBackpacks", []])],
        ["militarymedBackpacks", _militarymedBackpacks - (_before getOrDefault ["militarymedBackpacks", []])],
        ["militaryengBackpacks", _militaryengBackpacks - (_before getOrDefault ["militaryengBackpacks", []])],
        ["militaryexpBackpacks", _militaryexpBackpacks - (_before getOrDefault ["militaryexpBackpacks", []])],
        ["militarylongRangeRadios", _militarylongRangeRadios - (_before getOrDefault ["militarylongRangeRadios", []])],
        ["militaryhelmets", _militaryhelmets - (_before getOrDefault ["militaryhelmets", []])],
        ["militaryslHat", _militaryslHat - (_before getOrDefault ["militaryslHat", []])],
        ["militarysniHats", _militarysniHats - (_before getOrDefault ["militarysniHats", []])],
        ["militaryglasses", _militaryglasses - (_before getOrDefault ["militaryglasses", []])],
        ["militarygoggles", _militarygoggles - (_before getOrDefault ["militarygoggles", []])],
        ["policeuniforms", _policeuniforms - (_before getOrDefault ["policeuniforms", []])],
        ["policevests", _policevests - (_before getOrDefault ["policevests", []])],
        ["policehelmets", _policehelmets - (_before getOrDefault ["policehelmets", []])],
        ["policeWeapons", _policeWeapons - (_before getOrDefault ["policeWeapons", []])],
        ["policesidearms", _policesidearms - (_before getOrDefault ["policesidearms", []])],
        ["militiaslRifles", _militiaslRifles - (_before getOrDefault ["militiaslRifles", []])],
        ["militiarifles", _militiarifles - (_before getOrDefault ["militiarifles", []])],
        ["militiacarbines", _militiacarbines - (_before getOrDefault ["militiacarbines", []])],
        ["militiagrenadeLaunchers", _militiagrenadeLaunchers - (_before getOrDefault ["militiagrenadeLaunchers", []])],
        ["militiadesignatedGrenadeLaunchers", _militiadesignatedGrenadeLaunchers - (_before getOrDefault ["militiadesignatedGrenadeLaunchers", []])],
        ["militiaSMGs", _militiaSMGs - (_before getOrDefault ["militiaSMGs", []])],
        ["militiamachineGuns", _militiamachineGuns - (_before getOrDefault ["militiamachineGuns", []])],
        ["militiamarksmanRifles", _militiamarksmanRifles - (_before getOrDefault ["militiamarksmanRifles", []])],
        ["militiasniperRifles", _militiasniperRifles - (_before getOrDefault ["militiasniperRifles", []])],
        ["militialightATLaunchers", _militialightATLaunchers - (_before getOrDefault ["militialightATLaunchers", []])],
        ["militialightHELaunchers", _militialightHELaunchers - (_before getOrDefault ["militialightHELaunchers", []])],
        ["militiaATLaunchers", _militiaATLaunchers - (_before getOrDefault ["militiaATLaunchers", []])],
        ["militiamissleATLaunchers", _militiamissleATLaunchers - (_before getOrDefault ["militiamissleATLaunchers", []])],
        ["militiaAALaunchers", _militiaAALaunchers - (_before getOrDefault ["militiaAALaunchers", []])],
        ["militiasidearms", _militiasidearms - (_before getOrDefault ["militiasidearms", []])],
        ["militiaGLsidearms", _militiaGLsidearms - (_before getOrDefault ["militiaGLsidearms", []])],
        ["militiaATMines", _militiaATMines - (_before getOrDefault ["militiaATMines", []])],
        ["militiaAPMines", _militiaAPMines - (_before getOrDefault ["militiaAPMines", []])],
        ["militialightExplosives", _militialightExplosives - (_before getOrDefault ["militialightExplosives", []])],
        ["militiaheavyExplosives", _militiaheavyExplosives - (_before getOrDefault ["militiaheavyExplosives", []])],
        ["militiaantiInfantryGrenades", _militiaantiInfantryGrenades - (_before getOrDefault ["militiaantiInfantryGrenades", []])],
        ["militiasmokeGrenades", _militiasmokeGrenades - (_before getOrDefault ["militiasmokeGrenades", []])],
        ["militiasignalsmokeGrenades", _militiasignalsmokeGrenades - (_before getOrDefault ["militiasignalsmokeGrenades", []])],
        ["militiamaps", _militiamaps - (_before getOrDefault ["militiamaps", []])],
        ["militiawatches", _militiawatches - (_before getOrDefault ["militiawatches", []])],
        ["militiacompasses", _militiacompasses - (_before getOrDefault ["militiacompasses", []])],
        ["militiaradios", _militiaradios - (_before getOrDefault ["militiaradios", []])],
        ["militiagpses", _militiagpses - (_before getOrDefault ["militiagpses", []])],
        ["militiaNVGs", _militiaNVGs - (_before getOrDefault ["militiaNVGs", []])],
        ["militiabinoculars", _militiabinoculars - (_before getOrDefault ["militiabinoculars", []])],
        ["militiarangefinders", _militiarangefinders - (_before getOrDefault ["militiarangefinders", []])],
        ["militiauniforms", _militiauniforms - (_before getOrDefault ["militiauniforms", []])],
        ["militiaslUniforms", _militiaslUniforms - (_before getOrDefault ["militiaslUniforms", []])],
        ["militiavests", _militiavests - (_before getOrDefault ["militiavests", []])],
        ["militiaHvests", _militiaHvests - (_before getOrDefault ["militiaHvests", []])],
        ["militiaMGvests", _militiaMGvests - (_before getOrDefault ["militiaMGvests", []])],
        ["militiaMEDvests", _militiaMEDvests - (_before getOrDefault ["militiaMEDvests", []])],
        ["militiaSLvests", _militiaSLvests - (_before getOrDefault ["militiaSLvests", []])],
        ["militiaSNIvests", _militiaSNIvests - (_before getOrDefault ["militiaSNIvests", []])],
        ["militiaGLvests", _militiaGLvests - (_before getOrDefault ["militiaGLvests", []])],
        ["militiabackpacks", _militiabackpacks - (_before getOrDefault ["militiabackpacks", []])],
        ["militiaatBackpacks", _militiaatBackpacks - (_before getOrDefault ["militiaatBackpacks", []])],
        ["militiaaaBackpacks", _militiaaaBackpacks - (_before getOrDefault ["militiaaaBackpacks", []])],
        ["militiamedBackpacks", _militiamedBackpacks - (_before getOrDefault ["militiamedBackpacks", []])],
        ["militiaengBackpacks", _militiaengBackpacks - (_before getOrDefault ["militiaengBackpacks", []])],
        ["militiaexpBackpacks", _militiaexpBackpacks - (_before getOrDefault ["militiaexpBackpacks", []])],
        ["militialongRangeRadios", _militialongRangeRadios - (_before getOrDefault ["militialongRangeRadios", []])],
        ["militiahelmets", _militiahelmets - (_before getOrDefault ["militiahelmets", []])],
        ["militiaslHat", _militiaslHat - (_before getOrDefault ["militiaslHat", []])],
        ["militiasniHats", _militiasniHats - (_before getOrDefault ["militiasniHats", []])],
        ["militiaglasses", _militiaglasses - (_before getOrDefault ["militiaglasses", []])],
        ["militiagoggles", _militiagoggles - (_before getOrDefault ["militiagoggles", []])],
        ["crewuniforms", _crewuniforms - (_before getOrDefault ["crewuniforms", []])],
        ["crewvests", _crewvests - (_before getOrDefault ["crewvests", []])],
        ["crewhelmets", _crewhelmets - (_before getOrDefault ["crewhelmets", []])],
        ["crewcarbines", _crewcarbines - (_before getOrDefault ["crewcarbines", []])],
        ["crewSMGs", _crewSMGs - (_before getOrDefault ["crewSMGs", []])],
        ["pilotuniforms", _pilotuniforms - (_before getOrDefault ["pilotuniforms", []])],
        ["pilotvests", _pilotvests - (_before getOrDefault ["pilotvests", []])],
        ["pilothelmets", _pilothelmets - (_before getOrDefault ["pilothelmets", []])],
        ["pilotSMGs", _pilotSMGs - (_before getOrDefault ["pilotSMGs", []])]
    ];

    _gearFactionPools set [_factionName, _pool];

    // Roll back only gear/loadout arrays. Vehicle arrays remain mixed/global.
    _slRifles = +(_before getOrDefault ["slRifles", []]);
    _rifles = +(_before getOrDefault ["rifles", []]);
    _carbines = +(_before getOrDefault ["carbines", []]);
    _grenadeLaunchers = +(_before getOrDefault ["grenadeLaunchers", []]);
    _designatedGrenadeLaunchers = +(_before getOrDefault ["designatedGrenadeLaunchers", []]);
    _SMGs = +(_before getOrDefault ["SMGs", []]);
    _machineGuns = +(_before getOrDefault ["machineGuns", []]);
    _marksmanRifles = +(_before getOrDefault ["marksmanRifles", []]);
    _sniperRifles = +(_before getOrDefault ["sniperRifles", []]);
    _lightATLaunchers = +(_before getOrDefault ["lightATLaunchers", []]);
    _lightHELaunchers = +(_before getOrDefault ["lightHELaunchers", []]);
    _ATLaunchers = +(_before getOrDefault ["ATLaunchers", []]);
    _missleATLaunchers = +(_before getOrDefault ["missleATLaunchers", []]);
    _AALaunchers = +(_before getOrDefault ["AALaunchers", []]);
    _sidearms = +(_before getOrDefault ["sidearms", []]);
    _GLsidearms = +(_before getOrDefault ["GLsidearms", []]);
    _ATMines = +(_before getOrDefault ["ATMines", []]);
    _APMines = +(_before getOrDefault ["APMines", []]);
    _lightExplosives = +(_before getOrDefault ["lightExplosives", []]);
    _heavyExplosives = +(_before getOrDefault ["heavyExplosives", []]);
    _antiInfantryGrenades = +(_before getOrDefault ["antiInfantryGrenades", []]);
    _antiTankGrenades = +(_before getOrDefault ["antiTankGrenades", []]);
    _smokeGrenades = +(_before getOrDefault ["smokeGrenades", []]);
    _signalsmokeGrenades = +(_before getOrDefault ["signalsmokeGrenades", []]);
    _maps = +(_before getOrDefault ["maps", []]);
    _watches = +(_before getOrDefault ["watches", []]);
    _compasses = +(_before getOrDefault ["compasses", []]);
    _radios = +(_before getOrDefault ["radios", []]);
    _gpses = +(_before getOrDefault ["gpses", []]);
    _NVGs = +(_before getOrDefault ["NVGs", []]);
    _binoculars = +(_before getOrDefault ["binoculars", []]);
    _rangefinders = +(_before getOrDefault ["rangefinders", []]);
    _traitorUniforms = +(_before getOrDefault ["traitorUniforms", []]);
    _traitorVests = +(_before getOrDefault ["traitorVests", []]);
    _traitorHats = +(_before getOrDefault ["traitorHats", []]);
    _officerUniforms = +(_before getOrDefault ["officerUniforms", []]);
    _officerVests = +(_before getOrDefault ["officerVests", []]);
    _officerHats = +(_before getOrDefault ["officerHats", []]);
    _cloakUniforms = +(_before getOrDefault ["cloakUniforms", []]);
    _cloakVests = +(_before getOrDefault ["cloakVests", []]);
    _cloakRifles = +(_before getOrDefault ["cloakRifles", []]);
    _cloakCarbines = +(_before getOrDefault ["cloakCarbines", []]);
    _cloakSidearms = +(_before getOrDefault ["cloakSidearms", []]);
    _uniforms = +(_before getOrDefault ["uniforms", []]);
    _slUniforms = +(_before getOrDefault ["slUniforms", []]);
    _vests = +(_before getOrDefault ["vests", []]);
    _Hvests = +(_before getOrDefault ["Hvests", []]);
    _MGvests = +(_before getOrDefault ["MGvests", []]);
    _MEDvests = +(_before getOrDefault ["MEDvests", []]);
    _SLvests = +(_before getOrDefault ["SLvests", []]);
    _SNIvests = +(_before getOrDefault ["SNIvests", []]);
    _GLvests = +(_before getOrDefault ["GLvests", []]);
    _backpacks = +(_before getOrDefault ["backpacks", []]);
    _atBackpacks = +(_before getOrDefault ["atBackpacks", []]);
    _aaBackpacks = +(_before getOrDefault ["aaBackpacks", []]);
    _medBackpacks = +(_before getOrDefault ["medBackpacks", []]);
    _engBackpacks = +(_before getOrDefault ["engBackpacks", []]);
    _expBackpacks = +(_before getOrDefault ["expBackpacks", []]);
    _longRangeRadios = +(_before getOrDefault ["longRangeRadios", []]);
    _helmets = +(_before getOrDefault ["helmets", []]);
    _slHat = +(_before getOrDefault ["slHat", []]);
    _sniHats = +(_before getOrDefault ["sniHats", []]);
    _slItems = +(_before getOrDefault ["slItems", []]);
    _rItems = +(_before getOrDefault ["rItems", []]);
    _mItems = +(_before getOrDefault ["mItems", []]);
    _gItems = +(_before getOrDefault ["gItems", []]);
    _eeItems = +(_before getOrDefault ["eeItems", []]);
    _latItems = +(_before getOrDefault ["latItems", []]);
    _atItems = +(_before getOrDefault ["atItems", []]);
    _aaItems = +(_before getOrDefault ["aaItems", []]);
    _mgItems = +(_before getOrDefault ["mgItems", []]);
    _mmItems = +(_before getOrDefault ["mmItems", []]);
    _pItems = +(_before getOrDefault ["pItems", []]);
    _cItems = +(_before getOrDefault ["cItems", []]);
    _uItems = +(_before getOrDefault ["uItems", []]);
    _glasses = +(_before getOrDefault ["glasses", []]);
    _goggles = +(_before getOrDefault ["goggles", []]);
    _sfslRifles = +(_before getOrDefault ["sfslRifles", []]);
    _sfrifles = +(_before getOrDefault ["sfrifles", []]);
    _sfcarbines = +(_before getOrDefault ["sfcarbines", []]);
    _sfgrenadeLaunchers = +(_before getOrDefault ["sfgrenadeLaunchers", []]);
    _sfdesignatedGrenadeLaunchers = +(_before getOrDefault ["sfdesignatedGrenadeLaunchers", []]);
    _sfSMGs = +(_before getOrDefault ["sfSMGs", []]);
    _sfmachineGuns = +(_before getOrDefault ["sfmachineGuns", []]);
    _sfmarksmanRifles = +(_before getOrDefault ["sfmarksmanRifles", []]);
    _sfsniperRifles = +(_before getOrDefault ["sfsniperRifles", []]);
    _sflightATLaunchers = +(_before getOrDefault ["sflightATLaunchers", []]);
    _sflightHELaunchers = +(_before getOrDefault ["sflightHELaunchers", []]);
    _sfATLaunchers = +(_before getOrDefault ["sfATLaunchers", []]);
    _sfmissleATLaunchers = +(_before getOrDefault ["sfmissleATLaunchers", []]);
    _sfAALaunchers = +(_before getOrDefault ["sfAALaunchers", []]);
    _sfsidearms = +(_before getOrDefault ["sfsidearms", []]);
    _sfGLsidearms = +(_before getOrDefault ["sfGLsidearms", []]);
    _sfATMines = +(_before getOrDefault ["sfATMines", []]);
    _sfAPMines = +(_before getOrDefault ["sfAPMines", []]);
    _sflightExplosives = +(_before getOrDefault ["sflightExplosives", []]);
    _sfheavyExplosives = +(_before getOrDefault ["sfheavyExplosives", []]);
    _sfantiInfantryGrenades = +(_before getOrDefault ["sfantiInfantryGrenades", []]);
    _sfsmokeGrenades = +(_before getOrDefault ["sfsmokeGrenades", []]);
    _sfsignalsmokeGrenades = +(_before getOrDefault ["sfsignalsmokeGrenades", []]);
    _sfmaps = +(_before getOrDefault ["sfmaps", []]);
    _sfwatches = +(_before getOrDefault ["sfwatches", []]);
    _sfcompasses = +(_before getOrDefault ["sfcompasses", []]);
    _sfradios = +(_before getOrDefault ["sfradios", []]);
    _sfgpses = +(_before getOrDefault ["sfgpses", []]);
    _sfNVGs = +(_before getOrDefault ["sfNVGs", []]);
    _sfbinoculars = +(_before getOrDefault ["sfbinoculars", []]);
    _sfrangefinders = +(_before getOrDefault ["sfrangefinders", []]);
    _sfuniforms = +(_before getOrDefault ["sfuniforms", []]);
    _sfslUniforms = +(_before getOrDefault ["sfslUniforms", []]);
    _sfvests = +(_before getOrDefault ["sfvests", []]);
    _sfHvests = +(_before getOrDefault ["sfHvests", []]);
    _sfMGvests = +(_before getOrDefault ["sfMGvests", []]);
    _sfMEDvests = +(_before getOrDefault ["sfMEDvests", []]);
    _sfSLvests = +(_before getOrDefault ["sfSLvests", []]);
    _sfSNIvests = +(_before getOrDefault ["sfSNIvests", []]);
    _sfGLvests = +(_before getOrDefault ["sfGLvests", []]);
    _sfbackpacks = +(_before getOrDefault ["sfbackpacks", []]);
    _sfatBackpacks = +(_before getOrDefault ["sfatBackpacks", []]);
    _sfaaBackpacks = +(_before getOrDefault ["sfaaBackpacks", []]);
    _sfmedBackpacks = +(_before getOrDefault ["sfmedBackpacks", []]);
    _sfengBackpacks = +(_before getOrDefault ["sfengBackpacks", []]);
    _sfexpBackpacks = +(_before getOrDefault ["sfexpBackpacks", []]);
    _sflongRangeRadios = +(_before getOrDefault ["sflongRangeRadios", []]);
    _sfhelmets = +(_before getOrDefault ["sfhelmets", []]);
    _sfslHat = +(_before getOrDefault ["sfslHat", []]);
    _sfsniHats = +(_before getOrDefault ["sfsniHats", []]);
    _sfglasses = +(_before getOrDefault ["sfglasses", []]);
    _sfgoggles = +(_before getOrDefault ["sfgoggles", []]);
    _eliteslRifles = +(_before getOrDefault ["eliteslRifles", []]);
    _eliterifles = +(_before getOrDefault ["eliterifles", []]);
    _elitecarbines = +(_before getOrDefault ["elitecarbines", []]);
    _elitegrenadeLaunchers = +(_before getOrDefault ["elitegrenadeLaunchers", []]);
    _elitedesignatedGrenadeLaunchers = +(_before getOrDefault ["elitedesignatedGrenadeLaunchers", []]);
    _eliteSMGs = +(_before getOrDefault ["eliteSMGs", []]);
    _elitemachineGuns = +(_before getOrDefault ["elitemachineGuns", []]);
    _elitemarksmanRifles = +(_before getOrDefault ["elitemarksmanRifles", []]);
    _elitesniperRifles = +(_before getOrDefault ["elitesniperRifles", []]);
    _elitelightATLaunchers = +(_before getOrDefault ["elitelightATLaunchers", []]);
    _elitelightHELaunchers = +(_before getOrDefault ["elitelightHELaunchers", []]);
    _eliteATLaunchers = +(_before getOrDefault ["eliteATLaunchers", []]);
    _elitemissleATLaunchers = +(_before getOrDefault ["elitemissleATLaunchers", []]);
    _eliteAALaunchers = +(_before getOrDefault ["eliteAALaunchers", []]);
    _elitesidearms = +(_before getOrDefault ["elitesidearms", []]);
    _eliteGLsidearms = +(_before getOrDefault ["eliteGLsidearms", []]);
    _eliteATMines = +(_before getOrDefault ["eliteATMines", []]);
    _eliteAPMines = +(_before getOrDefault ["eliteAPMines", []]);
    _elitelightExplosives = +(_before getOrDefault ["elitelightExplosives", []]);
    _eliteheavyExplosives = +(_before getOrDefault ["eliteheavyExplosives", []]);
    _eliteantiInfantryGrenades = +(_before getOrDefault ["eliteantiInfantryGrenades", []]);
    _elitesmokeGrenades = +(_before getOrDefault ["elitesmokeGrenades", []]);
    _elitesignalsmokeGrenades = +(_before getOrDefault ["elitesignalsmokeGrenades", []]);
    _elitemaps = +(_before getOrDefault ["elitemaps", []]);
    _elitewatches = +(_before getOrDefault ["elitewatches", []]);
    _elitecompasses = +(_before getOrDefault ["elitecompasses", []]);
    _eliteradios = +(_before getOrDefault ["eliteradios", []]);
    _elitegpses = +(_before getOrDefault ["elitegpses", []]);
    _eliteNVGs = +(_before getOrDefault ["eliteNVGs", []]);
    _elitebinoculars = +(_before getOrDefault ["elitebinoculars", []]);
    _eliterangefinders = +(_before getOrDefault ["eliterangefinders", []]);
    _eliteuniforms = +(_before getOrDefault ["eliteuniforms", []]);
    _eliteslUniforms = +(_before getOrDefault ["eliteslUniforms", []]);
    _elitevests = +(_before getOrDefault ["elitevests", []]);
    _eliteHvests = +(_before getOrDefault ["eliteHvests", []]);
    _eliteMGvests = +(_before getOrDefault ["eliteMGvests", []]);
    _eliteMEDvests = +(_before getOrDefault ["eliteMEDvests", []]);
    _eliteSLvests = +(_before getOrDefault ["eliteSLvests", []]);
    _eliteSNIvests = +(_before getOrDefault ["eliteSNIvests", []]);
    _eliteGLvests = +(_before getOrDefault ["eliteGLvests", []]);
    _elitebackpacks = +(_before getOrDefault ["elitebackpacks", []]);
    _eliteatBackpacks = +(_before getOrDefault ["eliteatBackpacks", []]);
    _eliteaaBackpacks = +(_before getOrDefault ["eliteaaBackpacks", []]);
    _elitemedBackpacks = +(_before getOrDefault ["elitemedBackpacks", []]);
    _eliteengBackpacks = +(_before getOrDefault ["eliteengBackpacks", []]);
    _eliteexpBackpacks = +(_before getOrDefault ["eliteexpBackpacks", []]);
    _elitelongRangeRadios = +(_before getOrDefault ["elitelongRangeRadios", []]);
    _elitehelmets = +(_before getOrDefault ["elitehelmets", []]);
    _eliteslHat = +(_before getOrDefault ["eliteslHat", []]);
    _elitesniHats = +(_before getOrDefault ["elitesniHats", []]);
    _eliteglasses = +(_before getOrDefault ["eliteglasses", []]);
    _elitegoggles = +(_before getOrDefault ["elitegoggles", []]);
    _militaryslRifles = +(_before getOrDefault ["militaryslRifles", []]);
    _militaryrifles = +(_before getOrDefault ["militaryrifles", []]);
    _militarycarbines = +(_before getOrDefault ["militarycarbines", []]);
    _militarygrenadeLaunchers = +(_before getOrDefault ["militarygrenadeLaunchers", []]);
    _militarydesignatedGrenadeLaunchers = +(_before getOrDefault ["militarydesignatedGrenadeLaunchers", []]);
    _militarySMGs = +(_before getOrDefault ["militarySMGs", []]);
    _militarymachineGuns = +(_before getOrDefault ["militarymachineGuns", []]);
    _militarymarksmanRifles = +(_before getOrDefault ["militarymarksmanRifles", []]);
    _militarysniperRifles = +(_before getOrDefault ["militarysniperRifles", []]);
    _militarylightATLaunchers = +(_before getOrDefault ["militarylightATLaunchers", []]);
    _militarylightHELaunchers = +(_before getOrDefault ["militarylightHELaunchers", []]);
    _militaryATLaunchers = +(_before getOrDefault ["militaryATLaunchers", []]);
    _militarymissleATLaunchers = +(_before getOrDefault ["militarymissleATLaunchers", []]);
    _militaryAALaunchers = +(_before getOrDefault ["militaryAALaunchers", []]);
    _militarysidearms = +(_before getOrDefault ["militarysidearms", []]);
    _militaryGLsidearms = +(_before getOrDefault ["militaryGLsidearms", []]);
    _militaryATMines = +(_before getOrDefault ["militaryATMines", []]);
    _militaryAPMines = +(_before getOrDefault ["militaryAPMines", []]);
    _militarylightExplosives = +(_before getOrDefault ["militarylightExplosives", []]);
    _militaryheavyExplosives = +(_before getOrDefault ["militaryheavyExplosives", []]);
    _militaryantiInfantryGrenades = +(_before getOrDefault ["militaryantiInfantryGrenades", []]);
    _militarysmokeGrenades = +(_before getOrDefault ["militarysmokeGrenades", []]);
    _militarysignalsmokeGrenades = +(_before getOrDefault ["militarysignalsmokeGrenades", []]);
    _militarymaps = +(_before getOrDefault ["militarymaps", []]);
    _militarywatches = +(_before getOrDefault ["militarywatches", []]);
    _militarycompasses = +(_before getOrDefault ["militarycompasses", []]);
    _militaryradios = +(_before getOrDefault ["militaryradios", []]);
    _militarygpses = +(_before getOrDefault ["militarygpses", []]);
    _militaryNVGs = +(_before getOrDefault ["militaryNVGs", []]);
    _militarybinoculars = +(_before getOrDefault ["militarybinoculars", []]);
    _militaryrangefinders = +(_before getOrDefault ["militaryrangefinders", []]);
    _militaryuniforms = +(_before getOrDefault ["militaryuniforms", []]);
    _militaryslUniforms = +(_before getOrDefault ["militaryslUniforms", []]);
    _militaryvests = +(_before getOrDefault ["militaryvests", []]);
    _militaryHvests = +(_before getOrDefault ["militaryHvests", []]);
    _militaryMGvests = +(_before getOrDefault ["militaryMGvests", []]);
    _militaryMEDvests = +(_before getOrDefault ["militaryMEDvests", []]);
    _militarySLvests = +(_before getOrDefault ["militarySLvests", []]);
    _militarySNIvests = +(_before getOrDefault ["militarySNIvests", []]);
    _militaryGLvests = +(_before getOrDefault ["militaryGLvests", []]);
    _militarybackpacks = +(_before getOrDefault ["militarybackpacks", []]);
    _militaryatBackpacks = +(_before getOrDefault ["militaryatBackpacks", []]);
    _militaryaaBackpacks = +(_before getOrDefault ["militaryaaBackpacks", []]);
    _militarymedBackpacks = +(_before getOrDefault ["militarymedBackpacks", []]);
    _militaryengBackpacks = +(_before getOrDefault ["militaryengBackpacks", []]);
    _militaryexpBackpacks = +(_before getOrDefault ["militaryexpBackpacks", []]);
    _militarylongRangeRadios = +(_before getOrDefault ["militarylongRangeRadios", []]);
    _militaryhelmets = +(_before getOrDefault ["militaryhelmets", []]);
    _militaryslHat = +(_before getOrDefault ["militaryslHat", []]);
    _militarysniHats = +(_before getOrDefault ["militarysniHats", []]);
    _militaryglasses = +(_before getOrDefault ["militaryglasses", []]);
    _militarygoggles = +(_before getOrDefault ["militarygoggles", []]);
    _policeuniforms = +(_before getOrDefault ["policeuniforms", []]);
    _policevests = +(_before getOrDefault ["policevests", []]);
    _policehelmets = +(_before getOrDefault ["policehelmets", []]);
    _policeWeapons = +(_before getOrDefault ["policeWeapons", []]);
    _policesidearms = +(_before getOrDefault ["policesidearms", []]);
    _militiaslRifles = +(_before getOrDefault ["militiaslRifles", []]);
    _militiarifles = +(_before getOrDefault ["militiarifles", []]);
    _militiacarbines = +(_before getOrDefault ["militiacarbines", []]);
    _militiagrenadeLaunchers = +(_before getOrDefault ["militiagrenadeLaunchers", []]);
    _militiadesignatedGrenadeLaunchers = +(_before getOrDefault ["militiadesignatedGrenadeLaunchers", []]);
    _militiaSMGs = +(_before getOrDefault ["militiaSMGs", []]);
    _militiamachineGuns = +(_before getOrDefault ["militiamachineGuns", []]);
    _militiamarksmanRifles = +(_before getOrDefault ["militiamarksmanRifles", []]);
    _militiasniperRifles = +(_before getOrDefault ["militiasniperRifles", []]);
    _militialightATLaunchers = +(_before getOrDefault ["militialightATLaunchers", []]);
    _militialightHELaunchers = +(_before getOrDefault ["militialightHELaunchers", []]);
    _militiaATLaunchers = +(_before getOrDefault ["militiaATLaunchers", []]);
    _militiamissleATLaunchers = +(_before getOrDefault ["militiamissleATLaunchers", []]);
    _militiaAALaunchers = +(_before getOrDefault ["militiaAALaunchers", []]);
    _militiasidearms = +(_before getOrDefault ["militiasidearms", []]);
    _militiaGLsidearms = +(_before getOrDefault ["militiaGLsidearms", []]);
    _militiaATMines = +(_before getOrDefault ["militiaATMines", []]);
    _militiaAPMines = +(_before getOrDefault ["militiaAPMines", []]);
    _militialightExplosives = +(_before getOrDefault ["militialightExplosives", []]);
    _militiaheavyExplosives = +(_before getOrDefault ["militiaheavyExplosives", []]);
    _militiaantiInfantryGrenades = +(_before getOrDefault ["militiaantiInfantryGrenades", []]);
    _militiasmokeGrenades = +(_before getOrDefault ["militiasmokeGrenades", []]);
    _militiasignalsmokeGrenades = +(_before getOrDefault ["militiasignalsmokeGrenades", []]);
    _militiamaps = +(_before getOrDefault ["militiamaps", []]);
    _militiawatches = +(_before getOrDefault ["militiawatches", []]);
    _militiacompasses = +(_before getOrDefault ["militiacompasses", []]);
    _militiaradios = +(_before getOrDefault ["militiaradios", []]);
    _militiagpses = +(_before getOrDefault ["militiagpses", []]);
    _militiaNVGs = +(_before getOrDefault ["militiaNVGs", []]);
    _militiabinoculars = +(_before getOrDefault ["militiabinoculars", []]);
    _militiarangefinders = +(_before getOrDefault ["militiarangefinders", []]);
    _militiauniforms = +(_before getOrDefault ["militiauniforms", []]);
    _militiaslUniforms = +(_before getOrDefault ["militiaslUniforms", []]);
    _militiavests = +(_before getOrDefault ["militiavests", []]);
    _militiaHvests = +(_before getOrDefault ["militiaHvests", []]);
    _militiaMGvests = +(_before getOrDefault ["militiaMGvests", []]);
    _militiaMEDvests = +(_before getOrDefault ["militiaMEDvests", []]);
    _militiaSLvests = +(_before getOrDefault ["militiaSLvests", []]);
    _militiaSNIvests = +(_before getOrDefault ["militiaSNIvests", []]);
    _militiaGLvests = +(_before getOrDefault ["militiaGLvests", []]);
    _militiabackpacks = +(_before getOrDefault ["militiabackpacks", []]);
    _militiaatBackpacks = +(_before getOrDefault ["militiaatBackpacks", []]);
    _militiaaaBackpacks = +(_before getOrDefault ["militiaaaBackpacks", []]);
    _militiamedBackpacks = +(_before getOrDefault ["militiamedBackpacks", []]);
    _militiaengBackpacks = +(_before getOrDefault ["militiaengBackpacks", []]);
    _militiaexpBackpacks = +(_before getOrDefault ["militiaexpBackpacks", []]);
    _militialongRangeRadios = +(_before getOrDefault ["militialongRangeRadios", []]);
    _militiahelmets = +(_before getOrDefault ["militiahelmets", []]);
    _militiaslHat = +(_before getOrDefault ["militiaslHat", []]);
    _militiasniHats = +(_before getOrDefault ["militiasniHats", []]);
    _militiaglasses = +(_before getOrDefault ["militiaglasses", []]);
    _militiagoggles = +(_before getOrDefault ["militiagoggles", []]);
    _crewuniforms = +(_before getOrDefault ["crewuniforms", []]);
    _crewvests = +(_before getOrDefault ["crewvests", []]);
    _crewhelmets = +(_before getOrDefault ["crewhelmets", []]);
    _crewcarbines = +(_before getOrDefault ["crewcarbines", []]);
    _crewSMGs = +(_before getOrDefault ["crewSMGs", []]);
    _pilotuniforms = +(_before getOrDefault ["pilotuniforms", []]);
    _pilotvests = +(_before getOrDefault ["pilotvests", []]);
    _pilothelmets = +(_before getOrDefault ["pilothelmets", []]);
    _pilotSMGs = +(_before getOrDefault ["pilotSMGs", []]);
};

private _fnc_gearFactionApply = {
    params ["_factionName"];

    private _selectedFaction = _factionName;

    if (_selectedFaction == "RANDOM") then {
        private _availableFactions = keys _gearFactionPools;
        if (_availableFactions isEqualTo []) exitWith {
            diag_log "[GearFaction] No gear factions captured, leaving current gear arrays unchanged.";
        };
        _selectedFaction = selectRandom _availableFactions;
    };

    private _pool = _gearFactionPools getOrDefault [_selectedFaction, createHashMap];

    if (_pool isEqualTo createHashMap) exitWith {
        diag_log format ["[GearFaction] Unknown gear faction: %1", _selectedFaction];
    };

    diag_log format ["[GearFaction] Applying gear faction: %1", _selectedFaction];

    _slRifles = +(_pool getOrDefault ["slRifles", []]);
    _rifles = +(_pool getOrDefault ["rifles", []]);
    _carbines = +(_pool getOrDefault ["carbines", []]);
    _grenadeLaunchers = +(_pool getOrDefault ["grenadeLaunchers", []]);
    _designatedGrenadeLaunchers = +(_pool getOrDefault ["designatedGrenadeLaunchers", []]);
    _SMGs = +(_pool getOrDefault ["SMGs", []]);
    _machineGuns = +(_pool getOrDefault ["machineGuns", []]);
    _marksmanRifles = +(_pool getOrDefault ["marksmanRifles", []]);
    _sniperRifles = +(_pool getOrDefault ["sniperRifles", []]);
    _lightATLaunchers = +(_pool getOrDefault ["lightATLaunchers", []]);
    _lightHELaunchers = +(_pool getOrDefault ["lightHELaunchers", []]);
    _ATLaunchers = +(_pool getOrDefault ["ATLaunchers", []]);
    _missleATLaunchers = +(_pool getOrDefault ["missleATLaunchers", []]);
    _AALaunchers = +(_pool getOrDefault ["AALaunchers", []]);
    _sidearms = +(_pool getOrDefault ["sidearms", []]);
    _GLsidearms = +(_pool getOrDefault ["GLsidearms", []]);
    _ATMines = +(_pool getOrDefault ["ATMines", []]);
    _APMines = +(_pool getOrDefault ["APMines", []]);
    _lightExplosives = +(_pool getOrDefault ["lightExplosives", []]);
    _heavyExplosives = +(_pool getOrDefault ["heavyExplosives", []]);
    _antiInfantryGrenades = +(_pool getOrDefault ["antiInfantryGrenades", []]);
    _antiTankGrenades = +(_pool getOrDefault ["antiTankGrenades", []]);
    _smokeGrenades = +(_pool getOrDefault ["smokeGrenades", []]);
    _signalsmokeGrenades = +(_pool getOrDefault ["signalsmokeGrenades", []]);
    _maps = +(_pool getOrDefault ["maps", []]);
    _watches = +(_pool getOrDefault ["watches", []]);
    _compasses = +(_pool getOrDefault ["compasses", []]);
    _radios = +(_pool getOrDefault ["radios", []]);
    _gpses = +(_pool getOrDefault ["gpses", []]);
    _NVGs = +(_pool getOrDefault ["NVGs", []]);
    _binoculars = +(_pool getOrDefault ["binoculars", []]);
    _rangefinders = +(_pool getOrDefault ["rangefinders", []]);
    _traitorUniforms = +(_pool getOrDefault ["traitorUniforms", []]);
    _traitorVests = +(_pool getOrDefault ["traitorVests", []]);
    _traitorHats = +(_pool getOrDefault ["traitorHats", []]);
    _officerUniforms = +(_pool getOrDefault ["officerUniforms", []]);
    _officerVests = +(_pool getOrDefault ["officerVests", []]);
    _officerHats = +(_pool getOrDefault ["officerHats", []]);
    _cloakUniforms = +(_pool getOrDefault ["cloakUniforms", []]);
    _cloakVests = +(_pool getOrDefault ["cloakVests", []]);
    _cloakRifles = +(_pool getOrDefault ["cloakRifles", []]);
    _cloakCarbines = +(_pool getOrDefault ["cloakCarbines", []]);
    _cloakSidearms = +(_pool getOrDefault ["cloakSidearms", []]);
    _uniforms = +(_pool getOrDefault ["uniforms", []]);
    _slUniforms = +(_pool getOrDefault ["slUniforms", []]);
    _vests = +(_pool getOrDefault ["vests", []]);
    _Hvests = +(_pool getOrDefault ["Hvests", []]);
    _MGvests = +(_pool getOrDefault ["MGvests", []]);
    _MEDvests = +(_pool getOrDefault ["MEDvests", []]);
    _SLvests = +(_pool getOrDefault ["SLvests", []]);
    _SNIvests = +(_pool getOrDefault ["SNIvests", []]);
    _GLvests = +(_pool getOrDefault ["GLvests", []]);
    _backpacks = +(_pool getOrDefault ["backpacks", []]);
    _atBackpacks = +(_pool getOrDefault ["atBackpacks", []]);
    _aaBackpacks = +(_pool getOrDefault ["aaBackpacks", []]);
    _medBackpacks = +(_pool getOrDefault ["medBackpacks", []]);
    _engBackpacks = +(_pool getOrDefault ["engBackpacks", []]);
    _expBackpacks = +(_pool getOrDefault ["expBackpacks", []]);
    _longRangeRadios = +(_pool getOrDefault ["longRangeRadios", []]);
    _helmets = +(_pool getOrDefault ["helmets", []]);
    _slHat = +(_pool getOrDefault ["slHat", []]);
    _sniHats = +(_pool getOrDefault ["sniHats", []]);
    _slItems = +(_pool getOrDefault ["slItems", []]);
    _rItems = +(_pool getOrDefault ["rItems", []]);
    _mItems = +(_pool getOrDefault ["mItems", []]);
    _gItems = +(_pool getOrDefault ["gItems", []]);
    _eeItems = +(_pool getOrDefault ["eeItems", []]);
    _latItems = +(_pool getOrDefault ["latItems", []]);
    _atItems = +(_pool getOrDefault ["atItems", []]);
    _aaItems = +(_pool getOrDefault ["aaItems", []]);
    _mgItems = +(_pool getOrDefault ["mgItems", []]);
    _mmItems = +(_pool getOrDefault ["mmItems", []]);
    _pItems = +(_pool getOrDefault ["pItems", []]);
    _cItems = +(_pool getOrDefault ["cItems", []]);
    _uItems = +(_pool getOrDefault ["uItems", []]);
    _glasses = +(_pool getOrDefault ["glasses", []]);
    _goggles = +(_pool getOrDefault ["goggles", []]);
    _sfslRifles = +(_pool getOrDefault ["sfslRifles", []]);
    _sfrifles = +(_pool getOrDefault ["sfrifles", []]);
    _sfcarbines = +(_pool getOrDefault ["sfcarbines", []]);
    _sfgrenadeLaunchers = +(_pool getOrDefault ["sfgrenadeLaunchers", []]);
    _sfdesignatedGrenadeLaunchers = +(_pool getOrDefault ["sfdesignatedGrenadeLaunchers", []]);
    _sfSMGs = +(_pool getOrDefault ["sfSMGs", []]);
    _sfmachineGuns = +(_pool getOrDefault ["sfmachineGuns", []]);
    _sfmarksmanRifles = +(_pool getOrDefault ["sfmarksmanRifles", []]);
    _sfsniperRifles = +(_pool getOrDefault ["sfsniperRifles", []]);
    _sflightATLaunchers = +(_pool getOrDefault ["sflightATLaunchers", []]);
    _sflightHELaunchers = +(_pool getOrDefault ["sflightHELaunchers", []]);
    _sfATLaunchers = +(_pool getOrDefault ["sfATLaunchers", []]);
    _sfmissleATLaunchers = +(_pool getOrDefault ["sfmissleATLaunchers", []]);
    _sfAALaunchers = +(_pool getOrDefault ["sfAALaunchers", []]);
    _sfsidearms = +(_pool getOrDefault ["sfsidearms", []]);
    _sfGLsidearms = +(_pool getOrDefault ["sfGLsidearms", []]);
    _sfATMines = +(_pool getOrDefault ["sfATMines", []]);
    _sfAPMines = +(_pool getOrDefault ["sfAPMines", []]);
    _sflightExplosives = +(_pool getOrDefault ["sflightExplosives", []]);
    _sfheavyExplosives = +(_pool getOrDefault ["sfheavyExplosives", []]);
    _sfantiInfantryGrenades = +(_pool getOrDefault ["sfantiInfantryGrenades", []]);
    _sfsmokeGrenades = +(_pool getOrDefault ["sfsmokeGrenades", []]);
    _sfsignalsmokeGrenades = +(_pool getOrDefault ["sfsignalsmokeGrenades", []]);
    _sfmaps = +(_pool getOrDefault ["sfmaps", []]);
    _sfwatches = +(_pool getOrDefault ["sfwatches", []]);
    _sfcompasses = +(_pool getOrDefault ["sfcompasses", []]);
    _sfradios = +(_pool getOrDefault ["sfradios", []]);
    _sfgpses = +(_pool getOrDefault ["sfgpses", []]);
    _sfNVGs = +(_pool getOrDefault ["sfNVGs", []]);
    _sfbinoculars = +(_pool getOrDefault ["sfbinoculars", []]);
    _sfrangefinders = +(_pool getOrDefault ["sfrangefinders", []]);
    _sfuniforms = +(_pool getOrDefault ["sfuniforms", []]);
    _sfslUniforms = +(_pool getOrDefault ["sfslUniforms", []]);
    _sfvests = +(_pool getOrDefault ["sfvests", []]);
    _sfHvests = +(_pool getOrDefault ["sfHvests", []]);
    _sfMGvests = +(_pool getOrDefault ["sfMGvests", []]);
    _sfMEDvests = +(_pool getOrDefault ["sfMEDvests", []]);
    _sfSLvests = +(_pool getOrDefault ["sfSLvests", []]);
    _sfSNIvests = +(_pool getOrDefault ["sfSNIvests", []]);
    _sfGLvests = +(_pool getOrDefault ["sfGLvests", []]);
    _sfbackpacks = +(_pool getOrDefault ["sfbackpacks", []]);
    _sfatBackpacks = +(_pool getOrDefault ["sfatBackpacks", []]);
    _sfaaBackpacks = +(_pool getOrDefault ["sfaaBackpacks", []]);
    _sfmedBackpacks = +(_pool getOrDefault ["sfmedBackpacks", []]);
    _sfengBackpacks = +(_pool getOrDefault ["sfengBackpacks", []]);
    _sfexpBackpacks = +(_pool getOrDefault ["sfexpBackpacks", []]);
    _sflongRangeRadios = +(_pool getOrDefault ["sflongRangeRadios", []]);
    _sfhelmets = +(_pool getOrDefault ["sfhelmets", []]);
    _sfslHat = +(_pool getOrDefault ["sfslHat", []]);
    _sfsniHats = +(_pool getOrDefault ["sfsniHats", []]);
    _sfglasses = +(_pool getOrDefault ["sfglasses", []]);
    _sfgoggles = +(_pool getOrDefault ["sfgoggles", []]);
    _eliteslRifles = +(_pool getOrDefault ["eliteslRifles", []]);
    _eliterifles = +(_pool getOrDefault ["eliterifles", []]);
    _elitecarbines = +(_pool getOrDefault ["elitecarbines", []]);
    _elitegrenadeLaunchers = +(_pool getOrDefault ["elitegrenadeLaunchers", []]);
    _elitedesignatedGrenadeLaunchers = +(_pool getOrDefault ["elitedesignatedGrenadeLaunchers", []]);
    _eliteSMGs = +(_pool getOrDefault ["eliteSMGs", []]);
    _elitemachineGuns = +(_pool getOrDefault ["elitemachineGuns", []]);
    _elitemarksmanRifles = +(_pool getOrDefault ["elitemarksmanRifles", []]);
    _elitesniperRifles = +(_pool getOrDefault ["elitesniperRifles", []]);
    _elitelightATLaunchers = +(_pool getOrDefault ["elitelightATLaunchers", []]);
    _elitelightHELaunchers = +(_pool getOrDefault ["elitelightHELaunchers", []]);
    _eliteATLaunchers = +(_pool getOrDefault ["eliteATLaunchers", []]);
    _elitemissleATLaunchers = +(_pool getOrDefault ["elitemissleATLaunchers", []]);
    _eliteAALaunchers = +(_pool getOrDefault ["eliteAALaunchers", []]);
    _elitesidearms = +(_pool getOrDefault ["elitesidearms", []]);
    _eliteGLsidearms = +(_pool getOrDefault ["eliteGLsidearms", []]);
    _eliteATMines = +(_pool getOrDefault ["eliteATMines", []]);
    _eliteAPMines = +(_pool getOrDefault ["eliteAPMines", []]);
    _elitelightExplosives = +(_pool getOrDefault ["elitelightExplosives", []]);
    _eliteheavyExplosives = +(_pool getOrDefault ["eliteheavyExplosives", []]);
    _eliteantiInfantryGrenades = +(_pool getOrDefault ["eliteantiInfantryGrenades", []]);
    _elitesmokeGrenades = +(_pool getOrDefault ["elitesmokeGrenades", []]);
    _elitesignalsmokeGrenades = +(_pool getOrDefault ["elitesignalsmokeGrenades", []]);
    _elitemaps = +(_pool getOrDefault ["elitemaps", []]);
    _elitewatches = +(_pool getOrDefault ["elitewatches", []]);
    _elitecompasses = +(_pool getOrDefault ["elitecompasses", []]);
    _eliteradios = +(_pool getOrDefault ["eliteradios", []]);
    _elitegpses = +(_pool getOrDefault ["elitegpses", []]);
    _eliteNVGs = +(_pool getOrDefault ["eliteNVGs", []]);
    _elitebinoculars = +(_pool getOrDefault ["elitebinoculars", []]);
    _eliterangefinders = +(_pool getOrDefault ["eliterangefinders", []]);
    _eliteuniforms = +(_pool getOrDefault ["eliteuniforms", []]);
    _eliteslUniforms = +(_pool getOrDefault ["eliteslUniforms", []]);
    _elitevests = +(_pool getOrDefault ["elitevests", []]);
    _eliteHvests = +(_pool getOrDefault ["eliteHvests", []]);
    _eliteMGvests = +(_pool getOrDefault ["eliteMGvests", []]);
    _eliteMEDvests = +(_pool getOrDefault ["eliteMEDvests", []]);
    _eliteSLvests = +(_pool getOrDefault ["eliteSLvests", []]);
    _eliteSNIvests = +(_pool getOrDefault ["eliteSNIvests", []]);
    _eliteGLvests = +(_pool getOrDefault ["eliteGLvests", []]);
    _elitebackpacks = +(_pool getOrDefault ["elitebackpacks", []]);
    _eliteatBackpacks = +(_pool getOrDefault ["eliteatBackpacks", []]);
    _eliteaaBackpacks = +(_pool getOrDefault ["eliteaaBackpacks", []]);
    _elitemedBackpacks = +(_pool getOrDefault ["elitemedBackpacks", []]);
    _eliteengBackpacks = +(_pool getOrDefault ["eliteengBackpacks", []]);
    _eliteexpBackpacks = +(_pool getOrDefault ["eliteexpBackpacks", []]);
    _elitelongRangeRadios = +(_pool getOrDefault ["elitelongRangeRadios", []]);
    _elitehelmets = +(_pool getOrDefault ["elitehelmets", []]);
    _eliteslHat = +(_pool getOrDefault ["eliteslHat", []]);
    _elitesniHats = +(_pool getOrDefault ["elitesniHats", []]);
    _eliteglasses = +(_pool getOrDefault ["eliteglasses", []]);
    _elitegoggles = +(_pool getOrDefault ["elitegoggles", []]);
    _militaryslRifles = +(_pool getOrDefault ["militaryslRifles", []]);
    _militaryrifles = +(_pool getOrDefault ["militaryrifles", []]);
    _militarycarbines = +(_pool getOrDefault ["militarycarbines", []]);
    _militarygrenadeLaunchers = +(_pool getOrDefault ["militarygrenadeLaunchers", []]);
    _militarydesignatedGrenadeLaunchers = +(_pool getOrDefault ["militarydesignatedGrenadeLaunchers", []]);
    _militarySMGs = +(_pool getOrDefault ["militarySMGs", []]);
    _militarymachineGuns = +(_pool getOrDefault ["militarymachineGuns", []]);
    _militarymarksmanRifles = +(_pool getOrDefault ["militarymarksmanRifles", []]);
    _militarysniperRifles = +(_pool getOrDefault ["militarysniperRifles", []]);
    _militarylightATLaunchers = +(_pool getOrDefault ["militarylightATLaunchers", []]);
    _militarylightHELaunchers = +(_pool getOrDefault ["militarylightHELaunchers", []]);
    _militaryATLaunchers = +(_pool getOrDefault ["militaryATLaunchers", []]);
    _militarymissleATLaunchers = +(_pool getOrDefault ["militarymissleATLaunchers", []]);
    _militaryAALaunchers = +(_pool getOrDefault ["militaryAALaunchers", []]);
    _militarysidearms = +(_pool getOrDefault ["militarysidearms", []]);
    _militaryGLsidearms = +(_pool getOrDefault ["militaryGLsidearms", []]);
    _militaryATMines = +(_pool getOrDefault ["militaryATMines", []]);
    _militaryAPMines = +(_pool getOrDefault ["militaryAPMines", []]);
    _militarylightExplosives = +(_pool getOrDefault ["militarylightExplosives", []]);
    _militaryheavyExplosives = +(_pool getOrDefault ["militaryheavyExplosives", []]);
    _militaryantiInfantryGrenades = +(_pool getOrDefault ["militaryantiInfantryGrenades", []]);
    _militarysmokeGrenades = +(_pool getOrDefault ["militarysmokeGrenades", []]);
    _militarysignalsmokeGrenades = +(_pool getOrDefault ["militarysignalsmokeGrenades", []]);
    _militarymaps = +(_pool getOrDefault ["militarymaps", []]);
    _militarywatches = +(_pool getOrDefault ["militarywatches", []]);
    _militarycompasses = +(_pool getOrDefault ["militarycompasses", []]);
    _militaryradios = +(_pool getOrDefault ["militaryradios", []]);
    _militarygpses = +(_pool getOrDefault ["militarygpses", []]);
    _militaryNVGs = +(_pool getOrDefault ["militaryNVGs", []]);
    _militarybinoculars = +(_pool getOrDefault ["militarybinoculars", []]);
    _militaryrangefinders = +(_pool getOrDefault ["militaryrangefinders", []]);
    _militaryuniforms = +(_pool getOrDefault ["militaryuniforms", []]);
    _militaryslUniforms = +(_pool getOrDefault ["militaryslUniforms", []]);
    _militaryvests = +(_pool getOrDefault ["militaryvests", []]);
    _militaryHvests = +(_pool getOrDefault ["militaryHvests", []]);
    _militaryMGvests = +(_pool getOrDefault ["militaryMGvests", []]);
    _militaryMEDvests = +(_pool getOrDefault ["militaryMEDvests", []]);
    _militarySLvests = +(_pool getOrDefault ["militarySLvests", []]);
    _militarySNIvests = +(_pool getOrDefault ["militarySNIvests", []]);
    _militaryGLvests = +(_pool getOrDefault ["militaryGLvests", []]);
    _militarybackpacks = +(_pool getOrDefault ["militarybackpacks", []]);
    _militaryatBackpacks = +(_pool getOrDefault ["militaryatBackpacks", []]);
    _militaryaaBackpacks = +(_pool getOrDefault ["militaryaaBackpacks", []]);
    _militarymedBackpacks = +(_pool getOrDefault ["militarymedBackpacks", []]);
    _militaryengBackpacks = +(_pool getOrDefault ["militaryengBackpacks", []]);
    _militaryexpBackpacks = +(_pool getOrDefault ["militaryexpBackpacks", []]);
    _militarylongRangeRadios = +(_pool getOrDefault ["militarylongRangeRadios", []]);
    _militaryhelmets = +(_pool getOrDefault ["militaryhelmets", []]);
    _militaryslHat = +(_pool getOrDefault ["militaryslHat", []]);
    _militarysniHats = +(_pool getOrDefault ["militarysniHats", []]);
    _militaryglasses = +(_pool getOrDefault ["militaryglasses", []]);
    _militarygoggles = +(_pool getOrDefault ["militarygoggles", []]);
    _policeuniforms = +(_pool getOrDefault ["policeuniforms", []]);
    _policevests = +(_pool getOrDefault ["policevests", []]);
    _policehelmets = +(_pool getOrDefault ["policehelmets", []]);
    _policeWeapons = +(_pool getOrDefault ["policeWeapons", []]);
    _policesidearms = +(_pool getOrDefault ["policesidearms", []]);
    _militiaslRifles = +(_pool getOrDefault ["militiaslRifles", []]);
    _militiarifles = +(_pool getOrDefault ["militiarifles", []]);
    _militiacarbines = +(_pool getOrDefault ["militiacarbines", []]);
    _militiagrenadeLaunchers = +(_pool getOrDefault ["militiagrenadeLaunchers", []]);
    _militiadesignatedGrenadeLaunchers = +(_pool getOrDefault ["militiadesignatedGrenadeLaunchers", []]);
    _militiaSMGs = +(_pool getOrDefault ["militiaSMGs", []]);
    _militiamachineGuns = +(_pool getOrDefault ["militiamachineGuns", []]);
    _militiamarksmanRifles = +(_pool getOrDefault ["militiamarksmanRifles", []]);
    _militiasniperRifles = +(_pool getOrDefault ["militiasniperRifles", []]);
    _militialightATLaunchers = +(_pool getOrDefault ["militialightATLaunchers", []]);
    _militialightHELaunchers = +(_pool getOrDefault ["militialightHELaunchers", []]);
    _militiaATLaunchers = +(_pool getOrDefault ["militiaATLaunchers", []]);
    _militiamissleATLaunchers = +(_pool getOrDefault ["militiamissleATLaunchers", []]);
    _militiaAALaunchers = +(_pool getOrDefault ["militiaAALaunchers", []]);
    _militiasidearms = +(_pool getOrDefault ["militiasidearms", []]);
    _militiaGLsidearms = +(_pool getOrDefault ["militiaGLsidearms", []]);
    _militiaATMines = +(_pool getOrDefault ["militiaATMines", []]);
    _militiaAPMines = +(_pool getOrDefault ["militiaAPMines", []]);
    _militialightExplosives = +(_pool getOrDefault ["militialightExplosives", []]);
    _militiaheavyExplosives = +(_pool getOrDefault ["militiaheavyExplosives", []]);
    _militiaantiInfantryGrenades = +(_pool getOrDefault ["militiaantiInfantryGrenades", []]);
    _militiasmokeGrenades = +(_pool getOrDefault ["militiasmokeGrenades", []]);
    _militiasignalsmokeGrenades = +(_pool getOrDefault ["militiasignalsmokeGrenades", []]);
    _militiamaps = +(_pool getOrDefault ["militiamaps", []]);
    _militiawatches = +(_pool getOrDefault ["militiawatches", []]);
    _militiacompasses = +(_pool getOrDefault ["militiacompasses", []]);
    _militiaradios = +(_pool getOrDefault ["militiaradios", []]);
    _militiagpses = +(_pool getOrDefault ["militiagpses", []]);
    _militiaNVGs = +(_pool getOrDefault ["militiaNVGs", []]);
    _militiabinoculars = +(_pool getOrDefault ["militiabinoculars", []]);
    _militiarangefinders = +(_pool getOrDefault ["militiarangefinders", []]);
    _militiauniforms = +(_pool getOrDefault ["militiauniforms", []]);
    _militiaslUniforms = +(_pool getOrDefault ["militiaslUniforms", []]);
    _militiavests = +(_pool getOrDefault ["militiavests", []]);
    _militiaHvests = +(_pool getOrDefault ["militiaHvests", []]);
    _militiaMGvests = +(_pool getOrDefault ["militiaMGvests", []]);
    _militiaMEDvests = +(_pool getOrDefault ["militiaMEDvests", []]);
    _militiaSLvests = +(_pool getOrDefault ["militiaSLvests", []]);
    _militiaSNIvests = +(_pool getOrDefault ["militiaSNIvests", []]);
    _militiaGLvests = +(_pool getOrDefault ["militiaGLvests", []]);
    _militiabackpacks = +(_pool getOrDefault ["militiabackpacks", []]);
    _militiaatBackpacks = +(_pool getOrDefault ["militiaatBackpacks", []]);
    _militiaaaBackpacks = +(_pool getOrDefault ["militiaaaBackpacks", []]);
    _militiamedBackpacks = +(_pool getOrDefault ["militiamedBackpacks", []]);
    _militiaengBackpacks = +(_pool getOrDefault ["militiaengBackpacks", []]);
    _militiaexpBackpacks = +(_pool getOrDefault ["militiaexpBackpacks", []]);
    _militialongRangeRadios = +(_pool getOrDefault ["militialongRangeRadios", []]);
    _militiahelmets = +(_pool getOrDefault ["militiahelmets", []]);
    _militiaslHat = +(_pool getOrDefault ["militiaslHat", []]);
    _militiasniHats = +(_pool getOrDefault ["militiasniHats", []]);
    _militiaglasses = +(_pool getOrDefault ["militiaglasses", []]);
    _militiagoggles = +(_pool getOrDefault ["militiagoggles", []]);
    _crewuniforms = +(_pool getOrDefault ["crewuniforms", []]);
    _crewvests = +(_pool getOrDefault ["crewvests", []]);
    _crewhelmets = +(_pool getOrDefault ["crewhelmets", []]);
    _crewcarbines = +(_pool getOrDefault ["crewcarbines", []]);
    _crewSMGs = +(_pool getOrDefault ["crewSMGs", []]);
    _pilotuniforms = +(_pool getOrDefault ["pilotuniforms", []]);
    _pilotvests = +(_pool getOrDefault ["pilotvests", []]);
    _pilothelmets = +(_pool getOrDefault ["pilothelmets", []]);
    _pilotSMGs = +(_pool getOrDefault ["pilotSMGs", []]);
};

