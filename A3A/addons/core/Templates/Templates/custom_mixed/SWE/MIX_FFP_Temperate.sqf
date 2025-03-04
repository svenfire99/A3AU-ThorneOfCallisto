/* Faction : Finland
 * Required mods/addons: "sfp_soldiers", "Finnish_Forces_Pack"
 * Optional mods/addons: (Recommended) "CUP_AirVehicles_Core", "RHS_US_A2Port_Armor", "rhssaf_c_vehicles", "XA_185"
 */
_basic              append [];
_unarmedVehicles    append ["ffp_bv206", "ffp_rg32m"];
_armedVehicles      append ["sfp_tgb16_ksp58", "sfp_tgb16_rws", "ffp_rg32m_gmg"];
_Trucks             append ["ffp_susi_sa420", "ffp_susi_sa420_covered"];
_cargoTrucks        append ["ffp_susi_sa420", "ffp_susi_sa420_covered"];
_ammoTrucks         append ["ffp_susi8x8_ammo"];
_repairTrucks       append ["ffp_susi_sa420_repair"];
_fuelTrucks         append ["ffp_susi_sa420_fuel"];
_medicalTrucks      append ["ffp_van_ambulance"];
_lightAPCs          append [];
_APCs               append ["ffp_bmp2", "ffp_bmp2_atgm"];
_IFVs               append ["ffp_cv9030"];
_airborneVehicles   append [];
_tanks              append ["ffp_leopard2a4", "ffp_leopard2a6"];
_lightTanks         append [];
_aa                 append ["sfp_lvkv90c"];

_SDV        append [];
_DropPod    append [];

_transportBoat  append ["ffp_gruppbat"];
_gunBoat        append ["sfp_strb90", "sfp_strb90_rws"];
_Amphibious     append [];

_planesCAS  append ["ffp_jas39e", "ffp_jas39e_rb15"];
_planesAA   append ["ffp_jas39e", "ffp_jas39e_rb15"];

_planesTransport    append [];
_gunship            append [];

_helisLight             append ["ffp_md500"];
_transportHelicopters   append ["ffp_nh90"];
_helisLightAttack       append ["ffp_nh90_armed"];
_helisAttack            append [];
_airPatrol              append ["ffp_md500"];

_artillery      append ["ffp_rsrakh06"];
_artilleryMags  append [
    ["ffp_rsrakh06", ["12Rnd_230mm_rockets"]]
];

_uavsAttack     append [];
_uavsPortable   append ["ffp_orbiter"];

_militiaLightArmed  append ["sfp_tgb16_ksp58"];
_militiaTrucks      append ["ffp_susi_sa420", "ffp_susi_sa420_covered"];
_militiaCars        append ["ffp_rg32m"];
_militiaAPCs        append ["sfp_tgb16_ksp58"]; 

_policeVehs append ["ffp_rg32m"];

_staticMG       append ["B_G_HMG_02_high_F"];
_staticAT       append ["ffp_pstohj83"];
_staticAA       append ["ffp_23itk61", "ffp_ito2005m"];
_staticMortars  append ["B_Mortar_01_F"];
_howitzers      append ["ffp_122h63"];
_radar          append [];
_SAM            append [];

_minefieldAT    append ["ffp_telamiina"];
_minefieldAPERS append ["ffp_sm_65_98"];

_animations append [];
_variants append [];

_faces append ["WhiteHead_01","WhiteHead_02","WhiteHead_03","WhiteHead_04","WhiteHead_05","WhiteHead_06","WhiteHead_07","WhiteHead_08","WhiteHead_09","WhiteHead_10","WhiteHead_11","WhiteHead_12","WhiteHead_13","WhiteHead_14","WhiteHead_15","WhiteHead_16","WhiteHead_17","WhiteHead_18","WhiteHead_19","WhiteHead_20","WhiteHead_21"];
_voices append [];
_sfVoices append [];
_eliteVoices append [];

_insignia append [];
_sfInsignia append [];
_milInsignia append [];

//////////////////////////
//       Loadouts       //
//////////////////////////

_slRifles append [
	["ffp_rk95", "", "sfp_dbal2", "ffp_ta11_3d", ["ffp_30Rnd_762x39", "ffp_30Rnd_762x39_tracer"], [], ""],
	["ffp_rk95", "", "sfp_dbal2", "ffp_pp04", ["ffp_30Rnd_762x39", "ffp_30Rnd_762x39_tracer"], [], ""],
	["ffp_rk95", "", "sfp_dbal2", "ffp_pp09", ["ffp_30Rnd_762x39", "ffp_30Rnd_762x39_tracer"], [], ""]
];
_rifles append [
	["ffp_rk95", "", "sfp_dbal2", "ffp_pp04", ["ffp_30Rnd_762x39", "ffp_30Rnd_762x39_tracer"], [], ""],
	["ffp_rk95", "", "sfp_dbal2", "", ["ffp_30Rnd_762x39", "ffp_30Rnd_762x39_tracer"], [], ""]
];
_carbines append [
	["ffp_rk95", "", "sfp_dbal2", "ffp_pp04", ["ffp_30Rnd_762x39", "ffp_30Rnd_762x39_tracer"], [], ""],
	["ffp_rk62", "", "", "", ["ffp_30Rnd_762x39", "ffp_30Rnd_762x39_tracer"], [], ""]
];
_grenadeLaunchers append [];
_designatedGrenadeLaunchers append [];
_SMGs append [];
_machineGuns append [
	["ffp_kk_pkm", "", "", "ffp_pp09", ["ffp_100Rnd_762x54_pkm", "ffp_100Rnd_762x54_pkm_Tracer"], [], ""],
	["ffp_kk_pkm", "", "", "ffp_pp04", ["ffp_100Rnd_762x54_pkm", "ffp_100Rnd_762x54_pkm_Tracer"], [], ""],
	["ffp_kk_pkm", "", "", "", ["ffp_100Rnd_762x54_pkm", "ffp_100Rnd_762x54_pkm_Tracer"], [], ""]
];
_marksmanRifles append [];
_sniperRifles append [
	["ffp_TKiv2000", "", "", "", ["ffp_5Rnd_TKiv2000_mag", "ffp_5Rnd_TKiv2000_mag"], [], ""]
];
_lightATLaunchers append [];
_lightHELaunchers append [];
_ATLaunchers append [];
_missleATLaunchers append [];
_AALaunchers append [];
_sidearms append [];
_GLsidearms append [];

_ATMines append ["ffp_telamiina_mag"];
_APMines append ["ffp_sm_65_98_mag"];
_lightExplosives append ["DemoCharge_Remote_Mag","sfp_sprdeg46_mag"];
_heavyExplosives append ["SatchelCharge_Remote_Mag"];

_antiInfantryGrenades append ["ffp_handgrenade_runko43"];
_smokeGrenades append ["ffp_smoke_white"];
_signalsmokeGrenades append ["ffp_smoke_red", "ffp_smoke_green", "ffp_smoke_blue"];

_maps append ["ItemMap"];
_watches append ["ItemWatch"];
_compasses append ["ItemCompass"];
_radios append ["ItemRadio"];
_gpses append ["ItemGPS"];
_NVGs append ["NVGoggles"];
_binoculars append ["Binocular"];
_rangefinders append ["Rangefinder"];

_traitorUniforms append ["ffp_m05w_uniform"];
_traitorVests append ["V_TacVest_oli", "V_Chestrig_oli", "V_Chestrig_rgr"];
_traitorHats append ["sfp_wool_beanie_green"];

_officerUniforms append ["ffp_m05w_uniform"];
_officerVests append ["V_Rangemaster_belt"];
_officerHats append ["H_Beret_blk"];

_cloakUniforms append [];
_cloakVests append [];

_uniforms append [];
_slUniforms append [];
_MGvests append [];
_MEDvests append [];
_SLvests append [];
_SNIvests append ["V_TacVest_oli"];
_GLvests append [];
_vests append [];
_backpacks append [];
_atBackpacks append ["sfp_backpack_stridssack2000"];
_medBackpacks append [];
_longRangeRadios append [];
_helmets append [];
_slHat append ["H_Beret_blk"];
_sniHats append ["H_Booniehat_oli"];

_slItems append ["Laserbatteries", "Laserbatteries", "Laserbatteries"];
_rItems append [];
_mItems append [];
_gItems append [];
_eeItems append ["ToolKit", "MineDetector"];
_latItems append [];
_atItems append [];
_aaItems append [];
_mgItems append [];
_mmItems append [];
_pItems append [];
_cItems append [];
_uItems append [];

// Remove this if not wanted, example: WW2 mods
if (A3A_hasACE) then {
	_slItems append ["ACE_microDAGR", "ACE_DAGR"];
	_eeItems append ["ACE_Clacker", "ACE_DefusalKit"];
	_mmItems append ["ACE_RangeCard", "ACE_ATragMX", "ACE_Kestrel4500"];
};

_glasses append [];
_goggles append [];

///////////////////////////////////////
//    Special Forces Loadout Data    //
///////////////////////////////////////

