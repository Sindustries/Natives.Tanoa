/*
	fn_act1
	Author: Sinbane
*/
private ["_spawnPos","_locPos","_size"];
//-----------------------------------
//-FIND CLOSEST LOCATION
_nearbyLocations = nearestLocations [(getPos player), ["NameCity","NameCityCapital","NameVillage"], 999999, (getPos player)];
_houseFound = false;
_counter = 0;
while {!_houseFound} do {
	_location = (_nearbyLocations select _counter);
	_locPos = locationPosition _location;
	_size = size _location;
	_houses = nearestObjects [_locPos, ["Building"], (_size select 0)];
	if (count _houses > 0) then {
		_house = selectRandom _houses;
		_lootpositions = _house buildingPos -1;
		if (count _lootpositions > 0) then {
			_houseFound = true;
			_spawnPos = selectRandom _lootpositions;
		};
	} else {
		_counter = _counter + 1;
	};
};
//CREATE CRATE
_crate = "Box_Syndicate_Ammo_F" createVehicle NATErrorPos;
[_crate] call NAT_fnc_emptyVeh;
for "_i" from 1 to 4 do {
	_crate addItemCargoGlobal ["zk_bandage",1];
};
_crate addItemCargoGlobal ["sc_bedroll",1];
_crate addItemCargoGlobal ["RyanZombiesAntiVirusTemporary_Item",1];
_crate addWeaponCargoGlobal ["Binocular",1];
_crate addBackpackCargoGlobal [(selectRandom NAT_militiaBackpacks),1];
for "_i" from 1 to 3 do {
	_item = (selectRandom (NAT_militiaHeadgear+NAT_militiaGoggles));
	_crate addItemCargoGlobal [_item,1];
};
for "_i" from 1 to 5 do {
	_weapon = (selectRandom NAT_militiaWeapons);
	_mags = (getArray (configFile >> "CfgWeapons" >> _weapon >> "magazines"));
	_crate addWeaponCargoGlobal [_weapon,1];
	_crate addMagazineCargoGlobal [(selectRandom _mags), floor(random 3)];
};
for "_i" from 0 to (floor (random 5)) do {
	_item = (selectRandom NAT_militiaItems);
	if (_item isKindOf ["CA_Magazine", configFile >> "CfgMagazines"]) then {
        _crate addMagazineCargoGlobal [_item,1];
    } else {
        _crate addItemCargoGlobal [_item,1];
    };
};
_crate setPos _spawnPos;
TASK_ContactCrate = _crate;
//CREATE TASK
TASK_Contact = player createSimpleTask ["Investigate the nearby settlement"];
TASK_Contact setSimpleTaskType "scout";
TASK_Contact setSimpleTaskDescription ["Investigate the settlement, maybe someone knows what the hell just happened", "Investigate", "Investigate"];
TASK_Contact setSimpleTaskDestination [(_locPos select 0),(_locPos select 1),0];
TASK_Contact setTaskState "Assigned";
["TaskAssigned",["","Investigate the nearby settlement"]] call bis_fnc_showNotification;
//CREATE MILITARY PATROL & SMALL ZOMBIE HORDE
_pos = [(getPos TASK_ContactCrate),0,20] call SIN_fnc_findPos;
_group = [_pos,west,"military",8,0.2] call NAT_fnc_createGroup;
[_group,(getPos TASK_ContactCrate)] call BIS_fnc_taskDefend;
_group setCombatMode "RED";
_pos = [(getPos TASK_ContactCrate),100,200] call SIN_fnc_findPos;
_group = [_pos,6] call Z_fnc_spawnZombies;
_group setCombatMode "RED";
_wp = _group addWaypoint [TASK_ContactCrate,10];
_wp setWaypointType "MOVE";
_wp setWaypointBehaviour "AWARE";
_wp setWaypointFormation "LINE";
_wp setWaypointCompletionRadius 5;
_wp setWaypointTimeout [1, 60, 120];
//-----------------------------------
0 = [] call NAT_fnc_saveGame;
waitUntil {sleep 1; player distance _locPos < (_size select 0) || player distance _locPos < 600};
//-----------------------------------
//-PART 2 - LOOT THE CRATE

TASK_Contact setTaskState "Succeeded";
["TaskSucceeded",["","Investigate the nearby settlement"]] call bis_fnc_showNotification;
TASK_Contact2 = player createSimpleTask ["Search the supply crate"];
TASK_Contact2 setSimpleTaskType "search";
TASK_Contact2 setSimpleTaskDescription ["Search the supply crate", "Search the supply crate", "Crate"];
TASK_Contact2 setSimpleTaskDestination (getPosATL TASK_ContactCrate);
TASK_Contact2 setTaskState "Assigned";
["TaskAssigned",["","Search the supply crate"]] call bis_fnc_showNotification;

TASK1EH = player addEventHandler ["InventoryClosed", {
	private ["_unit","_container"];
	_unit = _this select 0;
	_container = _this select 1;
	if (_container isEqualTo TASK_ContactCrate) exitWith {
		TASK_Contact2 setTaskState "Succeeded";
		["TaskSucceeded",["","Investigate the corpse"]] call bis_fnc_showNotification;
	};
}];

waitUntil {sleep 1; taskState TASK_Contact2 isEqualTo "Succeeded"};
player removeEventHandler ["InventoryClosed",TASK1EH];
//-----------------------------------
//-PART 3 DEFEAT THE NATIVES

_pos = [(getPos TASK_ContactCrate),100,200] call SIN_fnc_findPos;
_group = [_pos,6] call Z_fnc_spawnZombies;
_group setCombatMode "RED";
_wp = _group addWaypoint [TASK_ContactCrate,10];
_wp setWaypointType "MOVE";
_wp setWaypointBehaviour "AWARE";
_wp setWaypointFormation "LINE";
_wp setWaypointCompletionRadius 5;
_wp setWaypointTimeout [1, 60, 120];

private "_groups";
_groups = [];
for "_i" from 1 to 4 do {
	_pos = [(getPos TASK_ContactCrate),200,300] call SIN_fnc_findPos;
	_group = [_pos,resistance,"native",3,0.1] call NAT_fnc_createGroup;
	_group setCombatMode "RED";
	_wp = _group addWaypoint [TASK_ContactCrate,10];
	_wp setWaypointType "SAD";
	_wp setWaypointBehaviour "AWARE";
	_wp setWaypointFormation "LINE";
	_wp setWaypointCompletionRadius 5;
	_wp setWaypointTimeout [1, 60, 120];
	_groups pushBack _group;
};

TASK_Contact3 = player createSimpleTask ["Defeat the Native Assault"];
TASK_Contact3 setSimpleTaskType "kill";
TASK_Contact3 setSimpleTaskDescription ["Defeat the Native Assault", "Defeat the Native Assault", "Natives"];
TASK_Contact3 setTaskState "Assigned";
//TASK_Contact3 setSimpleTaskDestination TASK_ContactCrate;
["TaskAssigned",["","Defeat the Native Assault"]] call bis_fnc_showNotification;

waitUntil {sleep 1; {alive _x && side _x isEqualTo RESISTANCE && _x distance _locPos < 600} count allUnits isEqualTo 0};
TASK_Contact3 setTaskState "Succeeded";
["TaskSucceeded",["","Defeat the Native Assault"]] call bis_fnc_showNotification;

//-----------------------------------
