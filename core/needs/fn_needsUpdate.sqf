/*
    fn_needsHunger
    Author: Sinbane

    Description:
    Monitors the player hunger level
*/
private "_var";
params [
	["_need",0],
	["_add",0],
	["_value",0]
];

if (_need isEqualTo 0) exitWith {};
//-----------------------------------
switch (_need) do {
	case 1: {
		_var = "NATneedsHunger";
	};
	case 2: {
		_var = "NATneedsHungerMult";
	};
	case 3: {
		_var = "NATneedsThirst";
	};
	case 4: {
		_var = "NATneedsThirstMult";
	};
};
//-----------------------------------
switch (_add) do {
	case 0: {
		player setVariable [_var,_value];
	};
	case 1: {
		player setVariable [_var,((player getVariable _var)+_value)];
	};
	case 2: {
		player setVariable [_var,((player getVariable _var)-_value)];
	};
};
//-----------------------------------
if ((player getVariable ["NATneedsHunger",0]) < 0) then {
		player setVariable ["NATneedsHunger",0];
};
if ((player getVariable ["NATneedsHungerMult",1]) < 1 || (player getVariable ["NATneedsHungerMult",1]) > 1) then {
	if ((player getVariable ["NATneedsHungerMult",1]) < 1) then {
		player setVariable ["NATneedsHungerMult",((player getVariable ["NATneedsHungerMult",1])+0.01)];
	};
	if ((player getVariable ["NATneedsHungerMult",1]) > 1) then {
		player setVariable ["NATneedsHungerMult",((player getVariable ["NATneedsHungerMult",1])-0.01)];
	};
};
if ((player getVariable ["NATneedsHungerMult",1]) > 3 || (player getVariable ["NATneedsHungerMult",1]) < 0) then {
	if ((player getVariable ["NATneedsHungerMult",1]) > 3) then {
		player setVariable ["NATneedsHungerMult",3];
	};
	if ((player getVariable ["NATneedsHungerMult",1]) < 0) then {
		player setVariable ["NATneedsHungerMult",0];
	};
};
if ((player getVariable ["NATneedsThirst",0]) < 0) then {
	player setVariable ["NATneedsThirst",0];
};

if ((player getVariable ["NATneedsThirstMult",1]) < 1 || (player getVariable ["NATneedsThirstMult",1]) > 1) then {
	if ((player getVariable ["NATneedsThirstMult",1]) < 1) then {
		player setVariable ["NATneedsThirstMult",((player getVariable ["NATneedsThirstMult",1])+0.01)];
	};
	if ((player getVariable ["NATneedsThirstMult",1]) > 1) then {
		player setVariable ["NATneedsThirstMult",((player getVariable ["NATneedsThirstMult",1])-0.01)];
	};
};

if ((player getVariable ["NATneedsThirstMult",1]) > 3 || (player getVariable ["NATneedsThirstMult",1]) < 0) then {
	if ((player getVariable ["NATneedsThirstMult",1]) > 3) then {
		player setVariable ["NATneedsThirstMult",3];
	};
	if ((player getVariable ["NATneedsThirstMult",1]) < 0) then {
		player setVariable ["NATneedsThirstMult",0];
	};
};
//-----------------------------------