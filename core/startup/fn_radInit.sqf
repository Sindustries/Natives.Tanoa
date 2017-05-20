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
//-OBJECT ARRAYS

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

_radObjJunk = [
"Land_Garbage_square3_F",
"Land_Garbage_square5_F",
"Land_GarbageBags_F",
"Land_Garbage_line_F",
"Land_GarbageBarrel_01_F",
"Land_GarbageBarrel_01_F",
"Land_GarbagePallet_F",
"Land_GarbageWashingMachine_F",
"Land_LuggageHeap_03_F",
"Land_LuggageHeap_01_F",
"Land_LuggageHeap_02_F",
"Land_LuggageHeap_05_F",
"Land_LuggageHeap_04_F",
"Land_GarbageHeap_01_F",
"Land_GarbageHeap_02_F",
"Land_GarbageHeap_03_F",
"Land_GarbageHeap_04_F",
"Land_JunkPile_F"
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
_counter = (count NAT_mapLocations);
{
	NATRadioActiveLocations pushBack [(_x select 0),((_x select 1) select 0),false];
	_houses = (_x select 0) nearObjects ["Building",((_x select 1) select 0)];
	{
		if ((random 100) < 20) then {
			_x setDamage [1,false];
		};
	} forEach _houses;
	_counter = _counter - 1;
	[_counter,(count NAT_mapLocations)] remoteExec ["NAT_fnc_updateProgressBar", 0];
} forEach NAT_mapLocations;
publicVariable "NATRadioActiveLocations";
//-----------------------------------
//-SPAWN OBJECTS (OUTSIDE LOCATIONS)
NATradObjCars = _radObjCars;
NATradObjJunk = _radObjJunk;
NATRadioActiveObjects = [];
publicVariable "NATradObjCars";
publicVariable "NATradObjJunk";
publicVariable "NATRadioActiveObjects";
//-----------------------------------