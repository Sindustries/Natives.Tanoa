/*
    fn_needsHUD
    Author: Sinbane

    Description:
   	Updates the needs HUD
*/
private [];
disableSerialization;

if (!NATHUD) then {
	("NATHUDLayer" call BIS_fnc_rscLayer) cutRsc ["NAT_HUD","PLAIN",2,false];
};

NATHUD = true;

_hunger = uiNameSpace getVariable "HUNGERBAR";	// ctrlSetTextColor [1, 0, 0, 1];
_thirst = uiNameSpace getVariable "THIRSTBAR";	// ctrlSetTextColor [1, 0, 0, 1];
_sleep = uiNameSpace getVariable "SLEEPBAR";	// ctrlSetTextColor [1, 0, 0, 1];
_radiation = uiNameSpace getVariable "RADIATIONBAR";	// ctrlSetTextColor [1, 0, 0, 1];

_hunger ctrlSetTextColor [0, 1, 0, 0.75];
_thirst ctrlSetTextColor [0, 1, 0, 0.75];
_sleep ctrlSetTextColor [0, 1, 0, 0.75];
_radiation ctrlSetTextColor [0, 1, 0, 0.75];

_hunger progressSetPosition (1-(player getVariable ["NATneedsHunger",0]));
_thirst progressSetPosition (1-(player getVariable ["NATneedsThirst",0]));
_sleep progressSetPosition (1-(player getVariable ["NATneedsSleep",0]));
_radiation progressSetPosition (1-(player getVariable ["NATneedsRadiation",0]));

//-----------------------------------