#include "INCLUDES\Init_Base.sqf"

//////////////////////////
//   Side Information   //
//////////////////////////

["name", "NATO"] call _fnc_saveToTemplate;
["spawnMarkerName", format [localize "STR_supportcorridor", "BLUFOR"]] call _fnc_saveToTemplate;

["flag", "Flag_NATO_F"] call _fnc_saveToTemplate;
["flagTexture", "a3\Data_F\Flags\Flag_NATO_CO.paa"] call _fnc_saveToTemplate;
["flagMarkerType", "flag_NATO"] call _fnc_saveToTemplate;


/////////////////////////////////
//    Include Factions here    //
/////////////////////////////////

if (isClass (configFile >> "CfgFactionClasses" >> "rhs_faction_usarmy")) then {

    if (isClass (configFile >> "CfgFactionClasses" >> "UK3CB_FIA_B")) then {
        #include "3CBF\3CBF_Vehicle_Attributes.sqf"

        if (isClass (configFile >> "CfgFactionClasses" >> "UK3CB_FIA_B")) then { // TODO Change to BAF faction class at home
            #include "3CBBAF\MIX_BAF_Temperate.sqf"
            #include "3CBBAF\3CBBAF_Vehicle_Attributes.sqf"
        };
    }
    #include "RHS\RHS_Vehicle_Attributes.sqf"
};

if (isClass (configFile >> "CfgVehicles" >> "BWA3_Dingo2_FLW200_M2_CG13_Fleck")) then {
    #include "BWA3\MIX_BW_Temperate.sqf"
    #include "BWA3\BWA3_Vehicle_Attributes.sqf"
};

if (isClass (configFile >> "CfgVehicles" >> "B_AMF_TANK_01") && isClass(configFile >> "CfgVehicles" >> "R3F_WeaponStock")) then {
    #include "AMF\MIX_AMF_Temperate.sqf"
};

//////////////////////////////////
//  End Include Factions here   //
//////////////////////////////////


#include "INCLUDES\Init_Layouts.sqf"