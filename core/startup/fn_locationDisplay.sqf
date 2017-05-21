/*
	fn_locationDisplay
	Author: Sinbane
	Description:
	Displays the players location at the bottom of the screen whenever it changes
*/
private ["_locations","_location","_locName","_locPos","_locStr","_now","_hour","_min","_time","_day","_month","_year"];
while {alive player} do {
	//GET TIME
	_now = date;
	_hour = (_now select 3);
	_min = (_now select 4);
	if (_min < 10) then {
		_min = format["0%1",(_now select 4)];
	};
	_time = format["%1:%2",_hour,_min];

	_day = (_now select 2);
	_month = (_now select 1);
	_year = (_now select 0);

	//STRINGIFY THE MONTH
	switch (_month) do {
		case 1: {
			_month = "January";
		};
		case 2: {
			_month = "February";
		};
		case 3: {
			_month = "March";
		};
		case 4: {
			_month = "April";
		};
		case 5: {
			_month = "May";
		};
		case 6: {
			_month = "June";
		};
		case 7: {
			_month = "July";
		};
		case 8: {
			_month = "August";
		};
		case 9: {
			_month = "September";
		};
		case 10: {
			_month = "October";
		};
		case 11: {
			_month = "November";
		};
		case 12: {
			_month = "December";
		};
	};

	_date = format ["%1 %2, %3",_day,_month,_year];

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
		_locSize = (size _location select 0);
		if ((getPos player) distance2D _locPos < _locSize) then {
			_locStr = format["%1",_locName];
		} else {
			_locStr = format["Near %1",_locName];
		};

		//DISPLAY
		[_time, _date, _locStr] spawn BIS_fnc_infoText;

		//WAIT CONDITIONS
		if ((getPos player) distance2D _locPos < _locSize) then {
			waitUntil {sleep 3; (getPos player) distance2D _locPos > _locSize || _location != ((nearestLocations [position player, ["NameCity","NameCityCapital","NameLocal","NameMarine","NameVillage"], 500]) select 0)};
		} else {
			waitUntil {sleep 3; (getPos player) distance2D _locPos < _locSize || _location != ((nearestLocations [position player, ["NameCity","NameCityCapital","NameLocal","NameMarine","NameVillage"], 500]) select 0)};
		};
	} else {
		waitUntil {sleep 3; (count nearestLocations [position player, ["NameCity","NameCityCapital","NameLocal","NameMarine","NameVillage"], 500]) > 0};
	};
};