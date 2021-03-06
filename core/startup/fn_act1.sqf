/*
	fn_act1
	Author: Sinbane
*/
private ["_spawnPos","_locPos","_size"];
_groupMil = (group player);
//-----------------------------------
//-FIND CLOSEST LOCATION

_nearbyLocations = nearestLocations [(getPos player), ["NameCity","NameCityCapital","NameVillage"], 999999, (getPos player)];
_locPos = (locationPosition (_nearbyLocations select 0));
_size = (size (_nearbyLocations select 0));

if (surfaceIsWater _locPos) then {
	_shore = [_locPos,0,100,2,0,1,1] call SIN_fnc_findPos;
	_locPos = [_shore,0,50] call SIN_fnc_findPos;
};

TASK_Contact1 = player createSimpleTask ["Investigate the nearby settlement"];
TASK_Contact1 setSimpleTaskType "scout";
TASK_Contact1 setSimpleTaskDescription ["Investigate the settlement", "Investigate", "Investigate"];
TASK_Contact1 setSimpleTaskDestination [(_locPos select 0),(_locPos select 1),0];
TASK_Contact1 setTaskState "Assigned";
TASK_Contact1 setSimpleTaskAlwaysVisible true;
["TaskAssigned",["","Investigate the nearby settlement"]] call bis_fnc_showNotification;

for "_i" from 1 to 8 do {
	[_locPos,(_size select 0)] call Z_fnc_setSpawn;
};
for "_i" from 1 to 4 do {
	_pos = [_locPos,0,100] call SIN_fnc_findPos;
	_group = [_pos,resistance,"native",5] call NAT_fnc_createGroup;
	[_group,[(_locPos select 0),(_locPos select 1),0],(_size select 0),2,true] call CBA_fnc_taskDefend;
	_pos = [_locPos,(_size select 0),(_size select 0)+200] call SIN_fnc_findPos;
	_group = [_pos,east,"militia",2] call NAT_fnc_createGroup;
	[_group,_locPos,"SAD","RED","AWARE"] call NAT_fnc_createWaypoint;
};

waitUntil {sleep 2; vehicle player isEqualTo player && isTouchingGround player};

{
	if (vehicle _x != _x) then {
		unassignVehicle _x;
		doGetOut _x;
	};
} forEach (units _groupMil);
[_groupMil] call NAT_fnc_clearWaypoints;

waitUntil {sleep 2; (leader _groupMil) distance2D _locPos < (_size select 0) || (leader _groupMil) distance2D _locPos < 60};

TASK_Contact1 setTaskState "Succeeded";
["TaskSucceeded",["","Investigate the nearby settlement"]] call bis_fnc_showNotification;

[_groupMil] call NAT_fnc_clearWaypoints;
_groupMil setFormation "STAG COLUMN";

//-----------------------------------
//-PART 2 - DEFEAT THE MILITIA, NATIVES & ZOMBIES

TASK_Contact3 = player createSimpleTask ["Sweep the town"];
TASK_Contact3 setSimpleTaskType "kill";
TASK_Contact3 setSimpleTaskDescription ["Sweep the town", "Sweep the town", "Town"];
TASK_Contact3 setSimpleTaskDestination [(_locPos select 0),(_locPos select 1),0];
TASK_Contact3 setTaskState "Assigned";
["TaskAssigned",["","Sweep the town"]] call bis_fnc_showNotification;

[_groupMil] call NAT_fnc_clearWaypoints;
_groupMil setBehaviour "COMBAT";

waitUntil {sleep 1; {alive _x && side _x isEqualTo RESISTANCE && _x distance2D _locPos < (_size select 0)} count allUnits < 2 && {alive _x && side _x isEqualTo EAST && _x distance2D _locPos < (_size select 0)} count allUnits < 2};
TASK_Contact3 setTaskState "Succeeded";
["TaskSucceeded",["","Clear the town"]] call bis_fnc_showNotification;

_groupMil setBehaviour "AWARE";

//-----------------------------------
//-PART 3 - FIND A SPOT FOR A CAMP

_campPos = [(getPos (leader _groupMil))] call NAT_fnc_findBasePos;

//SET NEW OBJECTIVE
TASK_Contact4 = player createSimpleTask ["Find a flat, empty area for a Base Camp"];
TASK_Contact4 setSimpleTaskType "Scout";
TASK_Contact4 setSimpleTaskDescription ["Find a flat, empty area for a Base Camp", "Find a flat, empty area for a Base Camp", "Camp"];
TASK_Contact4 setSimpleTaskDestination [(_campPos select 0),(_campPos select 1),0];
TASK_Contact4 setTaskState "Assigned";
["TaskAssigned",["","Find a flat, empty area for a Base Camp"]] call bis_fnc_showNotification;

[_groupMil] call NAT_fnc_clearWaypoints;
//[_groupMil,_campPos,"MOVE","YELLOW","AWARE","Base camp site"] call NAT_fnc_createWaypoint;

waitUntil {sleep 1; (leader _groupMil) distance2D _campPos < 30};
[_groupMil] call NAT_fnc_clearWaypoints;
[_campPos,"military","land",6] call NAT_fnc_createBase;

sleep 6;

0 = [] call NAT_fnc_saveGame;
TASK_Contact4 setTaskState "Succeeded";
["TaskSucceeded",["","Find a flat, empty area for a Base Camp"]] call bis_fnc_showNotification;
["NATnotification",["HINT","PRESS WINDOWS KEY TO OPEN THE BASE MENU","i"]] call bis_fnc_showNotification;

{
	unassignVehicle _x;
	if (vehicle _x != _x) then {
		doGetOut _x;
	};
} forEach (units _groupMil);
[_groupMil] call NAT_fnc_clearWaypoints;

[_campPos] spawn NAT_fnc_act2;
//-----------------------------------