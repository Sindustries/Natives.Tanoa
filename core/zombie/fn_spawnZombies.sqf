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

private ["_spawnPos","_maxDist"];
for "_zombieCount" from 1 to _maxNum do {
	_maxDist = 20;
	_spawnPos = _pos;
	while {surfaceIsWater _spawnPos} do {
		_spawnPos = [_pos,0,_maxDist,4] call SIN_fnc_findPos;
		_maxDist = _maxDist + 20;
	};
	_zombie = _group createUnit [(selectRandom NAT_Zombies), _spawnPos, [], _maxDist, "NONE"];
	_zombie allowFleeing 0;
	{_zombie setSkill [(_x select 0),(_x select 1)]} forEach NATzombieSkills;
	[_zombie,"AmovPercMstpSnonWnonDnon_SaluteOut"] remoteExec ["switchMove", 0];
	NAT_zombieArray pushBack _zombie;
	NAT_zombieArrayClient pushBack _zombie;
	publicVariable "NAT_zombieArray";
	NATcache pushBack _zombie;
};
_group setCombatMode "RED";
if (DebugMode) then {systemChat format["DEBUG MODE :: SPAWNED %1 ZOMBIES AT %2",_maxNum,_pos]; showChat true;};
_group;

//-----------------------------------