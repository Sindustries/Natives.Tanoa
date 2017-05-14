/*
    fn_needsHunger
    Author: Sinbane

    Description:
    Monitors the player hunger level
*/

params [
	["_time",0],
	["_value",0]
];

if (_time <= 0 || _value <= 0) exitWith {};

while {alive player} do {
//-----------------------------------

	sleep (_time/(player getVariable ["NATneedsHungerMult",1]));
	[1,1,_value] call NAT_fnc_needsUpdate;
	[2,0,(player getVariable ["NATneedsHungerMult",1])] call NAT_fnc_needsUpdate;
};

//-----------------------------------