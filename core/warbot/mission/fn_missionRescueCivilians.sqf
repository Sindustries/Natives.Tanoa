/*
	fn_missionRescueCivilians
	Author: Sinbane
*/
private ["_pos"];

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

_civCount = (1+floor(random 3));
_civs = [];
NATmissionCivsRescued = 0;
publicVariable "NATmissionCivsRescued";

//-----------------------------------
//-SET UP
private ["_houseFound","_house","_buildingPositions"];

_houseList = _pos nearObjects ["Building",_size];
_houseFound = false;
while {!_houseFound} do {
	private "_toRemove";
	_house = (selectRandom _houseList);
	_buildingPositions = _house buildingPos -1;
	_toRemove = [];
	for "_i" from 0 to ((count _buildingPositions)-1) do {
		if ((_buildingPositions select _i select 2) > 5) then {
			_toRemove pushBack (_buildingPositions select _i);
		};
	};
	_buildingPositions = _buildingPositions - _toRemove;
	if (count _buildingPositions >= _civCount) then {
		_houseFound = true;
	};
};

for "_i" from 1 to _civCount do {
	_spawnPos = (selectRandom _buildingPositions);
	_group = createGroup CIVILIAN;
	_unit = _group createUnit ["C_man_1_1_F", _spawnPos, [], 0, "NONE"];
	_unit setCaptive true;
	[_unit,"Acts_ExecutionVictim_Loop"] remoteExec ["switchMove", 0];
	_unit setDir (random 360);
	_action = _unit addAction ["UNTIE", {
		private "_time";
		_unit = _this select 0;
		_rescuer = _this select 1;
		_id = _this select 2;

		_time = (random 12);
		while {_time > 0} do {
			player playMove "Acts_carFixingWheel";
			sleep 1;
			_time = _time - 1;
		};
		player switchMove "AidlPercMstpSrasWrflDnon_G01";
		_unit setCaptive false;
		[_unit,"Acts_ExecutionVictim_Unbow"] remoteExec ["switchMove", 0];
		[_unit] joinSilent (group _rescuer);
		NATmissionCivsRescued = NATmissionCivsRescued + 1;
		publicVariable "NATmissionCivsRescued";
		removeAllActions _unit;
	},[],0,true,true,"","",2];
	_civs pushBack _unit;
	NATcache pushBack _unit;
};

_group = [(getPos _house),east,"militia",(8+floor(random 6))] call NAT_fnc_createGroup;
[_group,[((getPos _house) select 0),((getPos _house) select 1),0],50,2,true] call CBA_fnc_taskDefend;

//-----------------------------------
//-CREATE TASK

_missionTask = player createSimpleTask ["Rescue the civilians"];
_missionTask setSimpleTaskType "defend";
_missionTask setSimpleTaskDescription ["Rescue the civilians", "Rescue the civilians", "Rescue"];
_missionTask setSimpleTaskDestination [((getPos _house) select 0),((getPos _house) select 1),0];
_missionTask setTaskState "Assigned";
["TaskAssigned",["","Rescue the civilians"]] call bis_fnc_showNotification;

//-----------------------------------

waitUntil {sleep 6; {alive _x} count _civs isEqualTo NATmissionCivsRescued || {alive _x} count _civs isEqualTo 0};
NATmissionCivsRescued = nil;

if ({alive _x} count _civs isEqualTo 0) exitWith {
	_missionTask setTaskState "Failed";
	["TaskFailed",["","Rescue the civilians"]] call bis_fnc_showNotification;
	NATmission = false;
};

_nearestBase = [(getPos _house),"military"] call NAT_fnc_findNearestBase;

//-----------------------------------
//-UPDATE TASK

_missionTask setSimpleTaskType "walk";
_missionTask setSimpleTaskDescription ["Escort the civilians to safety", "Escort the civilians to safety", "Escort"];
_missionTask setSimpleTaskDestination [(_nearestBase select 0),(_nearestBase select 1),0];
_missionTask setTaskState "Assigned";
["TaskAssigned",["","Escort the civilians to safety"]] call bis_fnc_showNotification;

waitUntil {sleep 6; {_x distance _nearestBase < 30} count _civs > 0 || {alive _x} count _civs isEqualTo 0};
if ({alive _x} count _civs isEqualTo 0) exitWith {
	_missionTask setTaskState "Failed";
	["TaskFailed",["","Rescue the civilians"]] call bis_fnc_showNotification;
	NATmission = false;
};

{
	[_x] joinSilent grpNull;
} forEach _civs;

_missionTask setTaskState "Succeeded";
["TaskSucceeded",["","Rescue the civilians"]] call bis_fnc_showNotification;
_alive = {alive _x} count _civs;
[(floor(random 25)*_alive),(floor(random 25)*_alive),(floor(random 25)*_alive),(floor(random 10)*_alive)] call NAT_fnc_missionReward;

[_civs] spawn {
	_civs = _this select 0;
	{
		sleep (random 60);
		deleteVehicle _x;
	} forEach _civs;
};

NATmission = false;

//-----------------------------------