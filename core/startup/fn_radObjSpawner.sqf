/*
	HVP Radioactive Object Spawn Script
	By Sinbane
	Spawns a variety of radioactive objects and areas around the map
*/
private [];
//-----------------------------------
//-VARIABLES

_location = _this select 0;
_size = _this select 1;
_minDistSpawn = 100;
_radChance = 90;
_minDistLocation = 0.4;
_maxNumObj = 100;
_usedPosArray = [];

//-----------------------------------
//-SPAWN OBJECTS (INSIDE LOCATIONS)

private ["_objCreated","_objPos","_selObj","_objSize","_add","_spawnPos","_dir"];

_maxNumObjLoc = (_size/2);
_errorCount = 0;
_objCreated = 0;
_houseList = _location nearObjects ["Building",_size];

while {_objCreated < _maxNumObjLoc} do {
	_roadFound = false;
	_add = 5;
	while {!_roadFound} do {
		_selObj = (selectRandom NATradObjCars);
		_objSize = (getNumber (configfile >> "CfgVehicles" >> _selObj >> "mapSize"));
		_spawnPos = [_location,0,_size,0] call SIN_fnc_findPos;
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
			_objPos = [_location,0,_size,(_objSize/2)] call SIN_fnc_findPos;
			_dir = (random 360);
		};
	};

	_distCheck = [_objPos,_usedPosArray,(_objSize/2)] call SIN_fnc_checkDist;
	if (_distCheck) then {
		_placer = _selObj createVehicleLocal _objPos;
		_position = getPosWorld _placer;
		_vectorDirUp = [vectorDir _placer, vectorUp _placer];
		_model = getModelInfo _placer select 1;
		deleteVehicle _placer;
		_obj = createSimpleObject [_model, _position];
		_obj setVectorDirAndUp _vectorDirUp;
		_obj setDir (_dir+(random 75)-(random 75));
		_obj allowDamage false;
		_obj enableSimulation false;

		if ((random 100) < _radChance) then {
			NATRadioActiveObjects pushBackUnique [_objPos,(_objSize*3)];
		};

		NATcache pushBack _obj;
		_objCreated = _objCreated + 1;
		_usedPosArray pushBackUnique _objPos;
		sleep 0.001;
	} else {
		_errorCount = _errorCount + 1;
	};
	_spawnPos = [(getPos (selectRandom _houseList)),5,20,1] call SIN_fnc_findPos;

	_placer = (selectRandom NATradObjJunk) createVehicleLocal _spawnPos;
	_position = getPosWorld _placer;
	_vectorDirUp = [vectorDir _placer, vectorUp _placer];
	_model = getModelInfo _placer select 1;
	deleteVehicle _placer;
	_obj = createSimpleObject [_model, _position];
	_obj setVectorDirAndUp _vectorDirUp;
	_obj setDir (_dir+(random 75)-(random 75));
	_obj allowDamage false;
	_obj enableSimulation false;
	NATcache pushBack _obj;
	if (_errorCount >= _maxNumObjLoc) exitWith {};
};

if (DebugMode) then {systemChat format["SPAWNED %1 radObj's at %2",_objCreated,_location]; showChat true};
//-----------------------------------
publicVariable "NATRadioActiveObjects";
//-----------------------------------