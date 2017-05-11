/*
    fn_needsThirst
    Author: Sinbane

    Description:
    Monitors the player thirst level
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

	sleep (_time*(player getVariable ["NATneedsRadiationMult",1]));
	[7,2,_value] call NAT_fnc_needsUpdate;

	if ((player getVariable ["NATneedsRadiation",0]) > 0.1) then {
		player setVariable ["NATneedsHealthy",false];
	} else {
		player setVariable ["NATneedsHealthy",true];
	};
};

//-----------------------------------