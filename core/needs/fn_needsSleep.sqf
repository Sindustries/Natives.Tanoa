/*
    fn_needsSleep
    Author: Sinbane

    Description:
    Monitors the player sleep level
*/

params [
	["_time",0],
	["_value",0]
];

if (_time <= 0 || _value <= 0) exitWith {};

while {alive player} do {
//-----------------------------------

	[5,1,_value] call NAT_fnc_needsUpdate;
	[6,0,(player getVariable ["NATneedsSleepMult",1])] call NAT_fnc_needsUpdate;

	_math = ((1-(player getVariable ["NATneedsSleep",0]))*100);
	NATneedsSleepPerc = [_math,0] call BIS_fnc_cutDecimals;

	if (player getVariable "NATneedsSleep" <= 0.25 && player getVariable "NATneedsSleep" > 0) then {
		if ((player getVariable ["NATneedsRadiationLevel",0]) < 2) then {
			player setAnimSpeedCoef 1.1;
			player setCustomAimCoef (player getVariable "NATneedsSleep");
			player setVariable ["NATneedsSteady",true];
		};
		player setVariable ["NATneedsEnergised",true];
		player setVariable ["NATneedsSleepLevel",0];
	};
	if (player getVariable "NATneedsSleep" <= 0.5 && player getVariable "NATneedsSleep" > 0.25) then {
		if ((player getVariable ["NATneedsRadiationLevel",0]) < 2) then {
			player setAnimSpeedCoef 1;
			player setVariable ["NATneedsSteady",true];
		};
		player setVariable ["NATneedsEnergised",false];
		player setVariable ["NATneedsSleepLevel",1];
	};
	if (player getVariable "NATneedsSleep" <= 0.75 && player getVariable "NATneedsSleep" > 0.5) then {
		if ((player getVariable ["NATneedsRadiationLevel",0]) < 2) then {
			player setAnimSpeedCoef 0.9;
		};
		player setVariable ["NATneedsEnergised",false];
		player setVariable ["NATneedsSteady",false];
		player setVariable ["NATneedsSleepLevel",2];
	};
	if (player getVariable "NATneedsSleep" <= 1 && player getVariable "NATneedsSleep" > 0.75) then {
		if ((player getVariable ["NATneedsRadiationLevel",0]) < 2) then {
			player setAnimSpeedCoef 0.8;
		};
		player setVariable ["NATneedsEnergised",false];
		player setVariable ["NATneedsSteady",false];
		player setVariable ["NATneedsSleepLevel",3];
	};

	if (NATHUD) then {
		uiNameSpace getVariable "SLEEPBAR" progressSetPosition (1-(player getVariable ["NATneedsSleep",0]));
	};
	sleep (_time/(player getVariable ["NATneedsSleepMult",1]));
};

//-----------------------------------