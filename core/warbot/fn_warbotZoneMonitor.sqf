/*
	fn_warbotZoneMonitor
	Author: Sinbane
	Monitors zones and switches occupying faction accordingly
*/
private [];

zoneUpdateMsg = {
	_zoneName = _this select 0;
	_faction = _this select 1;
	[10000,[format["LOCATION UPDATE \n %1 has been captured by The %2",_zoneName,_faction],"PLAIN DOWN",0.8,true]] remoteExec ["cutText",0];
};

//-----------------------------------

sleep 30;

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

		if (_military < _militia || _military < _native) then {
			NATmilitaryZones deleteAt _forEachIndex;
			if (_militia > _native) then {
				NATmilitiaZones pushBackUnique _x;
				_marker setMarkerColor "ColorEAST";
				[_zoneName,"Militia"] remoteExec ["zoneUpdateMsg",0];
				if (count NATmilitiaCamps > 0) then {
					[_zonePos,_zoneSize,east,"militia"] call NAT_fnc_createZonePatrol;
				};
			} else {
				NATnativeZones pushBackUnique _x;
				_marker setMarkerColor "ColorGUER";
				[_zoneName,"Natives"] remoteExec ["zoneUpdateMsg",0];
				//CREATE ZOMBIE SPAWNERS
				for "_i" from 1 to floor(random (_zoneSize/20)) do {
					_pos = [_zonePos,0,(_zoneSize*0.75),0] call SIN_fnc_findPos;
					[_pos] call Z_fnc_setSpawn;
				};
				if (count NATnativeCamps > 0) then {
					[_zonePos,_zoneSize,resistance,"native"] call NAT_fnc_createZonePatrol;
				};
			};
		};
	} forEach NATmilitaryZones;
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

		if (_militia < _military || _militia < _native) then {
			NATmilitiaZones deleteAt _forEachIndex;
			if (_military > _native) then {
				NATmilitaryZones pushBackUnique _x;
				_marker setMarkerColor "ColorWEST";
				[_zoneName,"Military"] remoteExec ["zoneUpdateMsg",0];
				if (count NATmilitaryCamps > 0) then {
					[_zonePos,_zoneSize,west,"military"] call NAT_fnc_createZonePatrol;
				};
			} else {
				NATnativeZones pushBackUnique _x;
				_marker setMarkerColor "ColorGUER";
				[_zoneName,"Natives"] remoteExec ["zoneUpdateMsg",0];
				//CREATE ZOMBIE SPAWNERS
				for "_i" from 1 to (random (_zoneSize/20)) do {
					_pos = [_zonePos,0,(_zoneSize*0.75),0] call SIN_fnc_findPos;
					[_pos] call Z_fnc_setSpawn;
				};
				if (count NATnativeCamps > 0) then {
					[_zonePos,_zoneSize,resistance,"native"] call NAT_fnc_createZonePatrol;
				};
			};
		};
	} forEach NATmilitiaZones;
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

		if (_native < _military || _native < _militia) then {
			NATnativeZones deleteAt _forEachIndex;
			if (_military > _militia) then {
				NATmilitaryZones pushBackUnique _x;
				_marker setMarkerColor "ColorWEST";
				[_zoneName,"Military"] remoteExec ["zoneUpdateMsg",0];
				if (count NATmilitaryCamps > 0) then {
					[_zonePos,_zoneSize,west,"military"] call NAT_fnc_createZonePatrol;
				};
			} else {
				NATmilitiaZones pushBackUnique _x;
				_marker setMarkerColor "ColorEAST";
				[_zoneName,"Militia"] remoteExec ["zoneUpdateMsg",0];
				if (count NATmilitiaCamps > 0) then {
					[_zonePos,_zoneSize,east,"militia"] call NAT_fnc_createZonePatrol;
				};
			};
			//REMOVE ZOMBIE SPAWNERS
			{
				if (_x distance2D _zonePos <= _zoneSize) then {
					NAT_zSpawnerArray deleteAt _forEachIndex;
				};
			} forEach NAT_zSpawnerArray;
		};
	} forEach NATnativeZones;
};

[] spawn NAT_fnc_warbotZoneMonitor;
//-----------------------------------