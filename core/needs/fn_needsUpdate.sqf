/*
    fn_needsUpdate
    Author: Sinbane

    Description:
    Updates selected need
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
	case 5: {
		_var = "NATneedsSleep";
	};
	case 6: {
		_var = "NATneedsSleepMult";
	};
	case 7: {
		_var = "NATneedsRadiation";
	};
	case 8: {
		_var = "NATneedsRadiationMult";
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
if (_need in [1,3,5,7]) then {
	if ((player getVariable [_var,0]) < 0) then {
		player setVariable [_var,0];
	};
	if ((player getVariable [_var,0]) > 1) then {
		player setVariable [_var,1];
	};
};
if (_need in [2,4,6,8]) then {
	if ((player getVariable [_var,1]) < 1 || (player getVariable [_var,1]) > 1) then {
		if ((player getVariable [_var,1]) < 1) then {
			player setVariable [_var,((player getVariable [_var,1])+(random 0.001))];
		};
		if ((player getVariable [_var,1]) > 1) then {
			player setVariable [_var,((player getVariable [_var,1])-(random 0.001))];
		};
	};
	if ((player getVariable [_var,1]) > 3 || (player getVariable [_var,1]) < 0) then {
		if ((player getVariable [_var,1]) > 3) then {
			player setVariable [_var,3];
		};
		if ((player getVariable [_var,1]) < 0) then {
			player setVariable [_var,0];
		};
	};
};
//-----------------------------------
if (NATHUD) then {
	[] spawn NAT_fnc_needsHUD;
};