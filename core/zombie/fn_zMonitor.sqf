/*
	fn_zMonitor
	Author: Sinbane
	Monitors player distance to spawners and spawns zombies if they get close enough
*/
private [];
//-----------------------------------

sleep 10;

/* CHECK DISTANCES */
{
	_spawner = _x;
	_military = {alive _x && side _x isEqualTo WEST && _x distance2D _spawner < NAT_zSpawnDist} count allUnits;
	_militia = {alive _x && side _x isEqualTo EAST && _x distance2D _spawner < NAT_zSpawnDist} count allUnits;

	if (_military > 0 || _militia > 0) then {
		if ((random 100) < NAT_zSpawnChance) then {
			[_spawner,floor(random (NAT_zSpawnNum+1))] call Z_fnc_spawnZombies;
			NAT_zSpawnerArray set [_forEachIndex,objNull];
		};
	};
	sleep 0.001;
} forEach NAT_zSpawnerArray;
NAT_zSpawnerArray = NAT_zSpawnerArray - [objNull];

[] spawn Z_fnc_zMonitor;
//-----------------------------------	AmovPercMstpSnonWnonDnon_SaluteIn