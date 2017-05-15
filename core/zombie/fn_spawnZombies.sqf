/*
	fn_spawnZombies
	Author: Sinbane
	Spawn the zombees!
*/
private ["_pos","_zombieCount","_zombie","_group","_exclusions","_spawnPos"];
//-----------------------------------

	_pos = _this select 0;
	_maxNum = _this select 1;
	_group = createGroup resistance;

	for "_zombieCount" from 1 to _maxNum do {
		if ((count NAT_zombieArrayClient) <= NAT_maxZombies) then {
			_spawnPos = [_pos,0,20,1] call SIN_fnc_findPos;
			_zombie = _group createUnit [(selectRandom NAT_Zombies), _spawnPos, [], 0, "NONE"];
			_zombie allowFleeing 0;
			[_zombie,"AmovPercMstpSnonWnonDnon_SaluteOut"] remoteExec ["switchMove", 0];
			NAT_zombieArray pushBack _zombie;
			NAT_zombieArrayClient pushBack _zombie;
			publicVariable "NAT_zombieArray";
			NATcache pushBack _zombie;
		};
	};
	_group setCombatMode "RED";
	if (DebugMode) then {systemChat format["DEBUG MODE :: SPAWNED %1 ZOMBIES AT %2",_maxNum,_pos]; showChat true;};
	_group;

//-----------------------------------