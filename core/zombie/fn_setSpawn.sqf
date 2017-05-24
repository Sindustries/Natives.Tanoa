/*
	fn_setSpawn
	Author: Sinbane
	Sets a spawn loction for zombies
*/
private ["_pos","_nearRoads"];
//-----------------------------------
params [
	["_pos",[0,0,0]],
	["_dist",200]
];

if (_pos isEqualTo [0,0,0]) exitWith {};
if (isNil "NAT_zSpawnerArray") then {NAT_zSpawnerArray = []};

//FIND A BUILDING WITHIN SUPPLIED DISTANCE
_houseList = _pos nearObjects ["Building",100];
if (count _houseList > 0) then {
	_pos = (getPos (selectRandom _houseList));
};
//IF NO BUILDINGS FIND A ROAD WITHIN SUPPLIED DISTANCE
_nearRoads = _pos nearRoads 100;
if (count _houseList < 1 && count _nearRoads > 0) then {
	_pos = (getPos (selectRandom _nearRoads));
};
//IF NO BUILDINGS OR ROADS, RANDOM SAFE POS WITHIN SUPPLIED DISTANCE
if (count _houseList < 1 && count _nearRoads < 1) then {
	_pos = [_pos,0,50,0] call SIN_fnc_findPos;
};

NAT_zSpawnerArray pushBack _pos;

//-----------------------------------