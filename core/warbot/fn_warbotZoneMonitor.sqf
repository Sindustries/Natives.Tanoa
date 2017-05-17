/*
	fn_warbotZoneMonitor
	Author: Sinbane
	Monitors zones and switches occupying faction accordingly
*/
private [];

zoneUpdateMsg = {
	_zoneName = _this select 0;
	_faction = _this select 1;
	[[format["%1 \n HAS BEEN CAPTURED BY THE %2",_zoneName,_faction],"PLAIN DOWN",0.6]] remoteExec ["titleText",0];
};

//-----------------------------------
while {true} do {

	sleep 30;

	//MILITARY CHECK
	if (count NATmilitaryZones > 0) then {
		{
			_zoneName = (_x select 0);
			_zonePos = (_x select 1);
			_zoneSize = (_x select 2 select 0);
			_marker = (_x select 3);
			_military = {alive _x && side _x isEqualTo WEST && _x distance _zonePos < _zoneSize} count allUnits;
			_militia = {alive _x && side _x isEqualTo EAST && _x distance _zonePos < _zoneSize} count allUnits;
			_native = {alive _x && side _x isEqualTo RESISTANCE && _x distance _zonePos < _zoneSize} count allUnits;

			if (_military < _militia || _military < _native) then {
				NATmilitaryZones deleteAt _forEachIndex;
				if (_militia > _native) then {
					NATmilitiaZones pushBackUnique _x;
					_marker setMarkerColor "ColorEAST";
					[_zoneName,"MILITIA"] remoteExec ["zoneUpdateMsg",0];
				} else {
					NATnativeZones pushBackUnique _x;
					_marker setMarkerColor "ColorGUER";
					[_zoneName,"NATIVES"] remoteExec ["zoneUpdateMsg",0];
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
			_military = {alive _x && side _x isEqualTo WEST && _x distance _zonePos < _zoneSize} count allUnits;
			_militia = {alive _x && side _x isEqualTo EAST && _x distance _zonePos < _zoneSize} count allUnits;
			_native = {alive _x && side _x isEqualTo RESISTANCE && _x distance _zonePos < _zoneSize} count allUnits;

			if (_militia < _military || _militia < _native) then {
				NATmilitiaZones deleteAt _forEachIndex;
				if (_military > _native) then {
					NATmilitaryZones pushBackUnique _x;
					_marker setMarkerColor "ColorWEST";
					[_zoneName,"MILITARY"] remoteExec ["zoneUpdateMsg",0];
				} else {
					NATnativeZones pushBackUnique _x;
					_marker setMarkerColor "ColorGUER";
					[_zoneName,"NATIVES"] remoteExec ["zoneUpdateMsg",0];
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
			_military = {alive _x && side _x isEqualTo WEST && _x distance _zonePos < _zoneSize} count allUnits;
			_militia = {alive _x && side _x isEqualTo EAST && _x distance _zonePos < _zoneSize} count allUnits;
			_native = {alive _x && side _x isEqualTo RESISTANCE && _x distance _zonePos < _zoneSize} count allUnits;

			if (_native < _military || _native < _militia) then {
				NATnativeZones deleteAt _forEachIndex;
				if (_military > _militia) then {
					NATmilitaryZones pushBackUnique _x;
					_marker setMarkerColor "ColorWEST";
					[_zoneName,"MILITARY"] remoteExec ["zoneUpdateMsg",0];
				} else {
					NATmilitiaZones pushBackUnique _x;
					_marker setMarkerColor "ColorEAST";
					[_zoneName,"MILITIA"] remoteExec ["zoneUpdateMsg",0];
				};
			};
		} forEach NATmilitaryZones;
	};
};