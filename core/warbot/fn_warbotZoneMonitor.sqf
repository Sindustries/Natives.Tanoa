/*
	fn_warbotZoneMonitor
	Author: Sinbane
	Monitors zones and switches occupying faction accordingly
*/
private ["_toRemove"];

zoneUpdateMsg = {
	_zoneName = _this select 0;
	_faction = _this select 1;
	[10000,[format["LOCATION UPDATE \n %1 has been captured by The %2",_zoneName,_faction],"PLAIN DOWN",0.8,true]] remoteExec ["cutText",0];
};

//-----------------------------------

sleep 30;

//CIVILIAN CHECK
if (count NATcivilianZones > 0) then {
	{
		_zoneName = (_x select 0);
		_zonePos = (_x select 1);
		_zoneSize = (_x select 2 select 0);
		_marker = (_x select 3);
		_military = {alive _x && side _x isEqualTo WEST && _x distance2D _zonePos < _zoneSize} count allUnits;
		_militia = {alive _x && side _x isEqualTo EAST && _x distance2D _zonePos < _zoneSize} count allUnits;
		_native = {alive _x && side _x isEqualTo RESISTANCE && _x distance2D _zonePos < _zoneSize} count allUnits;

		if (_military > _militia && _military > _native) then {
			NATcivilianZones set [_forEachIndex,objNull];
			NATmilitaryZones pushBackUnique _x;
			_marker setMarkerColor "ColorWEST";
			_marker setMarkerAlpha 0.5;
			[_x,WEST] call NAT_fnc_createZonePatrol;
		};
		if (_militia > _military && _militia > _native) then {
			NATcivilianZones set [_forEachIndex,objNull];
			NATmilitiaZones pushBackUnique _x;
			_marker setMarkerColor "ColorEAST";
			_marker setMarkerAlpha 0.5;
		};
		if (_native > _military && _native > _militia) then {
			NATcivilianZones set [_forEachIndex,objNull];
			NATnativeZones pushBackUnique _x;
			_marker setMarkerColor "ColorGUER";
			_marker setMarkerAlpha 0.5;
			//CREATE ZOMBIE SPAWNERS
			for "_i" from 0 to floor(random(_zoneSize/20)) do {
				_pos = [_zonePos,0,_zoneSize,0] call SIN_fnc_findPos;
				[_pos] call Z_fnc_setSpawn;
			};
		};
		sleep 0.001;
	} foreach NATcivilianZones;
	NATcivilianZones = NATcivilianZones - [objNull];
};
//MILITARY CHECK
if (count NATmilitaryZones > 0) then {
	{
		_zoneName = (_x select 0);
		_zonePos = (_x select 1);
		_zoneSize = (_x select 2 select 0);
		_marker = (_x select 3);
		_military = {alive _x && side _x isEqualTo WEST && _x distance2D _zonePos < _zoneSize} count allUnits;
		_militia = {alive _x && side _x isEqualTo EAST && _x distance2D _zonePos < _zoneSize} count allUnits;
		_native = {alive _x && side _x isEqualTo RESISTANCE && _x distance2D _zonePos < _zoneSize} count allUnits;

		if (_militia > _military && _militia > _native) then {
			NATmilitaryZones set [_forEachIndex,objNull];
			NATmilitiaZones pushBackUnique _x;
			_marker setMarkerColor "ColorEAST";
			_marker setMarkerAlpha 0.5;
		};
		if (_native > _military && _native > _militia) then {
			NATmilitaryZones set [_forEachIndex,objNull];
			NATnativeZones pushBackUnique _x;
			_marker setMarkerColor "ColorGUER";
			_marker setMarkerAlpha 0.5;
			//CREATE ZOMBIE SPAWNERS
			for "_i" from 0 to floor(random(_zoneSize/20)) do {
				_pos = [_zonePos,0,_zoneSize,0] call SIN_fnc_findPos;
				[_pos] call Z_fnc_setSpawn;
			};
		};
		sleep 0.001;
	} foreach NATmilitaryZones;
	NATmilitaryZones = NATmilitaryZones - [objNull];
};
//MILITIA CHECK
if (count NATmilitiaZones > 0) then {
	{
		_zoneName = (_x select 0);
		_zonePos = (_x select 1);
		_zoneSize = (_x select 2 select 0);
		_marker = (_x select 3);
		_military = {alive _x && side _x isEqualTo WEST && _x distance2D _zonePos < _zoneSize} count allUnits;
		_militia = {alive _x && side _x isEqualTo EAST && _x distance2D _zonePos < _zoneSize} count allUnits;
		_native = {alive _x && side _x isEqualTo RESISTANCE && _x distance2D _zonePos < _zoneSize} count allUnits;

		if (_military > _militia && _military > _native) then {
			NATmilitiaZones set [_forEachIndex,objNull];
			NATmilitaryZones pushBackUnique _x;
			_marker setMarkerColor "ColorWEST";
			_marker setMarkerAlpha 0.5;
		};
		if (_native > _militia && _native > _military) then {
			NATmilitiaZones set [_forEachIndex,objNull];
			NATnativeZones pushBackUnique _x;
			_marker setMarkerColor "ColorGUER";
			_marker setMarkerAlpha 0.5;
			//CREATE ZOMBIE SPAWNERS
			for "_i" from 0 to floor(random(_zoneSize/20)) do {
				_pos = [_zonePos,0,_zoneSize,0] call SIN_fnc_findPos;
				[_pos] call Z_fnc_setSpawn;
			};
		};
		sleep 0.001;
	} foreach NATmilitiaZones;
	NATmilitiaZones = NATmilitiaZones - [objNull];
};
//NATIVE CHECK
if (count NATnativeZones > 0) then {
	{
		_zoneName = (_x select 0);
		_zonePos = (_x select 1);
		_zoneSize = (_x select 2 select 0);
		_marker = (_x select 3);
		_military = {alive _x && side _x isEqualTo WEST && _x distance2D _zonePos < _zoneSize} count allUnits;
		_militia = {alive _x && side _x isEqualTo EAST && _x distance2D _zonePos < _zoneSize} count allUnits;
		_native = {alive _x && side _x isEqualTo RESISTANCE && _x distance2D _zonePos < _zoneSize} count allUnits;

		if (_military > _native && _military > _militia) then {
			NATnativeZones set [_forEachIndex,objNull];
			NATmilitaryZones pushBackUnique _x;
			_marker setMarkerColor "ColorWEST";
			_marker setMarkerAlpha 0.5;
		};
		if (_militia > _military && _militia > _native) then {
			NATnativeZones set [_forEachIndex,objNull];
			NATmilitiaZones pushBackUnique _x;
			_marker setMarkerColor "ColorEAST";
			_marker setMarkerAlpha 0.5;
		};
		sleep 0.001;
	} foreach NATnativeZones;
	NATnativeZones = NATnativeZones - [objNull];
};

[] spawn NAT_fnc_warbotZoneMonitor;
//-----------------------------------