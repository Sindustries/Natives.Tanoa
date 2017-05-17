/*
	fn_findNearestBase
	Author: Sinbane
	Finds the closest base to a position
*/
private ["_return"];
//-----------------------------------
params [
    ["_pos",[0,0,0]],
    ["_type",""]
];
if (_pos isEqualTo [0,0,0] || _type isEqualTo "") exitWith {};
_campPosArray = [];
_return = [0,0,0];
//-----------------------------------
switch (_type) do {
	case "all": {
		{_campPosArray pushBack (_x select 0)} forEach (NATmilitaryCamps+NATmilitiaCamps+NATnativeCamps+NATcivilianCamps);
	};
	case "military": {
		if (count NATmilitaryCamps > 0) then {
			{_campPosArray pushBack (_x select 0)} forEach NATmilitaryCamps;
		};
	};
	case "militia": {
		if (count NATmilitiaCamps > 0) then {
			{_campPosArray pushBack (_x select 0)} forEach NATmilitiaCamps;
		};
	};
	case "native": {
		if (count NATnativeCamps > 0) then {
			{_campPosArray pushBack (_x select 0)} forEach NATnativeCamps;
		};
	};
	case "civilian": {
		if (count NATcivilianCamps > 0) then {
			{_campPosArray pushBack (_x select 0)} forEach NATcivilianCamps;
		};
	};
};
//-----------------------------------
if (count _campPosArray > 0) then {
	_campPosArray = [_campPosArray,[],{_pos distance _x},"ASCEND"] call BIS_fnc_sortBy;
	_return = (_campPosArray select 0);
};
//-----------------------------------
_return;
//-----------------------------------