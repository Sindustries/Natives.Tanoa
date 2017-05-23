/*
	fn_act2
	Author: Sinbane
*/
private [];

_campPos = _this select 0;
_groupMil = _this select 1;

//-----------------------------------
//-PART 4 - DEFEND THE CAMP

(group player) setFormation "STAG COLUMN";

{_x setSkill 0.8} forEach (units _groupMil);
[_groupMil,[(_campPos select 0),(_campPos select 1),0],50,2,true] call CBA_fnc_taskDefend;
/*
for "_i" from 1 to 2 do {
	_pos = [_campPos,200,300] call SIN_fnc_findPos;
	_group = [_pos,east,"militia",12,0.1] call NAT_fnc_createGroup;
	[_group,_campPos,"SAD","RED","AWARE"] call NAT_fnc_createWaypoint;
};

//SET NEW OBJECTIVE
TASK_Contact5 = player createSimpleTask ["Defend Base Camp"];
TASK_Contact5 setSimpleTaskType "defend";
TASK_Contact5 setSimpleTaskDescription ["Defend Base Camp", "Defend Base Camp", "Defend"];
TASK_Contact5 setSimpleTaskDestination [(_campPos select 0),(_campPos select 1),0];
TASK_Contact5 setTaskState "Assigned";
["TaskAssigned",["","Defend Base Camp"]] call bis_fnc_showNotification;

waitUntil {sleep 3; {alive _x && side _x isequalTo east && _x distance _campPos < 400} count allunits < {alive _x && side _x isequalTo west && _x distance _campPos < 400} count allunits};

TASK_Contact5 setTaskState "Succeeded";
["TaskSucceeded",["","Defend Base Camp"]] call bis_fnc_showNotification;
[_groupMil] call NAT_fnc_clearWaypoints;
[_groupMil,[(_campPos select 0),(_campPos select 1),0],50,2,true] call CBA_fnc_taskDefend;
*/
//-----------------------------------
//-PART 5 - CREATE A PORT

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