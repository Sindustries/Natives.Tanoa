/*
	fn_spawnZombies
	Author: Sinbane
	Spawn the zombees!
*/
if ((count NAT_zombieArrayClient) >= NAT_maxZombies) exitWith {};
private ["_pos","_zombieCount","_zombie","_group","_exclusions","_spawnPos"];
//-----------------------------------

	_pos = _this select 0;
	_maxNum = _this select 1;
	_count = (floor(random _maxNum)+1);
	_group = createGroup resistance;

	for "_zombieCount" from 1 to _count do {
		if ((count NAT_zombieArrayClient) <= NAT_maxZombies) then {
			_spawnPos = [_pos,0,50,0,0,0,0] call SIN_fnc_findPos;
			_zombie = _group createUnit [(selectRandom NAT_Zombies), _spawnPos, [], 0, "NONE"];
			[_zombie,"AmovPercMstpSnonWnonDnon_SaluteOut"] remoteExec ["switchMove", 0];
			NAT_zombieArray pushBack _zombie;
			NAT_zombieArrayClient pushBack _zombie;
			publicVariable "NAT_zombieArray";
			NATcache pushBack _zombie;
		};
	};
	if (DebugMode) then {systemChat format["DEBUG MODE :: SPAWNED %1 ZOMBIES AT %2",_count,_pos]; showChat true;};
	_group;

//-----------------------------------