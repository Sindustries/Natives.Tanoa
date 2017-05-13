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

	if ((player getVariable ["NATneedsThirst",0]) >= 1) then {
		player setDamage 1;
	};

	sleep (_time/(player getVariable ["NATneedsThirstMult",1]));
	[3,1,_value] call NAT_fnc_needsUpdate;
	[4,0,(player getVariable ["NATneedsThirstMult",1])] call NAT_fnc_needsUpdate;
};

//-----------------------------------