_sfslRifles append [];
_sfrifles append [
	["ffp_rk95", "", "sfp_dbal2", "ffp_ta11_3d", ["ffp_30Rnd_762x39", "ffp_30Rnd_762x39_tracer"], [], ""],
	["ffp_rk95", "", "sfp_dbal2", "ffp_pp04", ["ffp_30Rnd_762x39", "ffp_30Rnd_762x39_tracer"], [], ""],
	["ffp_rk95", "", "sfp_dbal2", "ffp_pp09", ["ffp_30Rnd_762x39", "ffp_30Rnd_762x39_tracer"], [], ""],
	["ffp_rk62", "", "sfp_dbal2", "ffp_vv2000_sidemount", ["ffp_30Rnd_762x39", "ffp_30Rnd_762x39_tracer"], [], ""]
];
_sfcarbines append [];
_sfgrenadeLaunchers append [];
_sfdesignatedGrenadeLaunchers append [];
_sfSMGs append [];
_sfmachineGuns append [];
_sfmarksmanRifles append [];
_sfsniperRifles append [
	["ffp_TKiv2000", "muzzle_snds_338_black", "", "ffp_optic_TKiv2000", ["ffp_5Rnd_TKiv2000_mag", "ffp_5Rnd_TKiv2000_mag"], [], ""]
];
_sflightATLaunchers append [
    ["sfp_grg86", "", "", "", ["sfp_grg_heat_mag", "sfp_grg_he_mag"], [], ""]
];
_sflightHELaunchers append [];
_sfATLaunchers append ["ffp_kes88", "ffp_66kes12", "ffp_66kes12_rak"];
_sfmissleATLaunchers append [
    ["ffp_nlaw", "", "", "", ["ffp_nlaw_mag"], [], ""]
];
_sfAALaunchers append [
    ["ffp_ito15", "", "", "", ["ffp_ito15_mag"], [], ""]
];
_sfsidearms append [];
_sfGLsidearms append [];

_sfATMines append [];
_sfAPMines append [];
_sflightExplosives append [];
_sfheavyExplosives append [];

_sfantiInfantryGrenades append [];
_sfsmokeGrenades append [];
_sfsignalsmokeGrenades append [];

_sfmaps append [];
_sfwatches append [];
_sfcompasses append [];
_sfradios append [];
_sfgpses append [];
_sfNVGs append [];
_sfbinoculars append [];
_sfrangefinders append [];

_sfuniforms append ["ffp_m05w_uniform"];
_sfslUniforms append [];
_sfvests append ["V_PlateCarrier2_blk"];
_sfHvests append ["V_PlateCarrier2_blk"];
_sfMGvests append [];
_sfMEDvests append [];
_sfSLvests append [];
_sfSNIvests append [];
_sfGLvests append [];
_sfbackpacks append ["ffp_m05_backpack_small", "sfp_backpack_stridssack2000", "B_AssaultPack_rgr", "B_AssaultPack_khk", "B_Carryall_oli", "B_Kitbag_rgr"];
_sfatBackpacks append [];
_sflongRangeRadios append [];
_sfhelmets append ["ffp_m05w_helmet_glasses","ffp_m05w_helmet_peltor","ffp_m05w_helmet"];
_sfslHat append [];
_sfsniHats append [];

_sfglasses append [];
_sfgoggles append [];

/////////////////////////////////
//    Elite Loadout Data       //
/////////////////////////////////


_eliteslRifles append [];
_eliterifles append [];
_elitecarbines append [];
_elitegrenadeLaunchers append [];
_elitedesignatedGrenadeLaunchers append [];
_eliteSMGs append [];
_elitemachineGuns append [];
_elitemarksmanRifles append [];
_elitesniperRifles append [
	["ffp_TKiv2000", "", "", "ffp_optic_TKiv2000", ["ffp_5Rnd_TKiv2000_mag", "ffp_5Rnd_TKiv2000_mag"], [], ""]
];
_elitelightATLaunchers append [
    ["sfp_grg86", "", "", "", ["sfp_grg_heat_mag", "sfp_grg_he_mag"], [], ""]
];
_elitelightHELaunchers append [];
_eliteATLaunchers append ["ffp_kes88", "ffp_66kes12", "ffp_66kes12_rak"];
_elitemissleATLaunchers append [
    ["ffp_nlaw", "", "", "", ["ffp_nlaw_mag"], [], ""]
];
_eliteAALaunchers append [
    ["ffp_ito15", "", "", "", ["ffp_ito15_mag"], [], ""]
];
_elitesidearms append [];
_eliteGLsidearms append [];

_eliteATMines append [];
_eliteAPMines append [];
_elitelightExplosives append [];
_eliteheavyExplosives append [];

_eliteantiInfantryGrenades append [];
_elitesmokeGrenades append [];
_elitesignalsmokeGrenades append [];

_elitemaps append [];
_elitewatches append [];
_elitecompasses append [];
_eliteradios append [];
_elitegpses append [];
_eliteNVGs append [];
_elitebinoculars append [];
_eliterangefinders append [];

_eliteuniforms append ["ffp_m05w_uniform"];
_eliteslUniforms append [];
_elitevests append ["ffp_m05combatvest","ffp_m05combatvest_grenade","ffp_m05combatvest_radio"];
_eliteHvests append ["ffp_m05combatvest","ffp_m05combatvest_grenade","ffp_m05combatvest_radio"];
_eliteMGvests append [];
_eliteMEDvests append [];
_eliteSLvests append [];
_eliteSNIvests append [];
_eliteGLvests append [];
_elitebackpacks append ["B_Kitbag_rgr", "ffp_m05_backpack_small", "B_Carryall_khk", "B_Carryall_oli"];
_eliteatBackpacks append [];
_elitelongRangeRadios append [];
_elitehelmets append ["ffp_m05w_helmet_glasses","ffp_m05w_helmet_peltor","ffp_m05w_helmet"];
_eliteslHat append [];
_elitesniHats append [];

_eliteglasses append [];
_elitegoggles append [];

/////////////////////////////////
//    Military Loadout Data    //
/////////////////////////////////


_militaryslRifles append [
	["ffp_rk62", "", "", "", ["ffp_30Rnd_762x39", "ffp_30Rnd_762x39_tracer"], [], ""],
	["ffp_rk95", "", "", "ffp_pp04", ["ffp_30Rnd_762x39", "ffp_30Rnd_762x39_tracer"], [], ""]
];
_militaryrifles append [
	["ffp_rk62", "", "", "", ["ffp_30Rnd_762x39", "ffp_30Rnd_762x39_tracer"], [], ""],
	["ffp_rk95", "", "", "ffp_pp04", ["ffp_30Rnd_762x39", "ffp_30Rnd_762x39_tracer"], [], ""]
];
_militarycarbines append [];
_militarygrenadeLaunchers append [];
_militarydesignatedGrenadeLaunchers append [];
_militarySMGs append [];
_militarymachineGuns append [
	["ffp_kk_pkm", "", "", "optic_Hamr", ["ffp_100Rnd_762x54_pkm", "ffp_100Rnd_762x54_pkm_Tracer"], [], ""],
	["ffp_kk_pkm", "", "", "optic_MRCO", ["ffp_100Rnd_762x54_pkm", "ffp_100Rnd_762x54_pkm_Tracer"], [], ""]
];
_militarymarksmanRifles append [];
_militarysniperRifles append [];
_militarylightATLaunchers append [];
_militarylightHELaunchers append [];
_militaryATLaunchers append ["ffp_kes88", "ffp_66kes12_rak", "ffp_66kes12", "ffp_Apilas", "ffp_nlaw"];
_militarymissleATLaunchers append [];
_militaryAALaunchers append [
	["ffp_ito15", "", "", "", ["ffp_ito15_mag"], [], ""]
];
_militarysidearms append [
	["ffp_pist2008", "", "sfp_tlr2", "", ["ffp_17rnd_9x9_mag"], [], ""]
];
_militaryGLsidearms append [];

_militaryATMines append [];
_militaryAPMines append [];
_militarylightExplosives append [];
_militaryheavyExplosives append [];

_militaryantiInfantryGrenades append [];
_militarysmokeGrenades append [];
_militarysignalsmokeGrenades append [];

_militarymaps append [];
_militarywatches append [];
_militarycompasses append [];
_militaryradios append [];
_militarygpses append [];
_militaryNVGs append [];
_militarybinoculars append ["Binocular", "Rangefinder"];
_militaryrangefinders append [];

_militaryuniforms append ["ffp_m05w_uniform"];
_militaryslUniforms append [];
_militaryvests append ["ffp_m05combatvest","ffp_m05combatvest_grenade","ffp_m05combatvest_radio"];
_militaryHvests append ["ffp_m05combatvest","ffp_m05combatvest_grenade","ffp_m05combatvest_radio"];
_militaryMGvests append [];
_militaryMEDvests append [];
_militarySLvests append [];
_militarySNIvests append [];
_militaryGLvests append [];
_militarybackpacks append ["B_AssaultPack_rgr", "B_AssaultPack_khk", "B_FieldPack_oli", "B_FieldPack_khk", "B_Kitbag_rgr", "B_TacticalPack_oli", "ffp_m05_backpack_small"];
_militaryatBackpacks append [];
_militarylongRangeRadios append [];
_militaryhelmets append ["ffp_m05w_helmet_glasses","ffp_m05w_helmet_peltor","ffp_m05w_helmet"];
_militaryslHat append [];
_militarysniHats append [];

_militaryglasses append [];
_militarygoggles append [];

///////////////////////////////
//    Police Loadout Data    //
///////////////////////////////

