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
	["_count",0],
	["_marker",true]
];
if (_pos isEqualTo [0,0,0] || isNil "_side" || isNil "_type" || _count < 1) exitWith {};
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
_group = createGroup _side;
private ["_spawnPos","_maxDist"];
_maxDist = 100;
for "_i" from 1 to _count do {
	_spawnPos = _pos;
	while {surfaceIsWater _spawnPos} do {
		_spawnPos = [_pos,0,_maxDist,4] call SIN_fnc_findPos;
		_maxDist = _maxDist + 25;
	};
	_unit = _group createUnit [_class, _spawnPos, [], _maxDist, "NONE"];
	[_unit,_type,true] call NAT_fnc_equip;
	_unit setUnitRank "MAJOR";
	_unit allowFleeing 0;
	if (count _skills > 0) then {
		{_unit setSkill [(_x select 0),(_x select 1)]} forEach _skills;
	};
	NATcache pushBack _unit;
};
if (_side in [WEST,EAST] && _marker isEqualTo true) then {
	[_group] remoteExec ["NAT_fnc_pinMarker",0];
};
_group deleteGroupWhenEmpty true;
if (DebugMode) then {systemChat format["DEBUG MODE :: SPAWNED %1 UNITS AT %2",_count,_spawnPos]; showChat true;};
_group;
//-----------------------------------