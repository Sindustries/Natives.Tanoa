/*
	HVP Radioactive Object Spawn Script
	By Sinbane
	Spawns a variety of radioactive objects and areas around the map
*/
private [];
//-----------------------------------
//-VARIABLES

_radObjCars = _this select 0;
_location = _this select 1;
_size = _this select 2;
_minDistSpawn = 100;
_radChance = 90;
_minDistLocation = 0.4;
_maxNumObj = 100;
_objCreated = 0;
_usedPosArray = [];

//-----------------------------------
//-SPAWN OBJECTS (INSIDE LOCATIONS)

private ["_objPos","_add","_spawnPos","_dir"];

_maxNumObjLoc = (_size/5);
_errorCount = 0;
_objCreated = 0;
if (DebugMode) then {systemChat format["SPAWNING %1 radObj's at %2",_maxNumObjLoc,_location]; showChat true};
while {_objCreated < _maxNumObjLoc} do {
	_roadFound = false;
	_add = 5;
	while {!_roadFound} do {
		_spawnPos = [_location,0,_size,0.2] call SIN_fnc_findPos;
		_nearRoads = _spawnPos nearRoads _add;
		if (count _nearRoads > 0) then {
			_roadFound = true;
			_road = (_nearRoads select 0);
			_connectedRoads = roadsConnectedTo _road;
			if (count _connectedRoads > 0) then {
				_dir = [_road, (_connectedRoads select 0)] call BIS_fnc_DirTo;
			} else {
				_dir = (random 360);
			};
			_objPos = (getPos _road);
		} else {
			_add = _add + 5;
		};
		if (_add >= _size) then {
			_roadFound = true;
			_objPos = [_location,0,_size,0.2] call SIN_fnc_findPos;
			_dir = (random 360);
		};
	};

	_distCheck = [_objPos,_usedPosArray,_minDistLocation] call SIN_fnc_checkDist;
	if (_distCheck) then {
		_obj = (selectRandom _radObjCars) createVehicle _objPos;
		_obj setDir (_dir+(random 75)-(random 75));
		_obj setPos [(getPos _obj select 0),(getPos _obj select 1),0];
		_obj setDamage [1,false];
		_obj enableSimulation false;

		if ((random 100) < _radChance) then {
			_objSize = (getNumber (configfile >> "CfgVehicles" >> (typeOf _obj) >> "mapSize"));
			NATRadioActiveObjects pushBackUnique [_objPos,(_objSize*3)];
			[_objPos] spawn Z_fnc_setSpawn;
		};

		NATcache pushBack _obj;
		_objCreated = _objCreated + 1;
		_usedPosArray pushBackUnique _objPos;
		sleep 0.001;
	} else {
		_errorCount = _errorCount + 1;
	};
	if (_errorCount >= _maxNumObjLoc) exitWith {};
};

//-----------------------------------
publicVariable "NATRadioActiveObjects";
//-----------------------------------