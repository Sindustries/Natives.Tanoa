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
_return = [0,0,0];
//-----------------------------------
switch (_type) do {
	case "all": {
		{_zonePosArray pushBack _x} forEach (NATmilitaryZones+NATmilitiaZones+NATnativeZones+NATcivilianZones);
	};
	case "military": {
		if (count NATmilitaryZones > 0) then {
			{_zonePosArray pushBack _x} forEach NATmilitaryZones;
		};
	};
	case "militia": {
		if (count NATmilitiaZones > 0) then {
			{_zonePosArray pushBack _x} forEach NATmilitiaZones;
		};
	};
	case "native": {
		if (count NATnativeZones > 0) then {
			{_zonePosArray pushBack _x} forEach NATnativeZones;
		};
	};
	case "civilian": {
		if (count NATcivilianZones > 0) then {
			{_zonePosArray pushBack _x} forEach NATcivilianZones;
		};
	};
};
//-----------------------------------
if (count _zonePosArray > 0) then {
	_zonePosArray = [_zonePosArray,[],{_pos distance (_x select 1)},"ASCEND"] call BIS_fnc_sortBy;
	_return = (_zonePosArray select 0);
};
//-----------------------------------
_return;
//-----------------------------------