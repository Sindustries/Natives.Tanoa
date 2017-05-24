/*
	fn_warbotZoneCreator
	Author: Sinbane
	Flags all locations as being overrun or occupied by a force


	NAT_mapLocations = [];
	NAT_mapLocationsCities = [];
	NAT_mapLocationsVillages = [];
	NAT_mapLocationsAirports = [];
	//NAT_mapLocations pushBackUnique [(locationPosition _x),(size _x)];

	NATmilitaryZones = [];
	NATmilitiaZones = [];
	NATnativeZones = [];
*/
private [];
//-----------------------------------
//-FLAG ZONES
//CITIES
{
	if (!(_x in NATmilitaryZones) && !(_x in NATmilitiaZones) && !(_x in NATnativeZones) && !(_x in NATcivilianZones)) then {
		_loc = nearestLocations [(_x select 0),["nameCity","NameCityCapital"],1000,(_x select 0)];
		_name = text (_loc select 0);
		if ((random 100) < 75) then {
			NATcivilianZones pushBackUnique [_name,(_x select 0),(_x select 1)];
		} else {
			if ((random 100) < 90) then {
				NATnativeZones pushBackUnique [_name,(_x select 0),(_x select 1)];
			} else {
				NATmilitiaZones pushBackUnique [_name,(_x select 0),(_x select 1)];
			};
		};
	};
} forEach NAT_mapLocationsCities;
//VILLAGES
{
	if (!(_x in NATmilitaryZones) && !(_x in NATmilitiaZones) && !(_x in NATnativeZones) && !(_x in NATcivilianZones)) then {
		_loc = nearestLocations [(_x select 0),["NameVillage"],1000,(_x select 0)];
		_name = text (_loc select 0);
		if ((random 100) < 80) then {
			NATcivilianZones pushBackUnique [_name,(_x select 0),(_x select 1)];
		} else {
			if ((random 100) < 90) then {
				NATnativeZones pushBackUnique [_name,(_x select 0),(_x select 1)];
			} else {
				NATmilitiaZones pushBackUnique [_name,(_x select 0),(_x select 1)];
			};
		};
	};
} forEach NAT_mapLocationsVillages;
//AIRPORTS
{
	if (!(_x in NATmilitaryZones) && !(_x in NATmilitiaZones) && !(_x in NATnativeZones) && !(_x in NATcivilianZones)) then {
		_loc = nearestLocations [(_x select 0),["Airport"],1000,(_x select 0)];
		_name = text (_loc select 0);
		if ((random 100) < 80) then {
			NATcivilianZones pushBackUnique [_name,(_x select 0),(_x select 1)];
		} else {
			if ((random 100) < 90) then {
				NATnativeZones pushBackUnique [_name,(_x select 0),(_x select 1)];
			} else {
				NATmilitiaZones pushBackUnique [_name,(_x select 0),(_x select 1)];
			};
		};
	};
} forEach NAT_mapLocationsAirports;
//-----------------------------------
//-MAP MARKERS, PATROLS ETC
{
	_aMarkername = format["ZONECIRCLE%1",(_x select 1)];
	_zoneMarkerCircle = createMarker [_aMarkername,(_x select 1)];
	_zoneMarkerCircle setMarkerShape "ELLIPSE";
	_zoneMarkerCircle setMarkerBrush "SOLID";
	_zoneMarkerCircle setMarkerColor "ColorCIVILIAN";
	_zoneMarkerCircle setMarkerSize [(_x select 2 select 0),(_x select 2 select 0)];
	_zoneMarkerCircle setMarkerAlpha 0;
	NATcivilianZones set [_forEachIndex,[(_x select 0),(_x select 1),(_x select 2),_zoneMarkerCircle]];
} forEach NATcivilianZones;
{
	_aMarkername = format["ZONECIRCLE%1",(_x select 1)];
	_zoneMarkerCircle = createMarker [_aMarkername,(_x select 1)];
	_zoneMarkerCircle setMarkerShape "ELLIPSE";
	_zoneMarkerCircle setMarkerBrush "SOLID";
	_zoneMarkerCircle setMarkerColor "ColorWEST";
	_zoneMarkerCircle setMarkerSize [(_x select 2 select 0),(_x select 2 select 0)];
	_zoneMarkerCircle setMarkerAlpha 0.5;
	NATmilitaryZones set [_forEachIndex,[(_x select 0),(_x select 1),(_x select 2),_zoneMarkerCircle]];
} forEach NATmilitaryZones;
{
	_aMarkername = format["ZONECIRCLE%1",(_x select 1)];
	_zoneMarkerCircle = createMarker [_aMarkername,(_x select 1)];
	_zoneMarkerCircle setMarkerShape "ELLIPSE";
	_zoneMarkerCircle setMarkerBrush "SOLID";
	_zoneMarkerCircle setMarkerColor "ColorEAST";
	_zoneMarkerCircle setMarkerSize [(_x select 2 select 0),(_x select 2 select 0)];
	_zoneMarkerCircle setMarkerAlpha 0.5;
	NATmilitiaZones set [_forEachIndex,[(_x select 0),(_x select 1),(_x select 2),_zoneMarkerCircle]];
} forEach NATmilitiaZones;
{
	_aMarkername = format["ZONECIRCLE%1",(_x select 1)];
	_zoneMarkerCircle = createMarker [_aMarkername,(_x select 1)];
	_zoneMarkerCircle setMarkerShape "ELLIPSE";
	_zoneMarkerCircle setMarkerBrush "SOLID";
	_zoneMarkerCircle setMarkerColor "ColorGUER";
	_zoneMarkerCircle setMarkerSize [(_x select 2 select 0),(_x select 2 select 0)];
	_zoneMarkerCircle setMarkerAlpha 0.5;
	NATnativeZones set [_forEachIndex,[(_x select 0),(_x select 1),(_x select 2),_zoneMarkerCircle]];
	for "_i" from 1 to (random ((_x select 2 select 0)/20)) do {
		_pos = [(_x select 1),0,((_x select 2 select 0)*0.75),0] call SIN_fnc_findPos;
		[_pos,(_x select 2 select 0)] call Z_fnc_setSpawn;
	};
} forEach NATnativeZones;

