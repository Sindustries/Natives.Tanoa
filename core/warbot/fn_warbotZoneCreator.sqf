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
		[_pos] call Z_fnc_setSpawn;
	};
} forEach NATnativeZones;

//-----------------------------------
//-CREATE CAMPS
[] spawn {
	waitUntil {sleep 3; (player getVariable "NATspawned") isEqualTo true};
	waitUntil {sleep 3; {isPlayer _x && isTouchingGround _x} count playableUnits isEqualTo playersNumber WEST};
	private ["_numCamps","_usedPosArray"];
	_usedPosArray = [];
	_numCamps = round (((count NATmilitiaZones)+(count NATnativeZones)+(count NATcivilianZones))/2);
	while {_numCamps > 0} do {
		{
			_pos = [NATErrorPos,0,999999,0] call SIN_fnc_findPos;
			_campPos = [_pos] call NAT_fnc_findBasePos;
			_distCheck = [_campPos,_usedPosArray,500] call SIN_fnc_checkDist;
			_nearestZone = [_campPos,"all"] call NAT_fnc_findNearestZone;
			if (_distCheck && _campPos distance2D (_nearestZone select 0) >= (_nearestZone select 1)) then {
				[_campPos,_x] spawn {
					waitUntil {sleep 6; (count NATmilitaryCamps > 0)};
					[_this select 0,_this select 1,"land"] call NAT_fnc_createBase;
				};
				_usedPosArray pushBack _pos;
			};
		} forEach ["militia","native"];
		_numCamps = _numCamps - 1;
	};
	waitUntil {sleep 10; (count NATmilitaryCamps > 0)};
	{
		[(_x select 1),(_x select 2 select 0),west,"military"] call NAT_fnc_createZonePatrol;
	} forEach NATmilitaryZones;
	{
		[(_x select 1),(_x select 2 select 0),east,"militia"] call NAT_fnc_createZonePatrol;
	} forEach NATmilitiaZones;
	{
		[(_x select 1),(_x select 2 select 0),resistance,"native"] call NAT_fnc_createZonePatrol;
	} forEach NATnativeZones;
/*
	_loc = (selectRandom NATmilitaryCamps);
	_base = (_loc select 0);
	[_base,[0,0,0],"military"] spawn NAT_fnc_warbotWave;

	_loc = (selectRandom NATmilitiaCamps);
	_base = (_loc select 0);
	[_base,[0,0,0],"militia"] spawn NAT_fnc_warbotWave;

	_loc = (selectRandom NATnativeCamps);
	_base = (_loc select 0);
	[_base,[0,0,0],"native"] spawn NAT_fnc_warbotWave;*/
};
//-----------------------------------