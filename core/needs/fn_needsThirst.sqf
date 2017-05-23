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

	[3,1,_value] call NAT_fnc_needsUpdate;
	[4,0,(player getVariable ["NATneedsThirstMult",1])] call NAT_fnc_needsUpdate;
	_math = ((1-(player getVariable ["NATneedsThirst",0]))*100);
	NATneedsThirstPerc = [_math,0] call BIS_fnc_cutDecimals;

	if (NATHUD) then {
		uiNameSpace getVariable "THIRSTBAR" progressSetPosition (1-(player getVariable ["NATneedsThirst",0]));
	};
	sleep (_time/(player getVariable ["NATneedsThirstMult",1]));
};

//-----------------------------------