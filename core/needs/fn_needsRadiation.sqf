/*
    fn_needsRadiation
    Author: Sinbane

    Description:
    Monitors the player radiation level
*/

params [
	["_time",0],
	["_value",0]
];

if (_time <= 0 || _value <= 0) exitWith {};

while {alive player} do {
//-----------------------------------

	if ((player getVariable ["NATneedsRadiation",0]) >= 1) then {
		player setDamage 1;
	};

	[7,2,_value] call NAT_fnc_needsUpdate;
	[8,0,(player getVariable ["NATneedsRadiationMult",1])] call NAT_fnc_needsUpdate;

	_math = ((1-(player getVariable ["NATneedsRadiation",0]))*100);
	NATneedsRadiationPerc = [_math,0] call BIS_fnc_cutDecimals;

	if ((player getVariable ["NATneedsRadiation",0]) > 0.1) then {
		player setVariable ["NATneedsHealthy",false];
	} else {
		player setVariable ["NATneedsHealthy",true];
		player setVariable ["NATneedsRadiationLevel",0];
	};

	//-RADIATION LEVELS
	if ((player getVariable ["NATneedsRadiation",0]) >= 0.1 && (player getVariable ["NATneedsRadiation",0]) < 0.33) then {
		player setVariable ["NATneedsRadiationLevel",1];
	};
	if ((player getVariable ["NATneedsRadiation",0]) >= 0.33 && (player getVariable ["NATneedsRadiation",0]) < 0.66) then {
		player setVariable ["NATneedsRadiationLevel",2];
		player setCustomAimCoef 5;
	};
	if ((player getVariable ["NATneedsRadiation",0]) >= 0.66 && (player getVariable ["NATneedsRadiation",0]) < 1) then {
		player setVariable ["NATneedsRadiationLevel",3];
		player setCustomAimCoef 10;
		player setDamage ((damage player)+_value);
	};

	if (NATHUD) then {
		uiNameSpace getVariable "SLEEPBAR" progressSetPosition (1-(player getVariable ["NATneedsSleep",0]));
	};
	sleep (_time/(player getVariable ["NATneedsRadiationMult",1]));
};

//-----------------------------------