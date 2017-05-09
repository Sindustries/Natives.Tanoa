/*
	fn_zDeleter
	Author: Sinbane
	Deletes zombies further than a distance from players
*/
private ["_deleteDist","_delCount","_playerPosArray","_index"];
//-----------------------------------

	_deleteDist = ["NAT_zDeleteDist"] call NAT_fnc_getSetting;

	while {true} do {
		sleep 10;
		_delCount = 0;

		//FILL ZOMBIE ARRAY
		NAT_zombieArray = [];
		{
			if (alive _x && (typeOf _x) in ((NAT_zombies)+(NAT_BossZombies))) then {
				NAT_zombieArray pushBack _x;
			};
		} forEach allUnits;

		//GET PLAYER POSITIONS
		_playerPosArray = [];
		{
			if (isPlayer _x && alive _x) then {
				_playerPosArray pushBack (getPos _x);
			};
		} forEach playableUnits;

		//DELETE ZOMBIES
		{
			for "_index" from 0 to ((count _playerPosArray)-1) do {
				if (_x distance (_playerPosArray select _index) > _deleteDist && alive _x) then {
					_delCount = _delCount + 1;
				};
			};
			if (_delCount isEqualTo (count _playerPosArray)) then {
				deleteVehicle _x;
			};
		} forEach NAT_zombieArray;
	};

//-----------------------------------