/*
	fn_zMonitor
	Author: Sinbane
	Monitors player distance to spawners and spawns zombies if they get close enough
*/
private ["_zIndex","_index","_toDelete"];
//-----------------------------------

	while {true} do {
		sleep 5;

		if (alive player) then {
			if (sunOrMoon isEqualTo 0 || fog >= 0.5 || overcast >= 0.7) then {
				{
					if (_x distance player < 80 && (velocityModelSpace player select 1) > 3 && (random 100) < NAT_zSpawnChance && !(_x in NAT_usedSpawnerArray)) then {
						[_x,NAT_zhordeSize] call z_fnc_spawnZombies;
						NAT_usedSpawnerArray pushBack _x;
					};
				} forEach NAT_spawnerArray;
				publicVariable "NAT_usedSpawnerArray";
			} else {
				if (isServer) then {
					NAT_usedSpawnerArray = [];
					publicVariable "NAT_usedSpawnerArray";
				};
			};
		};
		if ((count NAT_zombieArrayClient) > 0) then {
			//Sun Damage
			if (sunOrMoon isEqualTo 1 && fog < 0.5 && overcast < 0.7) then {
				{
					_x setDamage ((damage _x) + (random 0.1));
				} forEach NAT_zombieArrayClient;
			};
			//remove dead or deleted Z's from client array
			_toDelete = [];
			{
				if (!alive _x || isNull _x) then {
					_toDelete pushBack _x;
				};
			} forEach NAT_zombieArrayClient;
			NAT_zombieArrayClient = NAT_zombieArrayClient - _toDelete;
		};
	};

//-----------------------------------	AmovPercMstpSnonWnonDnon_SaluteIn