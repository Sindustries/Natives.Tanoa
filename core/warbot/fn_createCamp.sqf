/*
	fn_createCamp
	Author: Sinbane
	Spawns a randomised camp or outpost
*/
private ["_mainObjs","_defenceObjs","_extraObjs","_fireObjs","_mainObj","_campPos","_defences"];
params [
	["_campPos",[0,0,0]],
	["_type",nil],
	["_numObjects",6]
];
if (_pos isEqualTo [0,0,0] || isNil "_type" || _numObjects < 1) exitWith {};
_defences = [];
//-----------------------------------
//-FIND FLAT POS
//_campPos = [_pos] call NAT_fnc_findCampPos;
//-----------------------------------
switch (_type) do {
	case "military": {
		_mainObjs = NATbuildingsMilitaryMain;
		_defenceObjs = NATbuildingsMilitaryDefences;
		_extraObjs = NATbuildingsMilitaryExtra;
		_fireObjs = NATbuildingsMilitaryFire;
	};
	case "militia": {
		_mainObjs = NATbuildingsMilitiaMain;
		_defenceObjs = NATbuildingsMilitiaDefences;
		_extraObjs = NATbuildingsMilitiaExtra;
		_fireObjs = NATbuildingsMilitiaFire;
	};
	case "native": {
		_mainObjs = NATbuildingsNativeMain;
		_defenceObjs = NATbuildingsNativeDefences;
		_extraObjs = NATbuildingsNativeExtra;
		_fireObjs = NATbuildingsNativeFire;
	};
	case "civilian": {
		_mainObjs = NATbuildingsCivilianMain;
		_defenceObjs = NATbuildingsCivilianDefences;
		_extraObjs = NATbuildingsCivilianExtra;
		_fireObjs = NATbuildingsCivilianFire;
	};
};
//-----------------------------------
//-PLACE MAIN+FIRE+DEFENCES
_mainObj = (selectRandom _mainObjs) createVehicle _campPos;
_mainObj setDir (random 360);
_mainObj setPos [(getPos _mainObj select 0),(getPos _mainObj select 1),0];
_campPos = (getPos _mainObj);
if (count _fireObjs > 0) then {
	_firePos = [_campPos,0,20,2] call SIN_fnc_findPos;
	_fire = (selectRandom _fireObjs) createVehicle _firePos;
	_fire setDir (random 360);
	_fire setPos [(getPos _fire select 0),(getPos _fire select 1),0];
	NATcache pushBack _fire;
};
if (count _defenceObjs > 0) then {
	for "_i" from 2 to floor(random 2) do {
		_pos = [_campPos,0,20,1] call SIN_fnc_findPos;
		_obj = (selectRandom _defenceObjs) createVehicle _pos;
		_obj setDir ((getDir _mainObj)-180);
		_obj setPos [(getPos _obj select 0),(getPos _obj select 1),0];
		_defences pushBack _obj;
	};
	_mainObject setVariable ["NATcampDefences",_defences];
};
//-----------------------------------
//-PLACE EXTRA OBJECTS
if (count _extraObjs > 0) then {
	while {_numObjects > 0} do {
		_pos = [_campPos,0,20,1] call SIN_fnc_findPos;
		_obj = (selectRandom _extraObjs) createVehicle _pos;
		_obj setDir (random 360);
		_obj setPos [(getPos _obj select 0),(getPos _obj select 1),0];
		_numObjects = _numObjects - 1;
		NATcache pushBack _obj;
	};
};
//-----------------------------------
//-MAP MARKER
switch (_type) do {
	case "military": {
		NATmilitaryCamps pushbackUnique [_campPos,_mainObj];
		_aMarkername = format["%1",_campPos];
		_aMarker = createMarker [_aMarkername,_campPos];
		_aMarker setMarkerShape "ICON";
		_aMarker setMarkerType "b_installation";
		_aMarker setMarkerColor "ColorWEST";
		_aMarker setMarkerSize [0.75,0.75];
		_aMarker setMarkerAlpha 0.75;
	};
	case "militia": {
		NATmilitiaCamps pushBackUnique [_campPos,_mainObj];
	};
	case "native": {
		NATnativeCamps pushBackUnique [_campPos,_mainObj];
	};
	case "civilian": {
		NATcivilianCamps pushBackUnique [_campPos,_mainObj];
	};
};
//-----------------------------------