/*
	fn_missionClearZombies
	Author: Sinbane
	Chooses a location with zombies to be cleared
*/
private ["_pos","_zombies"];

_pos = _this select 0 select 0;
_size = _this select 0 select 1;

NATmission = true;
[_pos] spawn {
	{
		if ((_x select 0) isEqualTo (_this select 0)) exitWith {
			NATmissionsData deleteAt _forEachIndex;
		};
	} forEach NATmissionsData;
};

//-----------------------------------

_zombies = [];
for "_i" from 0 to floor(random 10) do {
	_zPos = [_pos,0,_size,0] call SIN_fnc_findPos;
	_group = [_zPos,4] call Z_fnc_spawnZombies;
	[_group] remoteExec ["NAT_fnc_pinMarker",0];
	{_zombies pushBackUnique _x} forEach (units _group);
};

//-----------------------------------
//-CREATE TASK

_missionTask = player createSimpleTask ["Cleanse the town"];
_missionTask setSimpleTaskType "kill";
_missionTask setSimpleTaskDescription ["Cleanse the town", "Cleanse the town", "Town"];
_missionTask setSimpleTaskDestination [(_pos select 0),(_pos select 1),0];
_missionTask setTaskState "Assigned";
["TaskAssigned",["","Cleanse the town"]] call bis_fnc_showNotification;

//-----------------------------------

waitUntil {sleep 6; {alive _x && side _x isEqualTo resistance && _x distance2D _pos <= _size} count _zombies isEqualTo 0};

_missionTask setTaskState "Succeeded";
["TaskSucceeded",["","Cleanse the town"]] call bis_fnc_showNotification;
[0,0,floor(random 30)] call NAT_fnc_missionReward;

NATmission = false;

//-----------------------------------

