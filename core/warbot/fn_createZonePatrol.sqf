/*
	fn_createZonePatrol
	Author: Sinbane
	Spawns 2 groups of AI at the nearest base/camp to the zone and sends them to patrol it
*/
private ["_spawnPos"];
params [
	["_zonePos",[0,0,0]],
	["_zoneSize",0],
	["_side",nil],
	["_type",nil]
];

if (_zonePos isEqualTo [0,0,0] || _zoneSize isEqualTo 0 || isNil "_side" || isNil "_type") exitWith {};

_nearestBase = [_zonePos,_type] call NAT_fnc_findNearestBase;
_sameZone = [_zonePos,_nearestBase] call SIN_fnc_zoneCheck;
if (_sameZone) then {
	_spawnPos = _nearestBase;
	_group = [_spawnPos,_side,_type,4] call NAT_fnc_createGroup;
	_wp = [_group,_zonePos] call NAT_fnc_createWaypoint;
	_wp setWaypointCompletionRadius _zoneSize;
	[_group,_zonePos,(_zoneSize*0.75),(_zoneSize/50),"MOVE","SAFE","YELLOW","FULL","STAG COLUMN"] call CBA_fnc_taskPatrol;
};

//-----------------------------------