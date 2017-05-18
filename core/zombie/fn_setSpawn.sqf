/*
	fn_setZSpawn
	Author: Sinbane
	Sets a spawn loction for zombies
*/
private ["_pos","_count","_posFound","_spawnPos","_posCheck","_distCheck"];
//-----------------------------------

	_pos = _this select 0;

	if (isNil "NAT_zSpawnerArray") then {NAT_zSpawnerArray = []};

	NAT_zSpawnerArray pushBack _pos;

//-----------------------------------