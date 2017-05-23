/*
	fn_createZonePatrol
	Author: Sinbane
	Spawns 2 groups of AI at the nearest base/camp to the zone and sends them to patrol it
*/
private ["_spawnPos","_type"];
params [
	["_zone",[]],
	["_side",nil],
	["_type",nil]
];

if (_zone isEqualTo [] || isNil "_side" || isNil "_type") exitWith {};

_zonePos = (_zone select 1);
_zoneSize = (_zone select 2 select 0);

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