/*
	fn_message
	Author: Sinbane
	Displays custom message box
*/
private [];

params [
    ["_type",-1],
    ["_msg","ERROR: NO MESSAGE"],
    ["_time",6]
];

if (_type isEqualTo -1) exitWith {};

WLD_MessageCount = 1;
//-----------------------------------
switch (_type) do {
	case 1: {
		("HUDsmlLayer" call BIS_fnc_rscLayer) cutRsc ["WLD_statusSML","PLAIN",-1,false];
		uiNameSpace getVariable "WLD_HUD_statusSML" ctrlSetText _msg;
	};
	case 2: {
		("HUDbigLayer" call BIS_fnc_rscLayer) cutRsc ["WLD_statusBIG","PLAIN",-1,false];
		uiNameSpace getVariable "WLD_HUD_statusBIG" ctrlSetText _msg;
	};
};
//-----------------------------------
playSound "3DEN_notificationDefault";
sleep _time;
//-----------------------------------
switch (_type) do {
	case 1: {
		("HUDsmlLayer" call BIS_fnc_rscLayer) cutText ["","PLAIN"];
	};
	case 2: {
		("HUDbigLayer" call BIS_fnc_rscLayer) cutText ["","PLAIN"];
	};
};
//-----------------------------------

//-----------------------------------

/*

[] spawn {
	("HUDGUILayer" call BIS_fnc_rscLayer) cutRsc ["HVP_HUD","PLAIN",-1,false];
	("HUDAbilLayer" call BIS_fnc_rscLayer) cutRsc ["HVPHUD_ability","PLAIN",-1,false];
	("HUDPhaseLayer" call BIS_fnc_rscLayer) cutRsc ["HVPHUD_phase","PLAIN",-1,false];

	if (HVPPhaseType isEqualTo 2) then {
		uiNameSpace getVariable "HVP_HUD_AbilTitle" ctrlSetText "WAITING";
		uiNameSpace getVariable "HVP_HUD_AbilTitle" ctrlSetTextColor [0, 0, 1, 1];
	};
};


*/