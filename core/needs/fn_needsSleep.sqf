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

	sleep (_time*(player getVariable ["NATneedsSleepMult",1]));
	[5,1,_value] call NAT_fnc_needsUpdate;
	player setCustomAimCoef (player getVariable "NATneedsSleep");

	if (player getVariable "NATneedsSleep" <= 0.25 && player getVariable "NATneedsSleep" > 0) then {
		 player setAnimSpeedCoef 1.1;
		 player setVariable ["NATneedsEnergised",true];
	};
	if (player getVariable "NATneedsSleep" <= 0.5 && player getVariable "NATneedsSleep" > 0.25) then {
		 player setAnimSpeedCoef 1;
		 player setVariable ["NATneedsEnergised",false];
	};
	if (player getVariable "NATneedsSleep" <= 0.75 && player getVariable "NATneedsSleep" > 0.5) then {
		 player setAnimSpeedCoef 0.9;
		 player setVariable ["NATneedsEnergised",false];
	};
	if (player getVariable "NATneedsSleep" <= 1 && player getVariable "NATneedsSleep" > 0.75) then {
		 player setAnimSpeedCoef 0.8;
		 player setVariable ["NATneedsEnergised",false];
	};
};

//-----------------------------------