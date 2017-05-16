/*
	fn_createCamp
	Author: Sinbane
	Spawns a randomised camp or outpost
*/
private ["_mainObjs","_mainObjSize","_defenceObjs","_extraObjs","_fireObjs","_side","_mainObj","_campPos","_defences"];
params [
	["_campPos",[0,0,0]],
	["_type",nil],
	["_numObjects",0]
];
if (_campPos isEqualTo [0,0,0] || isNil "_type") exitWith {};
_defences = [];
//-----------------------------------
//-FIND FLAT POS
//_campPos = [_pos] call NAT_fnc_findCampPos;
//-----------------------------------
switch (_type) do {
	case "military": {
		_mainObjs = NATbuildingsMilitaryMain;
		_defenceObjs = NATbuildingsMilitaryDefences;
		_extraObjs = (NATbuildingsMilitaryExtra+NATbuildingsMilitiaExtra);
		_fireObjs = NATbuildingsMilitaryFire;
		_side = WEST;
	};
	case "militia": {
		_mainObjs = NATbuildingsMilitiaMain;
		_defenceObjs = NATbuildingsMilitiaDefences;
		_extraObjs = NATbuildingsMilitiaExtra;
		_fireObjs = NATbuildingsMilitiaFire;
		_side = EAST;
	};
	case "native": {
		_mainObjs = NATbuildingsNativeMain;
		_defenceObjs = NATbuildingsNativeDefences;
		_extraObjs = NATbuildingsNativeExtra;
		_fireObjs = NATbuildingsNativeFire;
		_side = RESISTANCE;
	};
	case "civilian": {
		_mainObjs = NATbuildingsCivilianMain;
		_defenceObjs = NATbuildingsCivilianDefences;
		_extraObjs = NATbuildingsCivilianExtra;
		_fireObjs = NATbuildingsCivilianFire;
		_side = CIVILIAN;
	};
};
//-----------------------------------
//-PLACE MAIN+FIRE+DEFENCES
_mainObj = (selectRandom _mainObjs) createVehicle _campPos;
_mainObj setDir (random 360);
_mainObj setPos [(getPos _mainObj select 0),(getPos _mainObj select 1),0];
_mainObjSize = (getNumber (configfile >> "CfgVehicles" >> (typeOf _mainObj) >> "mapSize"));
createGuardedPoint [_side, [0,0], -1, _mainObj];
_campPos = (getPos _mainObj);
if (count _fireObjs > 0) then {
	_firePos = [_campPos,_mainObjSize,20,2] call SIN_fnc_findPos;
	_fire = (selectRandom _fireObjs) createVehicle _firePos;
	_fire setDir (random 360);
	_fire setPos [(getPos _fire select 0),(getPos _fire select 1),0];
	NATcache pushBack _fire;
};
if (count _defenceObjs > 0) then {
	for "_i" from 1 to (2+floor(random 2)) do {
		_pos = [_campPos,_mainObjSize,20,2] call SIN_fnc_findPos;
		_obj = (selectRandom _defenceObjs) createVehicle _pos;
		_dir = [_obj, _mainObj] call BIS_fnc_DirTo;
		//_obj setDir (getDir _mainObj);
		_obj setPos [(getPos _obj select 0),(getPos _obj select 1),0];
		createGuardedPoint [_side, [0,0], -1, _obj];
		_defences pushBack _obj;
	};
	_mainObj setVariable ["NATcampDefences",_defences];
};
//-----------------------------------
//-PLACE EXTRA OBJECTS
if (count _extraObjs > 0) then {
	while {_numObjects > 0} do {
		_pos = [_campPos,_mainObjSize,20,2] call SIN_fnc_findPos;
		_obj = (selectRandom _extraObjs) createVehicle _pos;
		_obj setDir (random 360);
		_obj setPos [(getPos _obj select 0),(getPos _obj select 1),0];
		_numObjects = _numObjects - 1;
		NATcache pushBack _obj;
	};
};
//-----------------------------------
//-HELIPAD / VEH BUILD SITE
if (_type isEqualTo "military") then {
	_pos = [_campPos,(_mainObjSize+3),20,2] call SIN_fnc_findPos;
	_heliPad = "Land_JumpTarget_F" createVehicle _pos;
};
//-----------------------------------
//-MAP MARKER
switch (_type) do {
	case "military": {
		NATmilitaryCamps pushbackUnique [_campPos,_mainObj];
		publicVariable "NATmilitaryCamps";
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
		publicVariable "NATmilitiaCamps";
	};
	case "native": {
		NATnativeCamps pushBackUnique [_campPos,_mainObj];
		publicVariable "NATnativeCamps";
	};
	case "civilian": {
		NATcivilianCamps pushBackUnique [_campPos,_mainObj];
		publicVariable "NATcivilianCamps";
	};
};
//-----------------------------------