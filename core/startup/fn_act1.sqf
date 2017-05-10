/*
	fn_act1
	Author: Sinbane
*/
private ["_spawnPos"];
//-----------------------------------
//-FIND CLOSEST LOCATION & CREATE A DEAD DUDE IN A RANDOM HOUSE
_nearbyLocations = nearestLocations [(getPos player), ["NameCity","NameCityCapital","NameVillage"], 999999, (getPos player)];
_location = (_nearbyLocations select 0);
_locPos = locationPosition _location;
_size = size _location;
_houses = nearestObjects [_locPos, ["Building"], (_size select 0)];
_houseFound = false;
while {!_houseFound} do {
	_house = selectRandom _houses;
	_lootpositions = _house buildingPos -1;
	if (count _lootpositions > 0) then {
		_houseFound = true;
		_spawnPos = selectRandom _lootpositions;
	};
};

//CREATE DUDE
_contact = (createGroup WEST) createUnit ["B_Survivor_F", _spawnPos, [], 0, "NONE"];
[_contact] call NAT_fnc_Unequip;
[_contact,"militia",true] call NAT_fnc_equip;
_contact addWeapon "Binocular";
_contact setDamage 1;
TASK_ContactNPC = _contact;
//CREATE TASK
TASK_Contact = player createSimpleTask ["Investigate the nearby settlement"];
TASK_Contact setSimpleTaskType "scout";
TASK_Contact setSimpleTaskDescription ["Investigate the settlement, maybe someone knows what the hell just happened", "Investigate", "Investigate"];
TASK_Contact setSimpleTaskDestination _locPos;
TASK_Contact setTaskState "Assigned";
TASK_Contact setSimpleTaskAlwaysVisible true;
["TaskAssigned",["","Investigate the nearby settlement"]] call bis_fnc_showNotification;
//CREATE MILITARY PATROL & SMALL ZOMBIE HORDE
_pos = [(getPos TASK_ContactNPC),200,300] call SIN_fnc_findPos;
_group = [_pos,west,"military",3,0.2] call NAT_fnc_createGroup;
[_group,(getPos TASK_ContactNPC),100] call BIS_fnc_taskPatrol;
_pos = [(getPos TASK_ContactNPC),100,200] call SIN_fnc_findPos;
_group = [_pos,6] call Z_fnc_spawnZombies;
_wp = _group addWaypoint [TASK_ContactNPC,10];
_wp setWaypointType "SAD";
_wp setWaypointBehaviour "AWARE";
_wp setWaypointFormation "LINE";
_wp setWaypointCompletionRadius 5;
_wp setWaypointTimeout [1, 60, 120];
//-----------------------------------
[] call NAT_fnc_saveGame;
waitUntil {sleep 1; player distance _locPos < (_size select 0)};
//-----------------------------------
//-PART 2 - LOOT THE CORPSE

TASK_Contact setTaskState "Succeeded";
["TaskSucceeded",["","Investigate the nearby settlement"]] call bis_fnc_showNotification;
TASK_Contact2 = player createSimpleTask ["Investigate the corpse"];
TASK_Contact2 setSimpleTaskType "search";
TASK_Contact2 setSimpleTaskDescription ["Investigate the corpse", "Investigate the corpse", "Corpse"];
TASK_Contact2 setSimpleTaskDestination (getPosATL TASK_ContactNPC);
TASK_Contact2 setTaskState "Assigned";
TASK_Contact2 setSimpleTaskAlwaysVisible true;
["TaskAssigned",["","Investigate the corpse"]] call bis_fnc_showNotification;

TASK1EH = player addEventHandler ["InventoryClosed", {
	private ["_unit","_container"];
	_unit = _this select 0;
	_container = _this select 1;
	if (_container isEqualTo TASK_ContactNPC) exitWith {
		TASK_Contact2 setTaskState "Succeeded";
		["TaskSucceeded",["","Investigate the corpse"]] call bis_fnc_showNotification;
		player removeEventHandler ["InventoryOpened",TASK1EH];
	};
}];

waitUntil {sleep 1; taskState TASK_Contact2 isEqualTo "Succeeded"};
//-----------------------------------
//-PART 3 DEFEAT THE MILITIA

_pos = [(getPos TASK_ContactNPC),100,200] call SIN_fnc_findPos;
_group = [_pos,6] call Z_fnc_spawnZombies;
[_group,(getPos TASK_ContactNPC)] call BIS_fnc_taskDefend;

_pos = [(getPos TASK_ContactNPC),200,300] call SIN_fnc_findPos;
_group = [_pos,east,"militia",3,0.1] call NAT_fnc_createGroup;	//grp,pos,dist call BIS_fnc_taskPatrol

_wp = _group addWaypoint [TASK_ContactNPC,10];
_wp setWaypointType "SAD";
_wp setWaypointBehaviour "AWARE";
_wp setWaypointFormation "LINE";
_wp setWaypointCompletionRadius 5;
_wp setWaypointTimeout [1, 60, 120];

TASK_Contact3 = player createSimpleTask ["Defeat the Militia Ambush"];
TASK_Contact3 setSimpleTaskType "kill";
TASK_Contact3 setSimpleTaskDescription ["Defeat the Militia Ambush", "Defeat the Militia Ambush", "Miltiia"];
TASK_Contact3 setTaskState "Assigned";
TASK_Contact3 setSimpleTaskAlwaysVisible false;
["TaskAssigned",["","Defeat the Militia Ambush"]] call bis_fnc_showNotification;

_taskHDL = [_group] spawn {
	_group = _this select 0;
	while {{alive _x} count units _group > 0} do {
		TASK_Contact3 setSimpleTaskDestination (getPos leader _group);
		sleep 1;
	};
};

waitUntil {sleep 1; {alive _x} count units _group isEqualTo 0};
TASK_Contact3 setTaskState "Succeeded";
["TaskSucceeded",["","Defeat the Militia Ambush"]] call bis_fnc_showNotification;

//-----------------------------------