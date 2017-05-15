/*
	fn_act1
	Author: Sinbane
*/
private ["_spawnPos","_locPos","_size"];
_groupMil = _this select 0;
//-----------------------------------
//-FIND CLOSEST LOCATION

_nearbyLocations = nearestLocations [(getPos player), ["NameCity","NameCityCapital","NameVillage"], 999999, (getPos player)];
_locPos = (locationPosition (_nearbyLocations select 0));
_size = (size (_nearbyLocations select 0));

//BLACKOUT
{
	_x setHit ["light_1_hitpoint", 0.97];
	_x setHit ["light_2_hitpoint", 0.97];
	_x setHit ["light_3_hitpoint", 0.97];
	_x setHit ["light_4_hitpoint", 0.97];
} forEach nearestObjects [_locPos, [ "Lamps_base_F", "PowerLines_base_F", "PowerLines_Small_base_F" ], (_size select 0)];

TASK_Contact = player createSimpleTask ["Regroup"];
TASK_Contact setSimpleTaskType "move";
TASK_Contact setSimpleTaskDescription ["Regroup with your squad", "Regroup with your squad", "Regroup"];
TASK_Contact setSimpleTaskDestination (getPos leader _groupMil);
TASK_Contact setTaskState "Assigned";
["TaskAssigned",["","Regroup with your squad"]] call bis_fnc_showNotification;
{
	if (vehicle _x != _x) then {
		doGetOut _x;
	};
} forEach (units _groupMil);

_players = {isPlayer _x && alive _x} count playableUnits;
waitUntil {{isPlayer _x && _x distance (leader _groupMil) < 20} count playableUnits isEqualTo _players};

TASK_Contact setTaskState "Succeeded";
["TaskSucceeded",["","Regroup with your squad"]] call bis_fnc_showNotification;

TASK_Contact1 = player createSimpleTask ["Investigate the nearby settlement"];
TASK_Contact1 setSimpleTaskType "scout";
TASK_Contact1 setSimpleTaskDescription ["Investigate the settlement, maybe someone knows what the hell is going on", "Investigate", "Investigate"];
TASK_Contact1 setSimpleTaskDestination [(_locPos select 0),(_locPos select 1),0];
TASK_Contact1 setTaskState "Assigned";
["TaskAssigned",["","Investigate the nearby settlement"]] call bis_fnc_showNotification;

while {(count (waypoints _groupMil)) > 0} do {
	deleteWaypoint ((waypoints _groupMil) select 0);
};

_groupMil setCombatMode "YELLOW";
_wp = _groupMil addWaypoint [[(_locPos select 0),(_locPos select 1),0],10];
_wp setWaypointDescription "Investigate";
_wp setWaypointType "MOVE";
_wp setWaypointBehaviour "AWARE";
_wp setWaypointFormation "STAG COLUMN";
_wp setWaypointCompletionRadius 10;

//CREATE ZOMBIE HORDE
for "_i" from 1 to 4 do {
	_pos = [_locPos,0,100] call SIN_fnc_findPos;
	_group = [_pos,6] call Z_fnc_spawnZombies;
	_group setCombatMode "RED";
	_wp = _group addWaypoint [_locPos,10];
	_wp setWaypointType "SAD";
	_wp setWaypointCompletionRadius 5;
	_wp setWaypointTimeout [1, 60, 120];
};
//-----------------------------------
0 = [] call NAT_fnc_saveGame;
waitUntil {sleep 1; player distance _locPos < (_size select 0) || player distance _locPos < 600};
//-----------------------------------
//-PART 2 - DEFEAT THE NATIVES & ZOMBIES

TASK_Contact1 setTaskState "Succeeded";
["TaskSucceeded",["","Investigate the nearby settlement"]] call bis_fnc_showNotification;

for "_i" from 1 to 4 do {
	_pos = [_locPos,0,100] call SIN_fnc_findPos;
	_group = [_pos,resistance,"native",3,0.1] call NAT_fnc_createGroup;
	_group setCombatMode "RED";
	_wp = _group addWaypoint [_locPos,10];
	_wp setWaypointType "SAD";
	_wp setWaypointBehaviour "AWARE";
	_wp setWaypointFormation "LINE";
	_wp setWaypointCompletionRadius 5;
	_wp setWaypointTimeout [1, 60, 120];
};

TASK_Contact3 = player createSimpleTask ["Clear the town"];
TASK_Contact3 setSimpleTaskType "kill";
TASK_Contact3 setSimpleTaskDescription ["Clear the town", "Clear the town", "Town"];
TASK_Contact3 setTaskState "Assigned";
["TaskAssigned",["","Clear the town"]] call bis_fnc_showNotification;

while {(count (waypoints _groupMil)) > 0} do {
	deleteWaypoint ((waypoints _groupMil) select 0);
};

_pos = [_locPos] call SIN_fnc_findPos;
_groupMil setCombatMode "RED";
_wp = _groupMil addWaypoint [[(_locPos select 0),(_locPos select 1),0],10];
_wp setWaypointDescription "Clear town";
_wp setWaypointType "SAD";
_wp setWaypointBehaviour "AWARE";
_wp setWaypointFormation "STAG COLUMN";
_wp setWaypointCompletionRadius 10;

waitUntil {sleep 1; {alive _x && side _x isEqualTo RESISTANCE && _x distance _locPos < 600} count allUnits isEqualTo 0};
TASK_Contact3 setTaskState "Succeeded";
["TaskSucceeded",["","Clear the town"]] call bis_fnc_showNotification;

//-----------------------------------
//-PART 3 - FIND A SPOT FOR A CAMP

_campPos = [(getPos (leader _groupMil))] call NAT_fnc_findCampPos;

//SET NEW OBJECTIVE
TASK_Contact4 = player createSimpleTask ["Find a flat, empty area for a Base Camp"];
TASK_Contact4 setSimpleTaskType "Scout";
TASK_Contact4 setSimpleTaskDescription ["Find a flat, empty area for a Base Camp", "Find a flat, empty area for a Base Camp", "Camp"];
TASK_Contact4 setTaskState "Assigned";
["TaskAssigned",["","Find a flat, empty area for a Base Camp"]] call bis_fnc_showNotification;

while {(count (waypoints _groupMil)) > 0} do {
	deleteWaypoint ((waypoints _groupMil) select 0);
};

_groupMil setCombatMode "YELLOW";
_wp = _groupMil addWaypoint [_campPos,10];
_wp setWaypointDescription "Setup base camp";
_wp setWaypointType "MOVE";
_wp setWaypointBehaviour "AWARE";
_wp setWaypointFormation "STAG COLUMN";
_wp setWaypointCompletionRadius 10;

waitUntil {sleep 1; (leader _groupMil) distance _campPos < 10};
createCamp = false;

[] spawn {
	{
		player enableSimulationGlobal false;
		player setCaptive true;
		cutText ["", "BLACK OUT", 3];
		sleep 3;
		if (isServer) then {
			createCamp = true;
		};
		sleep 3;
		cutText ["", "BLACK IN", 3];
		sleep 3;
		player enableSimulationGlobal true;
		player setCaptive false;
	} remoteExec ["bis_fnc_call", 0];
};

waitUntil {sleep 1; createCamp isEqualTo true};
[_campPos,"military"] call NAT_fnc_createCamp;
createCamp = nil;

sleep 6;

TASK_Contact4 setTaskState "Succeeded";
["TaskSucceeded",["","Find a flat, empty area for a Base Camp"]] call bis_fnc_showNotification;
0 = [] call NAT_fnc_saveGame;

//-----------------------------------