_policeuniforms append ["sfp_police_uniform_modern", "sfp_police_uniform_modern_tactical"];
_policevests append ["V_TacVest_oli", "V_TacVest_blk","sfp_police_belt", "sfp_kroppsskydd_police", "sfp_police_tacVest"];
_policehelmets append ["H_Beret_blk","sfp_police_hat", "sfp_police_helmet"];
_policeWeapons append [
	["sfp_remington870", "", "", "", ["sfp_12Gauge_8rd_Pellets", "sfp_12Gauge_8rd_Slug"], [], ""],
	["sfp_remington870_chrome", "", "", "", ["sfp_12Gauge_8rd_Pellets", "sfp_12Gauge_8rd_Slug"], [], ""],
	["sfp_cga5p", "", "", "", ["sfp_30Rnd_556x45_Stanag", "sfp_30Rnd_556x45_Stanag_tracer"], [], ""],
	["sfp_mp5", "", "", "", ["sfp_30Rnd_9mm_mp5", "sfp_30Rnd_9mm_mp5_JHP"], [], ""],
	["sfp_mp5_rail", "", "", "", ["sfp_30Rnd_9mm_mp5", "sfp_30Rnd_9mm_mp5_JHP"], [], ""]
];
_policesidearms append [
	["ffp_pist2008", "", "", "", ["ffp_17rnd_9x9_mag"], [], ""]
];

////////////////////////////////
//    Militia Loadout Data    //
////////////////////////////////


_militiaslRifles append [
	["ffp_rk62", "", "", "", ["ffp_30Rnd_762x39", "ffp_30Rnd_762x39_tracer"], [], ""],
	["ffp_rk95", "", "", "ffp_pp04", ["ffp_30Rnd_762x39", "ffp_30Rnd_762x39_tracer"], [], ""]
];
_militiarifles append [
	["ffp_rk62", "", "", "", ["ffp_30Rnd_762x39", "ffp_30Rnd_762x39_tracer"], [], ""],
	["ffp_rk95", "", "", "ffp_pp04", ["ffp_30Rnd_762x39", "ffp_30Rnd_762x39_tracer"], [], ""]
];
_militiacarbines append [
	["ffp_rk62", "", "", "", ["ffp_30Rnd_762x39", "ffp_30Rnd_762x39_tracer"], [], ""],
	["ffp_rk95", "", "", "ffp_pp04", ["ffp_30Rnd_762x39", "ffp_30Rnd_762x39_tracer"], [], ""]
];
_militiagrenadeLaunchers append [];
_militiadesignatedGrenadeLaunchers append [];
_militiaSMGs append [];
_militiamachineGuns append [
	["ffp_kk_pkm", "", "", "", ["ffp_100Rnd_762x54_pkm", "ffp_100Rnd_762x54_pkm_Tracer"], [], ""],
	["ffp_KVKK", "", "", "", ["ffp_100Rnd_KVKK_mag", "ffp_100Rnd_KVKK_mag_Tracer"], [], ""]
];
_militiamarksmanRifles append [];
_militiasniperRifles append [];
_militialightATLaunchers append [];
_militialightHELaunchers append [];
_militiaATLaunchers append ["ffp_kes88", "ffp_66kes12_rak", "ffp_66kes12"];
_militiamissleATLaunchers append [];
_militiaAALaunchers append [];
_militiasidearms append [
	["ffp_pist2008", "", "", "", ["ffp_17rnd_9x9_mag"], [], ""]
];
_militiaGLsidearms append [];

_militiaATMines append [];
_militiaAPMines append [];
_militialightExplosives append [];
_militiaheavyExplosives append [];

_militiaantiInfantryGrenades append [];
_militiasmokeGrenades append [];
_militiasignalsmokeGrenades append [];

_militiamaps append [];
_militiawatches append [];
_militiacompasses append [];
_militiaradios append [];
_militiagpses append [];
_militiaNVGs append [];
_militiabinoculars append [];
_militiarangefinders append [];

_militiauniforms append ["ffp_m05w_uniform"];
_militiaslUniforms append [];
_militiavests append ["V_Chestrig_oli", "V_TacVest_oli"];
_militiaHvests append ["V_TacVest_oli"];
_militiaMGvests append [];
_militiaMEDvests append [];
_militiaSLvests append [];
_militiaSNIvests append [];
_militiaGLvests append [];
_militiabackpacks append ["B_TacticalPack_oli", "B_FieldPack_oli", "B_AssaultPack_dgtl"];
_militiaatBackpacks append [];
_militialongRangeRadios append [];
_militiahelmets append ["ffp_m05w_helmet_glasses","ffp_m05w_helmet_peltor","ffp_m05w_helmet"];
_militiaslHat append [];
_militiasniHats append [];

_militiaglasses append [];
_militiagoggles append [];

//////////////////////////
//    Misc Loadouts     //
//////////////////////////

_crewuniforms append ["ffp_m05w_uniform"];
_crewvests append ["V_TacVest_oli"];
_crewhelmets append ["ffp_bmp2_crew_helmet"];
_crewcarbines append [
	["sfp_kpistm45", "", "", "", ["sfp_36Rnd_9mm_kpistm45"], [], ""],
	["sfp_kpistm45", "", "", "", ["sfp_71Rnd_9mm_kpistm45"], [], ""],
	["sfp_kpistm45b", "", "", "", ["sfp_36Rnd_9mm_kpistm45"], [], ""]
];
_crewSMGs append [];

_pilotuniforms append ["sfp_m87_flying_suit"];
_pilotvests append ["ffp_m05flak","V_TacVest_oli"];
_pilothelmets append ["H_CrewHelmetHeli_O", "H_CrewHelmetHeli_B", "H_PilotHelmetHeli_O", "H_PilotHelmetHeli_B"];
_pilotSMGs append [
	["sfp_kpistm45", "", "", "", ["sfp_36Rnd_9mm_kpistm45"], [], ""],
	["sfp_kpistm45", "", "", "", ["sfp_71Rnd_9mm_kpistm45"], [], ""],
	["sfp_kpistm45b", "", "", "", ["sfp_36Rnd_9mm_kpistm45"], [], ""]
];

if (isClass (configFile >> "CfgPatches" >> "XA_185")) then {
    _vehiclesLightAPCs append ["XA185_A1"];
};

if (isClass (configFile >> "CfgPatches" >> "FDF_VOICES_A3")) then {
    _voices append ["Male01FIN_FDF","Male02FIN_FDF","Male03FIN_FDF","Male04FIN_FDF","Male05FIN_FDF","Male06FIN_FDF","Male07FIN_FDF","Male08FIN_FDF","Male09FIN_FDF"];
} else {
	_voices append ["Male01ENG", "Male02ENG", "Male03ENG", "Male04ENG", "Male05ENG", "Male06ENG", "Male07ENG", "Male08ENG", "Male09ENG", "Male10ENG", "Male11ENG", "Male12ENG"];
};

