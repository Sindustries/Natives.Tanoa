/*
	fn_createGroup
	Author: Sinbane
	Spawns a group of AI
*/
private ["_class","_skills","_spawnPos"];
params [
	["_pos",[0,0,0]],
	["_side",nil],
	["_type",nil],
	["_group",grpNull]
];
if (_pos isEqualTo [0,0,0] || isNil "_side" || isNil "_type" || isNull _group) exitWith {};
//-----------------------------------
switch (_side) do {
	case WEST: {
		_class = "B_Survivor_F";
		_skills = NATmilitarySkills;
	};
	case EAST: {
		_class = "O_Survivor_F";
		_skills = NATmilitiaSkills;
	};
	case RESISTANCE: {
		_class = "I_Survivor_F";
		_skills = NATnativeSkills;
	};
	case CIVILIAN: {
		_class = "C_man_1_1_F";
	};
};
//-----------------------------------
private ["_spawnPos","_posFound","_maxDist"];

_posFound = false;
_maxDist = 20;
while {!_posFound} do {
	_spawnPos = [_pos,0,_maxDist,1] call SIN_fnc_findPos;
	if (!(surfaceIsWater _spawnPos)) then {
		_posFound = true;
	} else {
		_maxDist = _maxDist + 20;
	};
};
_unit = _group createUnit [_class, _spawnPos, [], 0, "NONE"];
[_unit,_type,true] call NAT_fnc_equip;
_unit setUnitRank "MAJOR";
_unit allowFleeing 0;
if (count _skills > 0) then {
	{_unit setSkill [(_x select 0),(_x select 1)]} forEach _skills;
};
NATcache pushBack _unit;

if (DebugMode) then {systemChat format["DEBUG MODE :: SPAWNED 1 UNIT AT %1",_spawnPos]; showChat true;};
_unit;
//-----------------------------------