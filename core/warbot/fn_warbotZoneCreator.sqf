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
//-GET LOCATION NAMES
{
	NAT_mapLocations pushBackUnique [(locationPosition _x),(size _x)];
	NAT_mapLocationsCities pushBackUnique [(locationPosition _x),(size _x)];
} forEach nearestLocations [NATErrorPos, ["NameCity","NameCityCapital"], 999999];
//-----------------------------------
//-FLAG ZONES
//CITIES
{
	if (!(_x in NATmilitaryZones) && !(_x in NATmilitiaZones) && !(_x in NATnativeZones)) then {
		_name = nearestLocations [(_x select 0),["nameCity","NameCityCapital"],1000,(_x select 0)];
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
		_name = nearestLocations [(_x select 0),["NameVillage"],1000,(_x select 0)];
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
		_name = nearestLocations [(_x select 0),["Airport"],1000,(_x select 0)];
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
	_zoneMarkerCircle setMarkerBrush "DiagGrid";
	_zoneMarkerCircle setMarkerColor "ColorWEST";
	_zoneMarkerCircle setMarkerSize [(_x select 2 select 0),(_x select 2 select 0)];
	_zoneMarkerCircle setMarkerAlpha 0.66;
	NATmilitaryZones set [_forEachIndex,[(_x select 0),(_x select 1),(_x select 2),_zoneMarkerCircle]];
} forEach NATmilitaryZones;
{
	_aMarkername = format["ZONECIRCLE%1",(_x select 1)];
	_zoneMarkerCircle = createMarker [_aMarkername,(_x select 1)];
	_zoneMarkerCircle setMarkerShape "ELLIPSE";
	_zoneMarkerCircle setMarkerBrush "DiagGrid";
	_zoneMarkerCircle setMarkerColor "ColorEAST";
	_zoneMarkerCircle setMarkerSize [(_x select 2 select 0),(_x select 2 select 0)];
	_zoneMarkerCircle setMarkerAlpha 0.66;
	NATmilitiaZones set [_forEachIndex,[(_x select 0),(_x select 1),(_x select 2),_zoneMarkerCircle]];
} forEach NATmilitiaZones;
{
	_aMarkername = format["ZONECIRCLE%1",(_x select 1)];
	_zoneMarkerCircle = createMarker [_aMarkername,(_x select 1)];
	_zoneMarkerCircle setMarkerShape "ELLIPSE";
	_zoneMarkerCircle setMarkerBrush "DiagGrid";
	_zoneMarkerCircle setMarkerColor "ColorGUER";
	_zoneMarkerCircle setMarkerSize [(_x select 2 select 0),(_x select 2 select 0)];
	_zoneMarkerCircle setMarkerAlpha 0.66;
	NATnativeZones set [_forEachIndex,[(_x select 0),(_x select 1),(_x select 2),_zoneMarkerCircle]];
} forEach NATnativeZones;

/*//flag_syndicat //flag_NATO	//ColorGUER ColorEAST ColorWEST
_aMarkername = format["ZONEICON%1",(_x select 0)];
_zoneMarkerIcon = createMarker [_aMarkername2,(_x select 0)];
_zoneMarkerIcon setMarkerShape "ICON";
_zoneMarkerIcon setMarkerType "KIA";
_zoneMarkerIcon setMarkerColor "colorIndependent";
_zoneMarkerIcon setMarkerSize [0.75,0.75];
_zoneMarkerIcon setMarkerAlpha 0.8;*/