/*
	fn_zMonitor
	Author: Sinbane
	Monitors player distance to spawners and spawns zombies if they get close enough
*/
private ["_zIndex","_index","_toDelete"];
//-----------------------------------


sleep 10;

/* GET PLAYER POSITIONS */
_playerPosArray = [];
{
	if (isPlayer _x && alive _x) then {
		_playerPosArray pushBack (getPos _x);
	};
} forEach playableUnits;
/* CHECK DISTANCES */
{
	for "_i" from 0 to ((count _playerPosArray)-1) do {
		if (_x distance (_playerPosArray select _i) <= 300 && !(_x in NAT_usedSpawnerArray) && (random 100) < NAT_zSpawnChance) then {
			[_x,floor(random 7)] call Z_fnc_spawnZombies;
			NAT_usedSpawnerArray pushBack _x;
		};
		if (_x distance (_playerPosArray select _i) > 1000 && _x in NAT_usedSpawnerArray) then {
			NAT_usedSpawnerArray = NAT_usedSpawnerArray - _x;
		};
	};
	sleep 0.001;
} forEach NAT_zSpawnerArray;

[] spawn Z_fnc_zMonitor;
//-----------------------------------	AmovPercMstpSnonWnonDnon_SaluteIn