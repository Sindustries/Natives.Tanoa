/*
	fn_locationDisplay
	Author: Sinbane
	Description:
	Displays the players location at the bottom of the screen whenever it changes
*/
private ["_locations","_location","_locName","_locPos","_locStr","_now","_hour","_min","_time"];
while {alive player} do {
	//GET TIME
	_now = date;
	_hour = (_now select 3);
	_min = (_now select 4);
	if (_min < 10) then {
		_min = format["0%1",(_now select 4)];
	};
	_time = format["%1:%2",_hour,_min];

	//GET LOCATION
	_locations = [];
	_locations = nearestLocations [position player, ["NameCity","NameCityCapital","NameLocal","NameMarine","NameVillage"], 500];
	//filter-out locations without names
	{
		if (text _x == "") then	{
			locations set [_forEachIndex, objNull];
		};
	} forEach _locations;
	_locations = _locations - [objNull];

	if (count _locations > 0) then {
		_location = _locations select 0;
		_locName = text _location;
		_locPos = locationPosition _location;
		if ((getPos player) in _location) then {
			_locStr = format["%1",_locName];
		} else {
			_locStr = format["Near %1",_locName];
		};

		//DISPLAY
		[_time, _locStr] spawn BIS_fnc_infoText;

		//WAIT CONDITIONS
		if ((getPos player) in _location) then {
			waitUntil {sleep 3; !((getPos player) in _location) || _location != ((nearestLocations [position player, ["NameCity","NameCityCapital","NameLocal","NameMarine","NameVillage"], 500]) select 0)};
		} else {
			waitUntil {sleep 3; (getPos player) in _location || _location != ((nearestLocations [position player, ["NameCity","NameCityCapital","NameLocal","NameMarine","NameVillage"], 500]) select 0)};
		};
	} else {
		waitUntil {sleep 3; (count nearestLocations [position player, ["NameCity","NameCityCapital","NameLocal","NameMarine","NameVillage"], 500]) > 0};
	};
};