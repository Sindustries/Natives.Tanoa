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
	if (!(_x in NATmilitaryZones) && !(_x in NATmilitiaZones) && !(_x in NATnativeZones)) then {
		_loc = nearestLocations [(_x select 0),["nameCity","NameCityCapital"],1000,(_x select 0)];
		_name = text (_loc select 0);
		if ((random 100) < 90) then {
			NATnativeZones pushBackUnique [_name,(_x select 0),(_x select 1)];
		} else {
			NATmilitiaZones pushBackUnique [_name,(_x select 0),(_x select 1)];
		};
	};
} forEach NAT_mapLocationsCities;
//VILLAGES
{
	if (!(_x in NATmilitaryZones) && !(_x in NATmilitiaZones) && !(_x in NATnativeZones)) then {
		_loc = nearestLocations [(_x select 0),["NameVillage"],1000,(_x select 0)];
		_name = text (_loc select 0);
		if ((random 100) < 70) then {
			NATnativeZones pushBackUnique [_name,(_x select 0),(_x select 1)];
		} else {
			NATmilitiaZones pushBackUnique [_name,(_x select 0),(_x select 1)]
		};
	};
} forEach NAT_mapLocationsVillages;
//AIRPORTS
{
	if (!(_x in NATmilitaryZones) && !(_x in NATmilitiaZones) && !(_x in NATnativeZones)) then {
		_loc = nearestLocations [(_x select 0),["Airport"],1000,(_x select 0)];
		_name = text (_loc select 0);
		if ((random 100) < 50) then {
			NATnativeZones pushBackUnique [_name,(_x select 0),(_x select 1)]
		} else {
			NATmilitiaZones pushBackUnique [_name,(_x select 0),(_x select 1)]
		};
	};
} forEach NAT_mapLocationsAirports;
//-----------------------------------
//-MAP MARKERS
{
	_aMarkername = format["ZONECIRCLE%1",(_x select 1)];
	_zoneMarkerCircle = createMarker [_aMarkername,(_x select 1)];
	_zoneMarkerCircle setMarkerShape "ELLIPSE";
	_zoneMarkerCircle setMarkerBrush "SOLID";
	_zoneMarkerCircle setMarkerColor "ColorWEST";
	_zoneMarkerCircle setMarkerSize [(_x select 2 select 0),(_x select 2 select 0)];
	_zoneMarkerCircle setMarkerAlpha 0.66;
	NATmilitaryZones set [_forEachIndex,[(_x select 0),(_x select 1),(_x select 2),_zoneMarkerCircle]];
} forEach NATmilitaryZones;
{
	_aMarkername = format["ZONECIRCLE%1",(_x select 1)];
	_zoneMarkerCircle = createMarker [_aMarkername,(_x select 1)];
	_zoneMarkerCircle setMarkerShape "ELLIPSE";
	_zoneMarkerCircle setMarkerBrush "SOLID";
	_zoneMarkerCircle setMarkerColor "ColorEAST";
	_zoneMarkerCircle setMarkerSize [(_x select 2 select 0),(_x select 2 select 0)];
	_zoneMarkerCircle setMarkerAlpha 0.66;
	NATmilitiaZones set [_forEachIndex,[(_x select 0),(_x select 1),(_x select 2),_zoneMarkerCircle]];
} forEach NATmilitiaZones;
{
	_aMarkername = format["ZONECIRCLE%1",(_x select 1)];
	_zoneMarkerCircle = createMarker [_aMarkername,(_x select 1)];
	_zoneMarkerCircle setMarkerShape "ELLIPSE";
	_zoneMarkerCircle setMarkerBrush "SOLID";
	_zoneMarkerCircle setMarkerColor "ColorGUER";
	_zoneMarkerCircle setMarkerSize [(_x select 2 select 0),(_x select 2 select 0)];
	_zoneMarkerCircle setMarkerAlpha 0.66;
	NATnativeZones set [_forEachIndex,[(_x select 0),(_x select 1),(_x select 2),_zoneMarkerCircle]];
} forEach NATnativeZones;

//-----------------------------------
//-CREATE CAMPS
[] spawn {
	waitUntil {sleep 6; (count NATmilitaryCamps > 0)};
	private "_numCamps";
	_numCamps = round (((count NATmilitiaZones)+(count NATnativeZones))/2);
	while {_numCamps > 0} do {
		systemChat format["%1",_numCamps];
		showchat true;
		{
			systemchat "Finding starting pos...";
			_pos = [NATErrorPos,0,999999,0] call SIN_fnc_findPos;
			systemchat "Finding base pos...";
			_campPos = [_pos] call NAT_fnc_findBasePos;
			systemchat "Finding nearest base...";
			_nearestCamp = [_campPos,"all"] call NAT_fnc_findNearestBase;
			systemchat "Finding nearest zone...";
			_nearestZone = [_campPos,"all"] call NAT_fnc_findNearestZone;
			systemchat "checking...";
			if (_campPos distance _nearestCamp >= 500 && _campPos distance (_nearestZone select 0) >= (_nearestZone select 1)) then {
				systemchat "Creating camp...";
				[_campPos,_x] call NAT_fnc_createBase;
			};
			systemchat "Done.";
		} forEach ["militia","native"];
		_numCamps = _numCamps - 1;
	};
};
//-----------------------------------