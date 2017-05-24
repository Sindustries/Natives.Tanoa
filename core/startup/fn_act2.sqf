/*
	fn_act2
	Author: Sinbane
*/
private [];

_campPos = _this select 0;
_groupMil = (group player);

(group player) setFormation "STAG COLUMN";

//-----------------------------------
//-PART 4 - CREATE A PORT

_shoreBase = [_campPos] call NAT_fnc_findShoreBasePos;
_shorePos = (_shoreBase select 1);

//SET NEW OBJECTIVE
TASK_Contact6 = player createSimpleTask ["Create a Shore Base"];
TASK_Contact6 setSimpleTaskType "move";
TASK_Contact6 setSimpleTaskDescription ["Go to a nearby shore and create a Shore Base", "Create a Shore Base", "Shore Base"];
TASK_Contact6 setSimpleTaskDestination [(_shorePos select 0),(_shorePos select 1),0];
TASK_Contact6 setTaskState "Assigned";
["TaskAssigned",["","Create a Shore Base"]] call bis_fnc_showNotification;

waitUntil {sleep 1; player distance _shorePos < 50};

[_shoreBase,"military","shore",0] call NAT_fnc_createBase;

TASK_Contact6 setTaskState "Succeeded";
["TaskSucceeded",["","Create a Shore Base"]] call bis_fnc_showNotification;
["NATnotification",["HINT","PRESS F2 TO OPEN THE BASE MENU","i"]] call bis_fnc_showNotification;