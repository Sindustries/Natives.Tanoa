/*
	fn_createZonePatrol
	Author: Sinbane
	Spawns 2 groups of AI at the nearest base/camp to the zone and sends them to patrol it
*/
private [];
params [
	["_zonePos",[0,0,0]],
	["_zoneSize",0],
	["_side",nil],
	["_type",nil]
];

if (_zonePos isEqualTo [0,0,0] || _zoneSize isEqualTo 0 || isNil "_side" || isNil "_type") exitWith {};

_nearestBase = [_zonePos,_type] call NAT_fnc_findNearestBase;
_group = [_nearestBase,_side,_type,4] call NAT_fnc_createGroup;
[_group,_zonePos] call NAT_fnc_createWaypoint;

[_group,_zonePos,_zoneSize] spawn {
	_group = _this select 0;
	_pos = _this select 1;
	_size = _this select 2;
	waitUntil {sleep 10; (leader _group) distance2D _zonePos <= _zoneSize || (count units _group) < 1};
	if (count units _group < 1) exitWith {};
	[_group,_zonePos,(_zoneSize*0.75),(_zoneSize/50),"MOVE","SAFE","YELLOW","FULL","STAG COLUMN"] call CBA_fnc_taskPatrol;
};

//-----------------------------------