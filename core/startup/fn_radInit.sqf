/*
	fn_radInit
	Author: Sinbane
*/
private ["_minDistSpawn","_radChance","_minDistLocation","_maxNumObj","_objCreated","_usedPosArayy"];

_minDistSpawn = 100;
_radChance = 90;
_minDistLocation = 0.1;
_maxNumObj = 100;
_maxNumObjLoc = 30;
_objCreated = 0;
_usedPosArray = [];

//-----------------------------------
//-OBJECT ARRAYS (WRECKS)

_radObjCars = [
"Land_Wreck_BMP2_F",
"Land_Wreck_BRDM2_F",
"Land_Wreck_HMMWV_F",
"Land_Wreck_Skodovka_F",
"Land_Wreck_Truck_F",
"Land_Wreck_Car2_F",
"Land_Wreck_Car_F",
"Land_Wreck_Car3_F",
"Land_Wreck_Hunter_F",
"Land_Wreck_Offroad_F",
"Land_Wreck_Offroad2_F",
"Land_Wreck_UAZ_F",
"Land_Wreck_Ural_F",
"Land_Wreck_Truck_dropside_F",
"Land_Wreck_Slammer_F",
"Land_Wreck_Slammer_hull_F",
"Land_Wreck_T72_hull_F"
];

_radObjAir = [
"Land_Wreck_Heli_Attack_02_F",
"Land_UWreck_Heli_Attack_02_F",
"Land_UWreck_MV22_F",
"Land_Wreck_Plane_Transport_01_F",
"Land_HistoricalPlaneWreck_01_F",
"Land_HistoricalPlaneWreck_03_F",
"Land_HistoricalPlaneWreck_02_rear_F",
"Land_HistoricalPlaneWreck_02_front_F",
"Land_HistoricalPlaneWreck_02_wing_left_F",
"Land_HistoricalPlaneWreck_02_wing_right_F",
"Land_HistoricalPlaneDebris_01_F",
"Land_HistoricalPlaneDebris_02_F",
"Land_HistoricalPlaneDebris_03_F",
"Land_HistoricalPlaneDebris_04_F"
];

_radObjArray = (_radObjCars+_radObjAir);

//-----------------------------------
//-IRRADIATE ALL LOCATIONS
NATRadioActiveLocations = [];
{
	NATRadioActiveLocations pushBack [(_x select 0),((_x select 1) select 0),false];
} forEach NAT_mapLocations;
publicVariable "NATRadioActiveLocations";
//-----------------------------------
//-SPAWN OBJECTS (OUTSIDE LOCATIONS)
NATRadioActiveObjects = [];
/*
_counter = _maxNumObj;
_errorCount = 0;
_objCreated = 0;
while {_objCreated < _maxNumObj} do {

	_spawnPos = [NATErrorPos,0,999999,4,0,0,0] call SIN_fnc_findPos;
	_distCheck = [_spawnPos,_usedPosArray,_minDistSpawn] call SIN_fnc_checkDist;
	if (_distCheck) then {
		_obj = (selectRandom _radObjArray) createVehicle _spawnpos;
		_obj setDir (random 360);
		_obj setPos (getPos _obj);
		_obj setDamage [1,false];
		_obj enableSimulation false;

		if ((random 100) < 90) then {
			_size = (getNumber (configfile >> "CfgVehicles" >> (typeOf _obj) >> "mapSize"));
			NATRadioActiveObjects pushBackUnique [_spawnPos,(_size*3)];
			//[_spawnPos] spawn Z_fnc_setSpawn;
		};

		_objCreated = _objCreated + 1;
		_usedPosArray pushBackUnique _spawnpos;
	} else {
		_errorCount = _errorCount + 1;
	};
	_counter = _counter - 1;
	[_counter,_maxNumObj] remoteExec ["NAT_fnc_updateProgressBar", 0];
	if (_errorCount >= _maxNumObj) exitWith {};
};*/
publicVariable "NATRadioActiveObjects";
//-----------------------------------
//-LAUNCH FNCS
[_radObjCars] remoteExec ["NAT_fnc_radObjMonitor",0];
//-----------------------------------