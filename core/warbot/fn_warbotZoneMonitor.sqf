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

zoneAdjustFP = {
	_faction = _this select 0;
	_add = _this select 1;
	switch (_faction) do {
		case "military": {
			if (_add) then {
				NATmilitaryForcePower = NATmilitaryForcePower + floor(random 5)+1;
				NATresFood = NATresFood + floor(random 10)+1;
				NATresWater = NATresWater + floor(random 10)+1;
				NATresScrap = NATresScrap + floor(random 10)+1;
				publicVariable "NATresFood"; publicVariable "NATresWater"; publicVariable "NATresScrap";
			} else {
				NATmilitaryForcePower = NATmilitaryForcePower - floor(random 5)+1;
			};
			if (NATmilitaryForcePower > NATmaxUnits) then {
				NATmilitaryForcePower = NATmaxUnits;
			};
			if (NATmilitaryForcePower < 0) then {
				NATmilitaryForcePower = 0;
			};
			publicVariable "NATmilitaryForcePower";
		};
		case "militia": {
			if (_add) then {
				NATmilitiaForcePower = NATmilitiaForcePower + floor(random 5)+1;
			} else {
				NATmilitiaForcePower = NATmilitiaForcePower - floor(random 5)+1;
			};
			if (NATmilitiaForcePower > NATmaxUnits) then {
				NATmilitiaForcePower = NATmaxUnits;
			};
			if (NATmilitiaForcePower < 0) then {
				NATmilitiaForcePower = 0;
			};
			publicVariable "NATmilitiaForcePower";
		};
		case "native": {
			if (_add) then {
				NATnativeForcePower = NATnativeForcePower + floor(random 5)+1;
			} else {
				NATnativeForcePower = NATnativeForcePower - floor(random 5)+1;
			};
			if (NATnativeForcePower > NATmaxUnits) then {
				NATnativeForcePower = NATmaxUnits;
			};
			if (NATnativeForcePower < 0) then {
				NATnativeForcePower = 0;
			};
			publicVariable "NATnativeForcePower";
		};
	};
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
			["military",true] call zoneAdjustFP;
			[_zoneName,"Military"] call zoneUpdateMsg;
		};
		if (_militia > _military && _militia > _native) then {
			NATcivilianZones set [_forEachIndex,objNull];
			NATmilitiaZones pushBackUnique _x;
			_marker setMarkerColor "ColorEAST";
			_marker setMarkerAlpha 0.5;
			["militia",true] call zoneAdjustFP;
			[_zoneName,"Militia"] call zoneUpdateMsg;
		};
		if (_native > _military && _native > _militia) then {
			NATcivilianZones set [_forEachIndex,objNull];
			NATnativeZones pushBackUnique _x;
			_marker setMarkerColor "ColorGUER";
			_marker setMarkerAlpha 0.5;
			["native",true] call zoneAdjustFP;
			[_zoneName,"Natives"] call zoneUpdateMsg;
			//CREATE ZOMBIE SPAWNERS
			for "_i" from 0 to floor(random(_zoneSize/20)) do {
				_pos = [_zonePos,0,_zoneSize,0] call SIN_fnc_findPos;
				[_pos,_zoneSize] call Z_fnc_setSpawn;
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
			["military",false] call zoneAdjustFP;
			["militia",true] call zoneAdjustFP;
			[_zoneName,"Militia"] call zoneUpdateMsg;
		};
		if (_native > _military && _native > _militia) then {
			NATmilitaryZones set [_forEachIndex,objNull];
			NATnativeZones pushBackUnique _x;
			_marker setMarkerColor "ColorGUER";
			_marker setMarkerAlpha 0.5;
			["military",false] call zoneAdjustFP;
			["native",true] call zoneAdjustFP;
			[_zoneName,"Natives"] call zoneUpdateMsg;
			//CREATE ZOMBIE SPAWNERS
			for "_i" from 0 to floor(random(_zoneSize/20)) do {
				_pos = [_zonePos,0,_zoneSize,0] call SIN_fnc_findPos;
				[_pos,_zoneSize] call Z_fnc_setSpawn;
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
			["militia",false] call zoneAdjustFP;
			["military",true] call zoneAdjustFP;
			[_zoneName,"Military"] call zoneUpdateMsg;
		};
		if (_native > _militia && _native > _military) then {
			NATmilitiaZones set [_forEachIndex,objNull];
			NATnativeZones pushBackUnique _x;
			_marker setMarkerColor "ColorGUER";
			_marker setMarkerAlpha 0.5;
			["militia",false] call zoneAdjustFP;
			["native",true] call zoneAdjustFP;
			[_zoneName,"Natives"] call zoneUpdateMsg;
			//CREATE ZOMBIE SPAWNERS
			for "_i" from 0 to floor(random(_zoneSize/20)) do {
				_pos = [_zonePos,0,_zoneSize,0] call SIN_fnc_findPos;
				[_pos,_zoneSize] call Z_fnc_setSpawn;
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
			["native",false] call zoneAdjustFP;
			["military",true] call zoneAdjustFP;
			[_zoneName,"Military"] call zoneUpdateMsg;
		};
		if (_militia > _military && _militia > _native) then {
			NATnativeZones set [_forEachIndex,objNull];
			NATmilitiaZones pushBackUnique _x;
			_marker setMarkerColor "ColorEAST";
			_marker setMarkerAlpha 0.5;
			["native",false] call zoneAdjustFP;
			["militia",true] call zoneAdjustFP;
			[_zoneName,"Militia"] call zoneUpdateMsg;
		};
		sleep 0.001;
	} foreach NATnativeZones;
	NATnativeZones = NATnativeZones - [objNull];
};

[] spawn NAT_fnc_warbotZoneMonitor;
//-----------------------------------