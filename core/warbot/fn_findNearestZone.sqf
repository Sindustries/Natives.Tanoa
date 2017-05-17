/*
	fn_findNearestZone
	Author: Sinbane
	Finds the closest zone to a position
*/
private ["_return"];
//-----------------------------------
params [
    ["_pos",[0,0,0]],
    ["_type",""]
];
if (_pos isEqualTo [0,0,0] || _type isEqualTo "") exitWith {};
_zonePosArray = [];
_return = 0;
//-----------------------------------
switch (_type) do {
	case "military": {
		if (count NATmilitaryZones > 0) then {
			{_zonePosArray pushBack (_x select 1)} forEach NATmilitaryZones;
		};
	};
	case "militia": {
		if (count NATmilitiaZones > 0) then {
			{_zonePosArray pushBack (_x select 0)} forEach NATmilitiaZones;
		};
	};
	case "native": {
		if (count NATnativeZones > 0) then {
			{_zonePosArray pushBack (_x select 0)} forEach NATnativeZones;
		};
	};
};
//-----------------------------------
if (count _zonePosArray > 0) then {
	_zonePosArray = [_zonePosArray,[],{_pos distance _x},"ASCEND"] call BIS_fnc_sortBy;
	_return = (_zonePosArray select 0);
};
//-----------------------------------
_return;
//-----------------------------------