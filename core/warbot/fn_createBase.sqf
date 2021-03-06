/*
	fn_createCamp
	Author: Sinbane
	Spawns a randomised camp or outpost
*/
private ["_mainObjs","_mainObjSize","_defenceObjs","_extraObjs","_fireObjs","_side","_mainObj","_campPos","_defences"];
params [
	["_campPos",[0,0,0]],
	["_type",nil],
	["_baseType",nil],
	["_numObjects",0]
];
if (_campPos isEqualTo [0,0,0] || isNil "_type" || isNil "_baseType") exitWith {};
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
//-MAIN OBJECT
if (_baseType isEqualTo "land") then {
	_mainObj = (selectRandom _mainObjs) createVehicle _campPos;
	_mainObj setDir (random 360);
	_mainObj setPos [(getPos _mainObj select 0),(getPos _mainObj select 1),0];
};
if (_baseType isEqualTo "shore") then {
	_mainObj = _campPos select 0;
	_campPos = _campPos select 1;
};
_mainObj setVariable ["NATbaseType",_baseType];
_mainObjSize = (getNumber (configfile >> "CfgVehicles" >> (typeOf _mainObj) >> "mapSize"));
createGuardedPoint [_side, [0,0], -1, _mainObj];
_campPos = (getPos _mainObj);
//-----------------------------------
//-HELIPAD / VEH BUILD SITE
if (_type isEqualTo "military" && _baseType isEqualTo "land") then {
	_pos = [_campPos,(_mainObjSize+3),20,2] call SIN_fnc_findPos;
	_heliPad = "Land_JumpTarget_F" createVehicle _pos;
};
//-----------------------------------
//-FIRE
if (count _fireObjs > 0 && _baseType isEqualTo "land") then {
	private ["_posFound","_firePos"];
	_posFound = false;
	while {!_posFound} do {
		_firePos = [_campPos,_mainObjSize,20,2] call SIN_fnc_findPos;
		if ((getPos nearestObject [_firePos,"Land_JumpTarget_F"]) distance _firePos > 4) then {
			_posFound = true;
		};
	};
	_fire = (selectRandom _fireObjs) createVehicle _firePos;
	_fire setDir (random 360);
	_fire setPos [(getPos _fire select 0),(getPos _fire select 1),0];
	NATcache pushBack _fire;
};
//-----------------------------------
//-TURRETS
if (count _defenceObjs > 0) then {
	_defences = [];
	switch (_baseType) do {
		case "land": {
			private ["_posFound","_pos"];
			for "_i" from 1 to (2+floor(random 2)) do {
				_posFound = false;
				while {!_posFound} do {
					_pos = [_campPos,_mainObjSize,20,2] call SIN_fnc_findPos;
					if ((getPos nearestObject [_pos,"Land_JumpTarget_F"]) distance _pos > 4) then {
						_posFound = true;
					};
				};
				_obj = (selectRandom _defenceObjs) createVehicle _pos;
				_defences pushBack _obj;
			};
		};
		case "shore": {
			_buildingPos = _mainObj buildingPos -1;
			_pos = (selectRandom _buildingPos);
			_obj = (selectRandom _defenceObjs) createVehicle _pos;
			_buildingPos = _buildingPos - _pos;
			_defences pushBack _obj;
		};
	};
	{
		_dir = [_x, _mainObj] call BIS_fnc_DirTo;
		_x setPos [(getPos _x select 0),(getPos _x select 1),0];
		if (_type isEqualTo "military") then {
			_ai = createGroup west createUnit ["B_Survivor_F", [0,0,0], [], 0, "NONE"];
			_ai hideObjectGlobal true;
			_ai moveInAny _x;
			_ai allowDamage false;
			_x lock true;
		};
	} forEach _defences;
	_mainObj setVariable ["NATcampDefences",_defences];
};
//-----------------------------------
//-PLACE EXTRA OBJECTS
if (count _extraObjs > 0 && _baseType isEqualTo "land") then {
	while {_numObjects > 0} do {
		private ["_posFound","_pos"];
		_posFound = false;
		while {!_posFound} do {
			_pos = [_campPos,_mainObjSize,20,2] call SIN_fnc_findPos;
			if ((getPos nearestObject [_pos,"Land_JumpTarget_F"]) distance _pos > 4) then {
				_posFound = true;
			};
		};
		_obj = (selectRandom _extraObjs) createVehicle _pos;
		_obj setDir (random 360);
		_obj setPos [(getPos _obj select 0),(getPos _obj select 1),0];
		_obj allowDamage false;
		_numObjects = _numObjects - 1;
		NATcache pushBack _obj;
	};
};
//-----------------------------------
//-MAP MARKER + DEFENDERS
switch (_type) do {
	case "military": {
		private ["_group"];
		switch (_baseType) do {
			case "land": {
				_group = [_campPos,west,"military",(3+floor(random 3))] call NAT_fnc_createGroup;
			};
			case "shore": {
				_shorePos = [_campPos,0,100,2,0,1,1] call SIN_fnc_findPos;
				_group = [_shorePos,west,"military",(3+floor(random 3))] call NAT_fnc_createGroup;
			};
		};
		[_group,[(_campPos select 0),(_campPos select 1),0],50,2,true] call CBA_fnc_taskDefend;
		NATmilitaryCamps pushbackUnique [_campPos,_mainObj,_group];
		publicVariable "NATmilitaryCamps";
		_aMarkername = format["%1",_campPos];
		_aMarker = createMarker [_aMarkername,_campPos];
		_aMarker setMarkerShape "ICON";
		if (_baseType isEqualTo "land") then {
			_aMarker setMarkerType "b_installation";
		};
		if (_baseType isEqualTo "shore") then {
			_aMarker setMarkerType "b_naval";
		};
		_aMarker setMarkerColor "ColorWEST";
		_aMarker setMarkerSize [0.75,0.75];
		_aMarker setMarkerAlpha 0.75;
	};
	case "militia": {
		_group = [_campPos,east,"militia",(3+floor(random 3))] call NAT_fnc_createGroup;
		[_group,[(_campPos select 0),(_campPos select 1),0],50,2,true] call CBA_fnc_taskDefend;
		NATmilitiaCamps pushBackUnique [_campPos,_mainObj,_group];
		publicVariable "NATmilitiaCamps";
		if (DebugMode) then {
			_aMarkername = format["%1",_campPos];
			_aMarker = createMarker [_aMarkername,_campPos];
			_aMarker setMarkerShape "ICON";
			_aMarker setMarkerType "b_installation";
			_aMarker setMarkerColor "ColorEAST";
			_aMarker setMarkerSize [0.75,0.75];
			_aMarker setMarkerAlpha 0.75;
		};
	};
	case "native": {
		_group = [_campPos,resistance,"native",(3+floor(random 3))] call NAT_fnc_createGroup;
		[_group,[(_campPos select 0),(_campPos select 1),0],50,2,true] call CBA_fnc_taskDefend;
		NATnativeCamps pushBackUnique [_campPos,_mainObj,_group];
		publicVariable "NATnativeCamps";
		if (DebugMode) then {
			_aMarkername = format["%1",_campPos];
			_aMarker = createMarker [_aMarkername,_campPos];
			_aMarker setMarkerShape "ICON";
			_aMarker setMarkerType "b_installation";
			_aMarker setMarkerColor "ColorGUER";
			_aMarker setMarkerSize [0.75,0.75];
			_aMarker setMarkerAlpha 0.75;
		};
	};
	case "civilian": {
		_group = [_campPos,civilian,"civilian",(3+floor(random 3))] call NAT_fnc_createGroup;
		[_group,[(_campPos select 0),(_campPos select 1),0],50,2,true] call CBA_fnc_taskDefend;
		NATcivilianCamps pushBackUnique [_campPos,_mainObj];
		publicVariable "NATcivilianCamps";
		if (DebugMode) then {
			_aMarkername = format["%1",_campPos];
			_aMarker = createMarker [_aMarkername,_campPos];
			_aMarker setMarkerShape "ICON";
			_aMarker setMarkerType "b_installation";
			_aMarker setMarkerColor "ColorCIVILIAN";
			_aMarker setMarkerSize [0.75,0.75];
			_aMarker setMarkerAlpha 0.75;
		};
	};
};
//-----------------------------------