if (isClass (configFile >> "CfgPatches" >> "CUP_AirVehicles_Core") || isClass (configFile >> "CfgFactionClasses" >> "rhs_faction_usarmy")) then {
	if (isClass (configFile >> "CfgPatches" >> "CUP_AirVehicles_Core") && !isClass (configFile >> "CfgFactionClasses" >> "rhs_faction_usarmy")) then {
		_cargoTrucks        append ["CUP_B_MTVR_BAF_WOOD"];
		_ammoTrucks         append ["CUP_B_MTVR_Ammo_BAF_WOOD"];
		_repairTrucks       append ["CUP_B_MTVR_Repair_BAF_WOOD"];
		_fuelTrucks         append ["CUP_B_MTVR_Refuel_BAF_WOOD"];
		_planesCAS  		append ["CUP_I_JAS39_RACS"];
		_planesAA   		append ["CUP_I_JAS39_RACS"];
		_helisAttack        append ["CUP_B_AH64_DL_BAF"];
		_uavsAttack     	append ["CUP_B_USMC_DYN_MQ9"];
		_staticMG       	append ["CUP_B_M2StaticMG_USMC"];
		_staticAA       	append ["CUP_B_Stinger_AA_pod_Base_USMC"];
		_staticMortars  	append ["CUP_B_M252_USMC"];
		
		_NVGs append ["CUP_NVG_1PN138", "CUP_NVG_PVS15_black", "CUP_NVG_PVS15_green", "CUP_NVG_PVS7", "CUP_NVG_PVS14", "CUP_NVG_GPNVG_black", "CUP_NVG_GPNVG_green", "CUP_NVG_HMNVS"];
		_rangefinders append ["Rangefinder", "CUP_LRTV", "CUP_Vector21Nite"];
		
		_SNIvests append ["CUP_V_B_ALICE", "CUP_V_O_SLA_M23_1_OD", "CUP_V_I_RACS_Carrier_Rig_wdl_2", "CUP_V_I_RACS_Carrier_Rig_wdl_3"];
		_longRangeRadios append ["CUP_B_Kombat_Radio_Olive"];
		_glasses append ["None", "CUP_G_Oakleys_Clr", "CUP_G_Oakleys_Drks", "CUP_G_Oakleys_Embr"];
		_goggles append ["None", "CUP_G_ESS_BLK_Dark", "CUP_G_ESS_BLK_Ember", "CUP_G_ESS_BLK", "CUP_G_ESS_CBR_Dark", "CUP_G_ESS_CBR_Ember", "CUP_G_ESS_CBR", "CUP_G_ESS_RGR_Dark", "CUP_G_ESS_RGR_Ember", "CUP_G_ESS_RGR", "CUP_G_ESS_KHK_Dark", "CUP_G_ESS_KHK_Ember", "CUP_G_ESS_KHK"];

		_sfslRifles append [
			["CUP_arifle_Mk17_STD", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
			["CUP_arifle_Mk17_STD_black", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
			["CUP_arifle_Mk17_STD_woodland", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
			["CUP_arifle_Mk17_STD_AFG", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
			["CUP_arifle_Mk17_STD_AFG_black", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
			["CUP_arifle_Mk17_STD_AFG_woodland", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
			["CUP_arifle_Mk17_STD_FG", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
			["CUP_arifle_Mk17_STD_FG_black", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
			["CUP_arifle_Mk17_STD_FG_woodland", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
			["CUP_arifle_Mk17_STD_SFG", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
			["CUP_arifle_Mk17_STD_SFG_black", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
			["CUP_arifle_Mk17_STD_SFG_woodland", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
			["CUP_arifle_Mk17_STD", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
			["CUP_arifle_Mk17_STD_black", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
			["CUP_arifle_Mk17_STD_woodland", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
			["CUP_arifle_Mk17_STD_AFG", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
			["CUP_arifle_Mk17_STD_AFG_black", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
			["CUP_arifle_Mk17_STD_AFG_woodland", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
			["CUP_arifle_Mk17_STD_FG", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
			["CUP_arifle_Mk17_STD_FG_black", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
			["CUP_arifle_Mk17_STD_FG_woodland", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
			["CUP_arifle_Mk17_STD_SFG", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
			["CUP_arifle_Mk17_STD_SFG_black", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
			["CUP_arifle_Mk17_STD_SFG_woodland", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
			["CUP_arifle_Mk17_STD_EGLM", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], ["CUP_1Rnd_Smoke_M203"], ""],
			["CUP_arifle_Mk17_STD_EGLM_black", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], ["CUP_1Rnd_Smoke_M203"], ""],
			["CUP_arifle_Mk17_STD_EGLM_woodland", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], ["CUP_1Rnd_Smoke_M203"], ""],
			["CUP_arifle_Mk17_STD_EGLM", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], ["CUP_1Rnd_Smoke_M203"], ""],
			["CUP_arifle_Mk17_STD_EGLM_black", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], ["CUP_1Rnd_Smoke_M203"], ""],
			["CUP_arifle_Mk17_STD_EGLM_woodland", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], ["CUP_1Rnd_Smoke_M203"], ""]
		];
		_sfrifles append [
			["CUP_arifle_Mk17_STD", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
			["CUP_arifle_Mk17_STD_black", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
			["CUP_arifle_Mk17_STD_woodland", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
			["CUP_arifle_Mk17_STD_AFG", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
			["CUP_arifle_Mk17_STD_AFG_black", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
			["CUP_arifle_Mk17_STD_AFG_woodland", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
			["CUP_arifle_Mk17_STD_FG", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
			["CUP_arifle_Mk17_STD_FG_black", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
			["CUP_arifle_Mk17_STD_FG_woodland", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
			["CUP_arifle_Mk17_STD_SFG", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
			["CUP_arifle_Mk17_STD_SFG_black", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
			["CUP_arifle_Mk17_STD_SFG_woodland", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
			["CUP_arifle_Mk17_STD", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
			["CUP_arifle_Mk17_STD_black", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
			["CUP_arifle_Mk17_STD_woodland", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
			["CUP_arifle_Mk17_STD_AFG", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
			["CUP_arifle_Mk17_STD_AFG_black", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
			["CUP_arifle_Mk17_STD_AFG_woodland", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
			["CUP_arifle_Mk17_STD_FG", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
			["CUP_arifle_Mk17_STD_FG_black", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
			["CUP_arifle_Mk17_STD_FG_woodland", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
			["CUP_arifle_Mk17_STD_SFG", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
			["CUP_arifle_Mk17_STD_SFG_black", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
			["CUP_arifle_Mk17_STD_SFG_woodland", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""]
		];
		_sfcarbines append [
			["CUP_arifle_Mk17_CQC", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
			["CUP_arifle_Mk17_CQC_Black", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
			["CUP_arifle_Mk17_CQC_woodland", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
			["CUP_arifle_Mk17_CQC_AFG", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
			["CUP_arifle_Mk17_CQC_AFG_black", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
			["CUP_arifle_Mk17_CQC_AFG_woodland", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
			["CUP_arifle_Mk17_CQC_FG", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
			["CUP_arifle_Mk17_CQC_FG_black", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
			["CUP_arifle_Mk17_CQC_FG_woodland", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
			["CUP_arifle_Mk17_CQC_SFG", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
			["CUP_arifle_Mk17_CQC_SFG_black", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
			["CUP_arifle_Mk17_CQC_SFG_woodland", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
			["CUP_arifle_Mk17_CQC", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
			["CUP_arifle_Mk17_CQC_Black", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
			["CUP_arifle_Mk17_CQC_woodland", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
			["CUP_arifle_Mk17_CQC_AFG", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
			["CUP_arifle_Mk17_CQC_AFG_black", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
			["CUP_arifle_Mk17_CQC_AFG_woodland", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
			["CUP_arifle_Mk17_CQC_FG", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
			["CUP_arifle_Mk17_CQC_FG_black", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
			["CUP_arifle_Mk17_CQC_FG_woodland", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
			["CUP_arifle_Mk17_CQC_SFG", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
			["CUP_arifle_Mk17_CQC_SFG_black", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
			["CUP_arifle_Mk17_CQC_SFG_woodland", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""]
		];
		_sfgrenadeLaunchers append [
			["CUP_arifle_Mk17_STD_EGLM", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], ["CUP_1Rnd_HEDP_M203"], ""],
			["CUP_arifle_Mk17_STD_EGLM_black", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], ["CUP_1Rnd_HEDP_M203"], ""],
			["CUP_arifle_Mk17_STD_EGLM_woodland", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], ["CUP_1Rnd_HEDP_M203"], ""],

			["CUP_arifle_Mk17_STD_EGLM", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], ["CUP_1Rnd_HEDP_M203"], ""],
			["CUP_arifle_Mk17_STD_EGLM_black", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], ["CUP_1Rnd_HEDP_M203"], ""],
			["CUP_arifle_Mk17_STD_EGLM_woodland", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], ["CUP_1Rnd_HEDP_M203"], ""],
			["CUP_arifle_Mk17_CQC_EGLM", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], ["CUP_1Rnd_HEDP_M203"], ""],
			["CUP_arifle_Mk17_CQC_EGLM_black", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], ["CUP_1Rnd_HEDP_M203"], ""],
			["CUP_arifle_Mk17_CQC_EGLM_woodland", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], ["CUP_1Rnd_HEDP_M203"], ""],
			["CUP_arifle_Mk17_CQC_EGLM", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], ["CUP_1Rnd_HEDP_M203"], ""],
			["CUP_arifle_Mk17_CQC_EGLM_black", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], ["CUP_1Rnd_HEDP_M203"], ""],
			["CUP_arifle_Mk17_CQC_EGLM_woodland", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], ["CUP_1Rnd_HEDP_M203"], ""]
		];
		_sfSMGs append [
			["CUP_smg_MP5SD6", "", "CUP_acc_LLM_black", "CUP_optic_Eotech553_Black", ["CUP_30Rnd_9x19_MP5", "CUP_30Rnd_Red_Tracer_9x19_MP5"], [], ""],
			["CUP_smg_MP5A5_Rail", "CUP_muzzle_snds_MP5", "CUP_acc_LLM_black", "CUP_optic_Eotech553_Black", ["CUP_30Rnd_9x19_MP5", "CUP_30Rnd_Red_Tracer_9x19_MP5"], [], ""],
			["CUP_smg_MP5A5_Rail_AFG", "CUP_muzzle_snds_MP5", "CUP_acc_LLM_black", "CUP_optic_Eotech553_Black", ["CUP_30Rnd_9x19_MP5", "CUP_30Rnd_Red_Tracer_9x19_MP5"], [], ""],
			["CUP_smg_MP5A5_Rail_VFG", "CUP_muzzle_snds_MP5", "CUP_acc_LLM_black", "CUP_optic_Eotech553_Black", ["CUP_30Rnd_9x19_MP5", "CUP_30Rnd_Red_Tracer_9x19_MP5"], [], ""],
			["CUP_smg_MP5SD6", "", "CUP_acc_LLM_black", "ffp_pp09", ["CUP_30Rnd_9x19_MP5", "CUP_30Rnd_Red_Tracer_9x19_MP5"], [], ""],
			["CUP_smg_MP5A5_Rail", "CUP_muzzle_snds_MP5", "CUP_acc_LLM_black", "ffp_pp09", ["CUP_30Rnd_9x19_MP5", "CUP_30Rnd_Red_Tracer_9x19_MP5"], [], ""],
			["CUP_smg_MP5A5_Rail_AFG", "CUP_muzzle_snds_MP5", "CUP_acc_LLM_black", "ffp_pp09", ["CUP_30Rnd_9x19_MP5", "CUP_30Rnd_Red_Tracer_9x19_MP5"], [], ""],
			["CUP_smg_MP5A5_Rail_VFG", "CUP_muzzle_snds_MP5", "CUP_acc_LLM_black", "ffp_pp09", ["CUP_30Rnd_9x19_MP5", "CUP_30Rnd_Red_Tracer_9x19_MP5"], [], ""]
		];
		_sfmachineGuns append [
			["CUP_lmg_minimi_railed", "", "CUP_acc_LLM_black", "ffp_ta11_3d", ["CUP_200Rnd_TE4_Red_Tracer_556x45_M249"], [], ""]
		];
		_sfmarksmanRifles append [
			["CUP_arifle_HK417_20", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_SB_11_4x20_PM", ["CUP_20Rnd_762x51_HK417", "CUP_20Rnd_TE1_Red_Tracer_762x51_HK417"], [], "CUP_bipod_VLTOR_Modpod_black"],
			["CUP_arifle_HK417_20_Wood", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_SB_11_4x20_PM", ["CUP_20Rnd_762x51_HK417", "CUP_20Rnd_TE1_Red_Tracer_762x51_HK417"], [], "CUP_bipod_VLTOR_Modpod_black"],

			["CUP_arifle_HK417_20", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_LeupoldM3LR", ["CUP_20Rnd_762x51_HK417", "CUP_20Rnd_TE1_Red_Tracer_762x51_HK417"], [], "CUP_bipod_VLTOR_Modpod_black"],
			["CUP_arifle_HK417_20_Wood", "CUP_muzzle_snds_socom762rc", "CUP_acc_LLM_black", "CUP_optic_LeupoldM3LR", ["CUP_20Rnd_762x51_HK417", "CUP_20Rnd_TE1_Red_Tracer_762x51_HK417"], [], "CUP_bipod_VLTOR_Modpod_black"]
		];
		_sflightATLaunchers append [
			["CUP_launch_MAAWS", "", "", "CUP_optic_MAAWS_Scope", ["sfp_grg_heat_mag", "sfp_grg_he_mag"], [], ""]
		];
		_sfmissleATLaunchers append [
			["CUP_launch_Javelin", "", "", "", ["CUP_Javelin_M"], [], ""]
		];
		_sfsidearms append [
			["CUP_hgun_P30L_blk", "CUP_muzzle_snds_M9", "sfp_tlr2", "", ["CUP_17Rnd_9x19_P30L"], [], ""]
		];
		_sfvests append ["CUP_V_B_LBT_LBV_Black", "CUP_V_B_LBT_LBV_GRN", "CUP_V_B_LBT_LBV_OD"];
		_sfHvests append ["CUP_V_B_LBT_LBV_Black", "CUP_V_B_LBT_LBV_GRN", "CUP_V_B_LBT_LBV_OD"];
		_sfhelmets append ["CUP_H_OpsCore_Green", "CUP_H_OpsCore_Green_NoHS", "CUP_H_OpsCore_Green_SF", "CUP_H_OpsCore_Tan", "CUP_H_OpsCore_Tan_NoHS", "CUP_H_OpsCore_Tan_SF"];
		_sfbinoculars append ["CUP_SOFLAM", "CUP_LRTV"];

		_eliteslRifles append [
			["CUP_arifle_Mk17_STD", "", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
			["CUP_arifle_Mk17_STD_black", "", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
			["CUP_arifle_Mk17_STD_woodland", "", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
			["CUP_arifle_Mk17_STD_AFG", "", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
			["CUP_arifle_Mk17_STD_AFG_black", "", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
			["CUP_arifle_Mk17_STD_AFG_woodland", "", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
			["CUP_arifle_Mk17_STD_FG", "", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
			["CUP_arifle_Mk17_STD_FG_black", "", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
			["CUP_arifle_Mk17_STD_FG_woodland", "", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
			["CUP_arifle_Mk17_STD_SFG", "", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
			["CUP_arifle_Mk17_STD_SFG_black", "", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
			["CUP_arifle_Mk17_STD_SFG_woodland", "", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
			["CUP_arifle_Mk17_STD_SFG_woodland", "", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_HK417", "CUP_20Rnd_TE1_Red_Tracer_762x51_HK417"], [], ""],
			["CUP_arifle_HK417_12", "", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_HK417", "CUP_20Rnd_TE1_Red_Tracer_762x51_HK417"], [], ""],
			["CUP_arifle_HK417_12_Wood", "", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_HK417", "CUP_20Rnd_TE1_Red_Tracer_762x51_HK417"], [], ""],
			["CUP_arifle_Mk17_STD", "", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
			["CUP_arifle_Mk17_STD_black", "", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
			["CUP_arifle_Mk17_STD_woodland", "", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
			["CUP_arifle_Mk17_STD_AFG", "", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
			["CUP_arifle_Mk17_STD_AFG_black", "", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
			["CUP_arifle_Mk17_STD_AFG_woodland", "", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
			["CUP_arifle_Mk17_STD_FG", "", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
			["CUP_arifle_Mk17_STD_FG_black", "", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
			["CUP_arifle_Mk17_STD_FG_woodland", "", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
			["CUP_arifle_Mk17_STD_SFG", "", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
			["CUP_arifle_Mk17_STD_SFG_black", "", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
			["CUP_arifle_Mk17_STD_SFG_woodland", "", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
			["CUP_arifle_HK417_12", "", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_HK417", "CUP_20Rnd_TE1_Red_Tracer_762x51_HK417"], [], ""],
			["CUP_arifle_HK417_12_Wood", "", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_HK417", "CUP_20Rnd_TE1_Red_Tracer_762x51_HK417"], [], ""],
			["CUP_arifle_Mk17_STD_EGLM", "", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], ["CUP_1Rnd_Smoke_M203"], ""],
			["CUP_arifle_Mk17_STD_EGLM_black", "", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], ["CUP_1Rnd_Smoke_M203"], ""],
			["CUP_arifle_Mk17_STD_EGLM_woodland", "", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], ["CUP_1Rnd_Smoke_M203"], ""],
			["CUP_arifle_HK417_12_AG36", "", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_HK417", "CUP_20Rnd_TE1_Red_Tracer_762x51_HK417"], ["CUP_1Rnd_Smoke_M203"], ""],
			["CUP_arifle_HK417_12_AG36_Wood", "", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_HK417", "CUP_20Rnd_TE1_Red_Tracer_762x51_HK417"], ["CUP_1Rnd_Smoke_M203"], ""],
			["CUP_arifle_Mk17_STD_EGLM", "", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], ["CUP_1Rnd_Smoke_M203"], ""],
			["CUP_arifle_Mk17_STD_EGLM_black", "", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], ["CUP_1Rnd_Smoke_M203"], ""],
			["CUP_arifle_Mk17_STD_EGLM_woodland", "", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], ["CUP_1Rnd_Smoke_M203"], ""],
			["CUP_arifle_HK417_12_AG36", "", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_HK417", "CUP_20Rnd_TE1_Red_Tracer_762x51_HK417"], ["CUP_1Rnd_Smoke_M203"], ""],
			["CUP_arifle_HK417_12_AG36_Wood", "", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_HK417", "CUP_20Rnd_TE1_Red_Tracer_762x51_HK417"], ["CUP_1Rnd_Smoke_M203"], ""]
		];
		_eliterifles append [
			["CUP_arifle_Mk17_STD", "", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
			["CUP_arifle_Mk17_STD_black", "", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
			["CUP_arifle_Mk17_STD_woodland", "", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
			["CUP_arifle_Mk17_STD_AFG", "", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
			["CUP_arifle_Mk17_STD_AFG_black", "", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
			["CUP_arifle_Mk17_STD_AFG_woodland", "", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
			["CUP_arifle_Mk17_STD_FG", "", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
			["CUP_arifle_Mk17_STD_FG_black", "", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
			["CUP_arifle_Mk17_STD_FG_woodland", "", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
			["CUP_arifle_Mk17_STD_SFG", "", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
			["CUP_arifle_Mk17_STD_SFG_black", "", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
			["CUP_arifle_Mk17_STD_SFG_woodland", "", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
			["CUP_arifle_Mk17_STD_SFG_woodland", "", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_HK417", "CUP_20Rnd_TE1_Red_Tracer_762x51_HK417"], [], ""],
			["CUP_arifle_HK417_12", "", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_HK417", "CUP_20Rnd_TE1_Red_Tracer_762x51_HK417"], [], ""],
			["CUP_arifle_HK417_12_Wood", "", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_HK417", "CUP_20Rnd_TE1_Red_Tracer_762x51_HK417"], [], ""],
			["CUP_arifle_Mk17_STD", "", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
			["CUP_arifle_Mk17_STD_black", "", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
			["CUP_arifle_Mk17_STD_woodland", "", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
			["CUP_arifle_Mk17_STD_AFG", "", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
			["CUP_arifle_Mk17_STD_AFG_black", "", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
			["CUP_arifle_Mk17_STD_AFG_woodland", "", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
			["CUP_arifle_Mk17_STD_FG", "", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
			["CUP_arifle_Mk17_STD_FG_black", "", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
			["CUP_arifle_Mk17_STD_FG_woodland", "", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
			["CUP_arifle_Mk17_STD_SFG", "", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
			["CUP_arifle_Mk17_STD_SFG_black", "", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
			["CUP_arifle_Mk17_STD_SFG_woodland", "", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
			["CUP_arifle_HK417_12", "", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_HK417", "CUP_20Rnd_TE1_Red_Tracer_762x51_HK417"], [], ""],
			["CUP_arifle_HK417_12_Wood", "", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_HK417", "CUP_20Rnd_TE1_Red_Tracer_762x51_HK417"], [], ""]
		];
		_elitecarbines append [
			["CUP_arifle_Mk17_CQC", "", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
			["CUP_arifle_Mk17_CQC_Black", "", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
			["CUP_arifle_Mk17_CQC_woodland", "", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
			["CUP_arifle_Mk17_CQC_AFG", "", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
			["CUP_arifle_Mk17_CQC_AFG_black", "", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
			["CUP_arifle_Mk17_CQC_AFG_woodland", "", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
			["CUP_arifle_Mk17_CQC_FG", "", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
			["CUP_arifle_Mk17_CQC_FG_black", "", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
			["CUP_arifle_Mk17_CQC_FG_woodland", "", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
			["CUP_arifle_Mk17_CQC_SFG", "", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
			["CUP_arifle_Mk17_CQC_SFG_black", "", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
			["CUP_arifle_Mk17_CQC_SFG_woodland", "", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
			["CUP_arifle_HK417_12", "", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_HK417", "CUP_20Rnd_TE1_Red_Tracer_762x51_HK417"], [], ""],
			["CUP_arifle_HK417_12_Wood", "", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_HK417", "CUP_20Rnd_TE1_Red_Tracer_762x51_HK417"], [], ""],
			["CUP_arifle_Mk17_CQC", "", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
			["CUP_arifle_Mk17_CQC_Black", "", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
			["CUP_arifle_Mk17_CQC_woodland", "", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
			["CUP_arifle_Mk17_CQC_AFG", "", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
			["CUP_arifle_Mk17_CQC_AFG_black", "", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
			["CUP_arifle_Mk17_CQC_AFG_woodland", "", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
			["CUP_arifle_Mk17_CQC_FG", "", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
			["CUP_arifle_Mk17_CQC_FG_black", "", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
			["CUP_arifle_Mk17_CQC_FG_woodland", "", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
			["CUP_arifle_Mk17_CQC_SFG", "", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
			["CUP_arifle_Mk17_CQC_SFG_black", "", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
			["CUP_arifle_Mk17_CQC_SFG_woodland", "", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], [], ""],
			["CUP_arifle_HK417_12", "", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_HK417", "CUP_20Rnd_TE1_Red_Tracer_762x51_HK417"], [], ""],
			["CUP_arifle_HK417_12_Wood", "", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_HK417", "CUP_20Rnd_TE1_Red_Tracer_762x51_HK417"], [], ""]
		];
		_elitegrenadeLaunchers append [
			["CUP_arifle_Mk17_STD_EGLM", "", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], ["CUP_1Rnd_HE_M203"], ""],
			["CUP_arifle_Mk17_STD_EGLM_black", "", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], ["CUP_1Rnd_HE_M203"], ""],
			["CUP_arifle_Mk17_STD_EGLM_woodland", "", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], ["CUP_1Rnd_HE_M203"], ""],
			["CUP_arifle_HK417_12_AG36", "", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_HK417", "CUP_20Rnd_TE1_Red_Tracer_762x51_HK417"], ["CUP_1Rnd_HE_M203"], ""],
			["CUP_arifle_HK417_12_AG36_Wood", "", "CUP_acc_LLM_black", "CUP_optic_MicroT1_low", ["CUP_20Rnd_762x51_HK417", "CUP_20Rnd_TE1_Red_Tracer_762x51_HK417"], ["CUP_1Rnd_HE_M203"], ""],
			["CUP_arifle_Mk17_STD_EGLM", "", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], ["CUP_1Rnd_HE_M203"], ""],
			["CUP_arifle_Mk17_STD_EGLM_black", "", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], ["CUP_1Rnd_HE_M203"], ""],
			["CUP_arifle_Mk17_STD_EGLM_woodland", "", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_B_SCAR_bkl", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR_bkl"], ["CUP_1Rnd_HE_M203"], ""],
			["CUP_arifle_HK417_12_AG36", "", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_HK417", "CUP_20Rnd_TE1_Red_Tracer_762x51_HK417"], ["CUP_1Rnd_HE_M203"], ""],
			["CUP_arifle_HK417_12_AG36_Wood", "", "CUP_acc_LLM_black", "CUP_optic_CompM2_low", ["CUP_20Rnd_762x51_HK417", "CUP_20Rnd_TE1_Red_Tracer_762x51_HK417"], ["CUP_1Rnd_HE_M203"], ""]
		];
		_eliteSMGs append [
			["CUP_smg_MP5SD6", "", "CUP_acc_LLM_black", "CUP_optic_Eotech553_Black", ["CUP_30Rnd_9x19_MP5", "CUP_30Rnd_Red_Tracer_9x19_MP5"], [], ""],
			["CUP_smg_MP5A5_Rail", "", "CUP_acc_LLM_black", "CUP_optic_Eotech553_Black", ["CUP_30Rnd_9x19_MP5", "CUP_30Rnd_Red_Tracer_9x19_MP5"], [], ""],
			["CUP_smg_MP5A5_Rail_AFG", "", "CUP_acc_LLM_black", "CUP_optic_Eotech553_Black", ["CUP_30Rnd_9x19_MP5", "CUP_30Rnd_Red_Tracer_9x19_MP5"], [], ""],
			["CUP_smg_MP5A5_Rail_VFG", "", "CUP_acc_LLM_black", "CUP_optic_Eotech553_Black", ["CUP_30Rnd_9x19_MP5", "CUP_30Rnd_Red_Tracer_9x19_MP5"], [], ""],
			["CUP_smg_MP5SD6", "", "CUP_acc_LLM_black", "ffp_pp09", ["CUP_30Rnd_9x19_MP5", "CUP_30Rnd_Red_Tracer_9x19_MP5"], [], ""],
			["CUP_smg_MP5A5_Rail", "", "CUP_acc_LLM_black", "ffp_pp09", ["CUP_30Rnd_9x19_MP5", "CUP_30Rnd_Red_Tracer_9x19_MP5"], [], ""],
			["CUP_smg_MP5A5_Rail_AFG", "", "CUP_acc_LLM_black", "ffp_pp09", ["CUP_30Rnd_9x19_MP5", "CUP_30Rnd_Red_Tracer_9x19_MP5"], [], ""],
			["CUP_smg_MP5A5_Rail_VFG", "", "CUP_acc_LLM_black", "ffp_pp09", ["CUP_30Rnd_9x19_MP5", "CUP_30Rnd_Red_Tracer_9x19_MP5"], [], ""]
		];
		_elitemachineGuns append [
			["CUP_lmg_minimi_railed", "", "CUP_acc_LLM_black", "ffp_ta11_3d", ["CUP_200Rnd_TE4_Red_Tracer_556x45_M249"], [], ""]
		];
		_elitemarksmanRifles append [
			["CUP_arifle_HK417_20", "", "CUP_acc_LLM_black", "CUP_optic_SB_11_4x20_PM", ["CUP_20Rnd_762x51_HK417", "CUP_20Rnd_TE1_Red_Tracer_762x51_HK417"], [], "CUP_bipod_VLTOR_Modpod_black"],
			["CUP_arifle_HK417_20_Wood", "", "CUP_acc_LLM_black", "CUP_optic_SB_11_4x20_PM", ["CUP_20Rnd_762x51_HK417", "CUP_20Rnd_TE1_Red_Tracer_762x51_HK417"], [], "CUP_bipod_VLTOR_Modpod_black"],
			["CUP_arifle_HK417_20", "", "CUP_acc_LLM_black", "CUP_optic_LeupoldM3LR", ["CUP_20Rnd_762x51_HK417", "CUP_20Rnd_TE1_Red_Tracer_762x51_HK417"], [], "CUP_bipod_VLTOR_Modpod_black"],
			["CUP_arifle_HK417_20_Wood", "", "CUP_acc_LLM_black", "CUP_optic_LeupoldM3LR", ["CUP_20Rnd_762x51_HK417", "CUP_20Rnd_TE1_Red_Tracer_762x51_HK417"], [], "CUP_bipod_VLTOR_Modpod_black"]
		];
		_elitelightATLaunchers append [
			["CUP_launch_MAAWS", "", "", "CUP_optic_MAAWS_Scope", ["sfp_grg_heat_mag", "sfp_grg_he_mag"], [], ""]
		];
		_elitelightHELaunchers append [];
		_eliteATLaunchers append [
			["CUP_launch_Javelin", "", "", "", ["CUP_Javelin_M"], [], ""]
		];
		_elitevests append ["CUP_V_JPC_communications_rngr", "CUP_V_JPC_Fast_rngr", "CUP_V_B_JPC_OD_Light", "CUP_V_JPC_medical_rngr", "CUP_V_JPC_tl_rngr", "CUP_V_JPC_weapons_rngr", "CUP_V_JPC_communicationsbelt_rngr", "CUP_V_JPC_Fastbelt_rngr", "CUP_V_JPC_lightbelt_rngr", "CUP_V_JPC_medicalbelt_rngr", "CUP_V_JPC_tlbelt_rngr", "CUP_V_JPC_weaponsbelt_rngr"];
		_eliteHvests append ["CUP_V_JPC_communications_rngr", "CUP_V_JPC_Fast_rngr", "CUP_V_B_JPC_OD_Light", "CUP_V_JPC_medical_rngr", "CUP_V_JPC_tl_rngr", "CUP_V_JPC_weapons_rngr", "CUP_V_JPC_communicationsbelt_rngr", "CUP_V_JPC_Fastbelt_rngr", "CUP_V_JPC_lightbelt_rngr", "CUP_V_JPC_medicalbelt_rngr", "CUP_V_JPC_tlbelt_rngr", "CUP_V_JPC_weaponsbelt_rngr"];
		_elitehelmets append ["CUP_H_OpsCore_Green", "CUP_H_OpsCore_Green_NoHS", "CUP_H_OpsCore_Tan", "CUP_H_OpsCore_Tan_NoHS"];
		_elitebinoculars append ["CUP_LRTV", "CUP_Vector21Nite"];

		_militaryslRifles append [
			["ffp_rk95", "", "", "CUP_optic_CompM2_low", ["ffp_30Rnd_762x39", "ffp_30Rnd_762x39_tracer"], [], ""],
			["ffp_rk95", "", "", "CUP_optic_VortexRazor_UH1_Black", ["ffp_30Rnd_762x39", "ffp_30Rnd_762x39_tracer"], [], ""],
			["CUP_arifle_M4A1_BUIS_GL", "", "", "CUP_optic_CompM2_low", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Red"], ["CUP_1Rnd_Smoke_M203"], ""],
			["CUP_arifle_M4A1_BUIS_GL", "", "", "CUP_optic_VortexRazor_UH1_Black", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Red"], ["CUP_1Rnd_Smoke_M203"], ""],
			["CUP_arifle_M4A1_BUIS_GL", "", "", "ffp_pp04", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Red"], ["CUP_1Rnd_Smoke_M203"], ""]
		];
		_militaryrifles append [
			["ffp_rk95", "", "", "CUP_optic_CompM2_low", ["ffp_30Rnd_762x39", "ffp_30Rnd_762x39_tracer"], [], ""],
			["ffp_rk95", "", "", "CUP_optic_VortexRazor_UH1_Black", ["ffp_30Rnd_762x39", "ffp_30Rnd_762x39_tracer"], [], ""]
		];
		_militarycarbines append [
			["CUP_arifle_M4A1_standard_short_black", "", "", "CUP_optic_CompM2_low", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Red"], [], ""],
			["CUP_arifle_M4A1_standard_short_wdl", "", "", "CUP_optic_CompM2_low", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Red"], [], ""],
			["CUP_arifle_M4A1_standard_short_black", "", "", "CUP_optic_VortexRazor_UH1_Black", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Red"], [], ""],
			["CUP_arifle_M4A1_standard_short_wdl", "", "", "CUP_optic_VortexRazor_UH1_Black", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Red"], [], ""],
			["CUP_arifle_M4A1_standard_short_black", "", "", "ffp_pp04", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Red"], [], ""],
			["CUP_arifle_M4A1_standard_short_wdl", "", "", "ffp_pp04", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Red"], [], ""]
		];
		_militarygrenadeLaunchers append [
			["CUP_arifle_M4A1_BUIS_GL", "", "", "CUP_optic_CompM2_low", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Red"], ["CUP_1Rnd_Smoke_M203"], ""],
			["CUP_arifle_M4A1_BUIS_GL", "", "", "CUP_optic_VortexRazor_UH1_Black", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Red"], ["CUP_1Rnd_Smoke_M203"], ""],
			["CUP_arifle_M4A1_BUIS_GL", "", "", "ffp_pp04", ["CUP_30Rnd_556x45_Emag", "CUP_30Rnd_556x45_Emag_Tracer_Red"], ["CUP_1Rnd_Smoke_M203"], ""]
		];
		_militarydesignatedGrenadeLaunchers append [];
		_militarySMGs append [
			["CUP_smg_MP5A5_Rail", "", "", "CUP_optic_Eotech553_Black", ["CUP_30Rnd_9x19_MP5", "CUP_30Rnd_Red_Tracer_9x19_MP5"], [], ""],
			["CUP_smg_MP5A5_Rail_AFG", "", "", "CUP_optic_Eotech553_Black", ["CUP_30Rnd_9x19_MP5", "CUP_30Rnd_Red_Tracer_9x19_MP5"], [], ""],
			["CUP_smg_MP5A5_Rail_VFG", "", "", "CUP_optic_Eotech553_Black", ["CUP_30Rnd_9x19_MP5", "CUP_30Rnd_Red_Tracer_9x19_MP5"], [], ""],
			["CUP_smg_MP5A5_Rail", "", "", "ffp_pp09", ["CUP_30Rnd_9x19_MP5", "CUP_30Rnd_Red_Tracer_9x19_MP5"], [], ""],
			["CUP_smg_MP5A5_Rail_AFG", "", "", "ffp_pp09", ["CUP_30Rnd_9x19_MP5", "CUP_30Rnd_Red_Tracer_9x19_MP5"], [], ""],
			["CUP_smg_MP5A5_Rail_VFG", "", "", "ffp_pp09", ["CUP_30Rnd_9x19_MP5", "CUP_30Rnd_Red_Tracer_9x19_MP5"], [], ""]
		];
		_militarymachineGuns append [
			["ffp_kk_pkm", "", "", "CUP_optic_HensoldtZO_RDS", ["ffp_100Rnd_762x54_pkm", "ffp_100Rnd_762x54_pkm_Tracer"], [], ""]
		];
		_militarymarksmanRifles append [
			["CUP_srifle_SVD", "", "", "CUP_optic_PSO_3", ["CUP_10Rnd_762x54_SVD_M"], [], ""]
		];
		_militarysniperRifles append [
			["CUP_srifle_SVD", "", "", "CUP_optic_PSO_3", ["CUP_10Rnd_762x54_SVD_M"], [], ""]
		];
		_militarylightATLaunchers append [
			["CUP_launch_MAAWS", "", "", "CUP_optic_MAAWS_Scope", ["sfp_grg_heat_mag"], [], ""]
		];
		_militarybinoculars append ["CUP_Vector21Nite"];

		_policeWeapons append [];

		_militiaslRifles append [
			["CUP_arifle_AKM_Early", "", "acc_flashlight", "", ["CUP_30Rnd_762x39_AK47_bakelite_M", "CUP_30Rnd_TE1_Red_Tracer_762x39_AK47_bakelite_M"], [], ""],
			["CUP_arifle_AKM", "", "acc_flashlight", "", ["CUP_30Rnd_762x39_AK47_bakelite_M", "CUP_30Rnd_TE1_Red_Tracer_762x39_AK47_bakelite_M"], [], ""],
			["CUP_arifle_AKM_top_rail", "", "acc_flashlight", "", ["CUP_30Rnd_762x39_AK47_bakelite_M", "CUP_30Rnd_TE1_Red_Tracer_762x39_AK47_bakelite_M"], [], ""],
			["CUP_arifle_AKM_Early", "", "CUP_acc_Flashlight", "", ["CUP_30Rnd_762x39_AK47_bakelite_M", "CUP_30Rnd_TE1_Red_Tracer_762x39_AK47_bakelite_M"], [], ""],
			["CUP_arifle_AKM", "", "CUP_acc_Flashlight", "", ["CUP_30Rnd_762x39_AK47_bakelite_M", "CUP_30Rnd_TE1_Red_Tracer_762x39_AK47_bakelite_M"], [], ""],
			["CUP_arifle_AKM_top_rail", "", "CUP_acc_Flashlight", "", ["CUP_30Rnd_762x39_AK47_bakelite_M", "CUP_30Rnd_TE1_Red_Tracer_762x39_AK47_bakelite_M"], [], ""],
			["CUP_arifle_AKM_GL_Early", "", "acc_flashlight", "", ["CUP_30Rnd_762x39_AK47_bakelite_M", "CUP_30Rnd_TE1_Red_Tracer_762x39_AK47_bakelite_M"], ["CUP_1Rnd_SMOKE_GP25_M"], ""],
			["CUP_arifle_AKM_GL", "", "acc_flashlight", "", ["CUP_30Rnd_762x39_AK47_bakelite_M", "CUP_30Rnd_TE1_Red_Tracer_762x39_AK47_bakelite_M"], ["CUP_1Rnd_SMOKE_GP25_M"], ""],
			["CUP_arifle_AKM_GL_top_rail", "", "CUP_acc_Flashlight", "", ["CUP_30Rnd_762x39_AK47_bakelite_M", "CUP_30Rnd_TE1_Red_Tracer_762x39_AK47_bakelite_M"], ["CUP_1Rnd_SMOKE_GP25_M"], ""],
			["CUP_arifle_AKM_GL_Early", "", "CUP_acc_Flashlight", "", ["CUP_30Rnd_762x39_AK47_bakelite_M", "CUP_30Rnd_TE1_Red_Tracer_762x39_AK47_bakelite_M"], ["CUP_1Rnd_SMOKE_GP25_M"], ""],
			["CUP_arifle_AKM_GL", "", "CUP_acc_Flashlight", "", ["CUP_30Rnd_762x39_AK47_bakelite_M", "CUP_30Rnd_TE1_Red_Tracer_762x39_AK47_bakelite_M"], ["CUP_1Rnd_SMOKE_GP25_M"], ""],
			["CUP_arifle_AKM_GL_top_rail", "", "CUP_acc_Flashlight", "", ["CUP_30Rnd_762x39_AK47_bakelite_M", "CUP_30Rnd_TE1_Red_Tracer_762x39_AK47_bakelite_M"], ["CUP_1Rnd_SMOKE_GP25_M"], ""]
		];
		_militiarifles append [
			["CUP_arifle_AKM_Early", "", "acc_flashlight", "", ["CUP_30Rnd_762x39_AK47_bakelite_M", "CUP_30Rnd_TE1_Red_Tracer_762x39_AK47_bakelite_M"], [], ""],
			["CUP_arifle_AKM", "", "acc_flashlight", "", ["CUP_30Rnd_762x39_AK47_bakelite_M", "CUP_30Rnd_TE1_Red_Tracer_762x39_AK47_bakelite_M"], [], ""],
			["CUP_arifle_AKM_top_rail", "", "acc_flashlight", "", ["CUP_30Rnd_762x39_AK47_bakelite_M", "CUP_30Rnd_TE1_Red_Tracer_762x39_AK47_bakelite_M"], [], ""],
			["CUP_arifle_AKM_Early", "", "CUP_acc_Flashlight", "", ["CUP_30Rnd_762x39_AK47_bakelite_M", "CUP_30Rnd_TE1_Red_Tracer_762x39_AK47_bakelite_M"], [], ""],
			["CUP_arifle_AKM", "", "CUP_acc_Flashlight", "", ["CUP_30Rnd_762x39_AK47_bakelite_M", "CUP_30Rnd_TE1_Red_Tracer_762x39_AK47_bakelite_M"], [], ""],
			["CUP_arifle_AKM_top_rail", "", "CUP_acc_Flashlight", "", ["CUP_30Rnd_762x39_AK47_bakelite_M", "CUP_30Rnd_TE1_Red_Tracer_762x39_AK47_bakelite_M"], [], ""]
		];
		_militiacarbines append [
			["CUP_arifle_AKS74U", "", "", "", ["CUP_30Rnd_545x39_AK74_plum_M", "CUP_30Rnd_TE1_Red_Tracer_545x39_AK74_plum_M"], [], ""],
			["CUP_arifle_AKS74U_top_rail", "", "", "", ["CUP_30Rnd_545x39_AK74_plum_M", "CUP_30Rnd_TE1_Red_Tracer_545x39_AK74_plum_M"], [], ""]
		];
		_militiagrenadeLaunchers append [
			["CUP_arifle_AKM_GL_Early", "", "acc_flashlight", "", ["CUP_30Rnd_762x39_AK47_bakelite_M", "CUP_30Rnd_TE1_Red_Tracer_762x39_AK47_bakelite_M"], ["CUP_1Rnd_HE_GP25_M"], ""],
			["CUP_arifle_AKM_GL", "", "acc_flashlight", "", ["CUP_30Rnd_762x39_AK47_bakelite_M", "CUP_30Rnd_TE1_Red_Tracer_762x39_AK47_bakelite_M"], ["CUP_1Rnd_HE_GP25_M"], ""],
			["CUP_arifle_AKM_GL_top_rail", "", "CUP_acc_Flashlight", "", ["CUP_30Rnd_762x39_AK47_bakelite_M", "CUP_30Rnd_TE1_Red_Tracer_762x39_AK47_bakelite_M"], ["CUP_1Rnd_HE_GP25_M"], ""],
			["CUP_arifle_AKM_GL_Early", "", "CUP_acc_Flashlight", "", ["CUP_30Rnd_762x39_AK47_bakelite_M", "CUP_30Rnd_TE1_Red_Tracer_762x39_AK47_bakelite_M"], ["CUP_1Rnd_HE_GP25_M"], ""],
			["CUP_arifle_AKM_GL", "", "CUP_acc_Flashlight", "", ["CUP_30Rnd_762x39_AK47_bakelite_M", "CUP_30Rnd_TE1_Red_Tracer_762x39_AK47_bakelite_M"], ["CUP_1Rnd_HE_GP25_M"], ""],
			["CUP_arifle_AKM_GL_top_rail", "", "CUP_acc_Flashlight", "", ["CUP_30Rnd_762x39_AK47_bakelite_M", "CUP_30Rnd_TE1_Red_Tracer_762x39_AK47_bakelite_M"], ["CUP_1Rnd_HE_GP25_M"], ""]
		];
		_militiaSMGs append [
			["CUP_smg_MP5A5_Rail", "", "acc_flashlight", "", ["CUP_30Rnd_9x19_MP5", "CUP_30Rnd_Red_Tracer_9x19_MP5"], [], ""],
			["CUP_smg_MP5A5_Rail_AFG", "", "acc_flashlight", "", ["CUP_30Rnd_9x19_MP5", "CUP_30Rnd_Red_Tracer_9x19_MP5"], [], ""],
			["CUP_smg_MP5A5_Rail_VFG", "", "acc_flashlight", "", ["CUP_30Rnd_9x19_MP5", "CUP_30Rnd_Red_Tracer_9x19_MP5"], [], ""],
			["CUP_smg_MP5A5_Rail", "", "CUP_acc_Flashlight", "", ["CUP_30Rnd_9x19_MP5", "CUP_30Rnd_Red_Tracer_9x19_MP5"], [], ""],
			["CUP_smg_MP5A5_Rail_AFG", "", "CUP_acc_Flashlight", "", ["CUP_30Rnd_9x19_MP5", "CUP_30Rnd_Red_Tracer_9x19_MP5"], [], ""],
			["CUP_smg_MP5A5_Rail_VFG", "", "CUP_acc_Flashlight", "", ["CUP_30Rnd_9x19_MP5", "CUP_30Rnd_Red_Tracer_9x19_MP5"], [], ""]
		];
		_militiamarksmanRifles append [
			["CUP_srifle_SVD", "", "", "CUP_optic_PSO_3", ["CUP_10Rnd_762x54_SVD_M"], [], ""]
		];
		_militiasniperRifles append [
			["CUP_srifle_SVD", "", "", "CUP_optic_PSO_3", ["CUP_10Rnd_762x54_SVD_M"], [], ""]
		];
		_militiauniforms append ["CUP_I_B_PMC_Unit_39", "CUP_U_O_SLA_Green"];
		_militiahelmets append ["CUP_H_SLA_Helmet", "CUP_H_SLA_Helmet_OD_worn", "CUP_H_RUS_SSH68_green", "CUP_H_RUS_SSH68_olive"];
		_militialightATLaunchers append ["CUP_launch_M72A6"];

		_crewvests append ["CUP_V_PMC_CIRAS_OD_Veh"];
		_crewhelmets append ["CUP_H_CVC"];
		_pilotuniforms append ["CUP_U_B_USArmy_PilotOverall"];
	}; 
	if (isClass (configFile >> "CfgFactionClasses" >> "rhs_faction_usarmy") && !isClass (configFile >> "CfgPatches" >> "CUP_AirVehicles_Core")) then {
		_cargoTrucks        append ["rhsusf_M1084A1R_SOV_M2_WD_fmtv_socom", "rhsusf_M1078A1P2_WD_flatbed_fmtv_usarmy", "rhsusf_M1078A1P2_B_WD_flatbed_fmtv_usarmy", "rhsusf_M1078A1P2_B_M2_WD_flatbed_fmtv_usarmy", "rhsusf_M1083A1P2_WD_flatbed_fmtv_usarmy", "rhsusf_M1083A1P2_B_WD_flatbed_fmtv_usarmy", "rhsusf_M1083A1P2_B_M2_WD_flatbed_fmtv_usarmy", "rhsusf_M1084A1P2_WD_fmtv_usarmy", "rhsusf_M1084A1P2_B_WD_fmtv_usarmy", "rhsusf_M1084A1P2_B_M2_WD_fmtv_usarmy", "rhsusf_M977A4_usarmy_wd", "rhsusf_M977A4_BKIT_usarmy_wd", "rhsusf_M977A4_BKIT_M2_usarmy_wd"];
		_ammoTrucks         append ["rhsusf_M977A4_AMMO_usarmy_wd", "rhsusf_M977A4_AMMO_BKIT_usarmy_wd", "rhsusf_M977A4_AMMO_BKIT_M2_usarmy_wd"];
		_repairTrucks       append ["rhsusf_M977A4_REPAIR_usarmy_wd", "rhsusf_M977A4_REPAIR_BKIT_M2_usarmy_wd", "rhsusf_M977A4_REPAIR_BKIT_usarmy_wd"];
		_fuelTrucks         append ["rhsusf_M978A4_usarmy_wd", "rhsusf_M978A4_BKIT_usarmy_wd"];
		_planesCAS  		append ["RHS_A10"];
		_planesAA   		append ["rhsusf_f22"];
		_helisAttack        append ["RHS_AH64D_wd"];
		_uavsAttack     	append ["B_UAV_02_CAS_F"];
		_staticMG       	append ["RHS_M2StaticMG_WD"];
		_staticAA       	append ["RHS_Stinger_AA_pod_WD"];
		_staticMortars  	append ["B_Mortar_01_F"];

		_NVGs append ["rhsusf_ANPVS_14"];
		_rangefinders append ["Rangefinder"];

		_sfbinoculars append ["Laserdesignator"];
		_elitebinoculars append ["Laserdesignator"];
		_militarybinoculars append ["Laserdesignator"];
		if (isClass (configFile >> "CfgFactionClasses" >> "rhssaf_faction_army")) then {
			_militialightATLaunchers append ["rhs_weap_rpg75"];
		};
	};
} else {
	_cargoTrucks        append ["B_T_Truck_01_cargo_F", "B_T_Truck_01_flatbed_F"];
	_ammoTrucks         append ["B_T_Truck_01_ammo_F"];
	_repairTrucks       append ["B_T_Truck_01_Repair_F"];
	_fuelTrucks         append ["B_T_Truck_01_fuel_F"];
	_planesCAS  		append ["B_Plane_CAS_01_dynamicLoadout_F"];
	_planesAA   		append ["B_Plane_Fighter_01_F"];
	_helisAttack        append [];
	_uavsAttack     	append ["B_UAV_02_CAS_F"];
	_staticMG       	append ["B_G_HMG_02_high_F"];
	_staticAA       	append ["B_static_AA_F"];
	_staticMortars  	append ["B_Mortar_01_F"];
	
	_NVGs append ["NVGoggles"];
	_rangefinders append ["Rangefinder"];

	_sfbinoculars append ["Laserdesignator"];
	_elitebinoculars append ["Laserdesignator"];
	_militarybinoculars append ["Laserdesignator"];
	_militialightATLaunchers append [];
};