//-----------------------------------
//-CREATE CAMPS
/*
	CREATE MILITIA CAMP
	> CREATE NATIVE CAMP IN SAME ZONE
	_nearestBase = [_zonePos,_type] call NAT_fnc_findNearestBase;
	_sameZone = [_zonePos,_nearestBase] call SIN_fnc_zoneCheck;
*/
[] spawn {
	//waitUntil {sleep 3; (player getVariable "NATspawned") isEqualTo true};
	//waitUntil {sleep 3; {isPlayer _x && isTouchingGround _x} count playableUnits isEqualTo playersNumber WEST};
	private ["_numCamps","_usedPosArray","_sameZone","_fail"];
	_usedPosArray = [];
	if (worldName isEqualTo "Tanoa") then {
		{
			_numCamps = 1;
			while {_numCamps > 0} do {
				_pos = [(_x select 0),0,(_x select 1),0] call SIN_fnc_findPos;
				_campPos = [_pos] call NAT_fnc_findBasePos;
				_distCheck = [_campPos,_usedPosArray,((_x select 1)/10)] call SIN_fnc_checkDist;
				_nearestZone = [_campPos,"all"] call NAT_fnc_findNearestZone;
				if (count NATmilitiaCamps > 0) then {
					_fail = 0;
					{
						_check = [_campPos,(_x select 0)] call SIN_fnc_zoneCheck;
						if (_check) then {
							_fail = _fail + 1;
						};
					} forEach NATmilitiaCamps;
					if (_fail isEqualTo 0) then {
						_sameZone = false;
					};
				} else {
					_check = [_campPos,(_x select 0)] call SIN_fnc_zoneCheck;
					if (_check) then {
						_sameZone = false;
					} else {
						_sameZone = true;
					};
				};
				if (_distCheck && _campPos distance2D (_nearestZone select 1) >= (_nearestZone select 2 select 0) && !_sameZone) then {
					[_campPos,"militia","land"] call NAT_fnc_createBase;
					_usedPosArray pushBack _campPos;
					//NATIVE IN SAME ZONE
					private "_natFound";
					_natFound = false;
					while {!_natFound} do {
						_natPos = [_campPos,0,(_x select 1),0] call SIN_fnc_findPos;
						_natCampPos = [_natPos] call NAT_fnc_findBasePos;
						_distCheck = [_natCampPos,_usedPosArray,((_x select 1)/10)] call SIN_fnc_checkDist;
						_nearestZone = [_natCampPos,"all"] call NAT_fnc_findNearestZone;
						_sameZone = [_natCampPos,_campPos] call SIN_fnc_zoneCheck;
						if (_distCheck && _natCampPos distance2D (_nearestZone select 1) >= (_nearestZone select 2 select 0) && _sameZone) then {
							_natFound = true;
							[_natCampPos,"native","land"] call NAT_fnc_createBase;
							_usedPosArray pushBack _natCampPos;
							_numCamps = _numCamps - 1;
						};
					};
				};
			};
		} forEach [[[10854.7,8276.55,0.00131226],10000],[[3423.08,4966.47,-2.20204],5000],[[2855.07,12392,0.0020752],3000]];
	} else {
		for "_i" from 1 to 3 do {
			_pos = [NATErrorPos,0,999999,0] call SIN_fnc_findPos;
			_campPos = [_pos] call NAT_fnc_findBasePos;
			_distCheck = [_campPos,_usedPosArray,500] call SIN_fnc_checkDist;
			_nearestZone = [_campPos,"all"] call NAT_fnc_findNearestZone;
			if (_distCheck && _campPos distance2D (_nearestZone select 1) >= (_nearestZone select 2 select 0)) then {
				[_campPos,"militia","land"] call NAT_fnc_createBase;
				_usedPosArray pushBack _campPos;
				//NATIVE IN SAME ZONE
				private "_natFound";
				_natFound = false;
				while {!_natFound} do {
					_natPos = [_campPos,0,999999,0] call SIN_fnc_findPos;
					_natCampPos = [_natPos] call NAT_fnc_findBasePos;
					_distCheck = [_natCampPos,_usedPosArray,500] call SIN_fnc_checkDist;
					_nearestZone = [_natCampPos,"all"] call NAT_fnc_findNearestZone;
					if (_distCheck && _natCampPos distance2D (_nearestZone select 1) >= (_nearestZone select 2 select 0)) then {
						_natFound = true;
						[_natCampPos,"native","land"] call NAT_fnc_createBase;
						_usedPosArray pushBack _natCampPos;
					};
				};
			};
		};
	};
	if (count NATmilitiaZones > 0) then {
		{
			_zonePos = (_x select 1);
			_zoneSize = (_x select 2 select 0);
			_group = [_zonePos,east,"militia",round(_zoneSize/50)] call NAT_fnc_createGroup;
			[_group,_zonePos,(_zoneSize*0.75),round(_zoneSize/50),"MOVE","SAFE","YELLOW","FULL","STAG COLUMN"] call CBA_fnc_taskPatrol;
		} forEach NATmilitiaZones;
	};
	if (count NATnativeZones > 0) then {
		{
			_zonePos = (_x select 1);
			_zoneSize = (_x select 2 select 0);
			_group = [_zonePos,resistance,"native",round(_zoneSize/50)] call NAT_fnc_createGroup;
			[_group,_zonePos,(_zoneSize*0.75),round(_zoneSize/50),"MOVE","SAFE","YELLOW","FULL","STAG COLUMN"] call CBA_fnc_taskPatrol;
		} forEach NATnativeZones;
	};
	waitUntil {sleep 3; count NATmilitaryCamps > 0 && count NATmilitiaCamps > 0 && count NATnativeCamps > 0};
	[] spawn NAT_fnc_warbotZoneMonitor;
	["military"] spawn NAT_fnc_warbotWave;
	["militia"] spawn NAT_fnc_warbotWave;
	["native"] spawn NAT_fnc_warbotWave;
	if (DebugMode) then {systemChat "DEBUG :: WARBOT ONLINE"; showChat true};
};
//-----------------------------------