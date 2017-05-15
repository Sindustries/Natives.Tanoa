/*
	fn_act2
	Author: Sinbane
*/
private [];

_campPos = _this select 0;
_groupMil = _this select 1;



//-----------------------------------
//-PART 4 - DEFEND THE CAMP
/*
Parameters:
    - Group (Group or Object)

Optional:
    - Position (XYZ, Object, Location or Group)
    - Defend Radius (Scalar)
    - Building Size Threshold (Integer, default 2)
    - Can patrol (boolean)

Example:
    (begin example)
    [this] call CBA_fnc_taskDefend
    (end)
*/

{_x setSkill 0.8} forEach (units _groupMil);
[_groupMil,[(_campPos select 0),(_campPos select 1),0],50,2,true] call CBA_fnc_taskDefend;

for "_i" from 1 to 2 do {
	_pos = [_campPos,200,300] call SIN_fnc_findPos;
	_group = [_pos,east,"militia",12,0.1] call NAT_fnc_createGroup;
	//[_group,[(_campPos select 0),(_campPos select 1),0],1] call CBA_fnc_taskAttack;
	[_group,_campPos,"SAD","RED","AWARE"] call NAT_fnc_createWaypoint;
};

//SET NEW OBJECTIVE
TASK_Contact5 = player createSimpleTask ["Defend Base Camp"];
TASK_Contact5 setSimpleTaskType "defend";
TASK_Contact5 setSimpleTaskDescription ["Defend Base Camp", "Defend Base Camp", "Defend"];
TASK_Contact5 setSimpleTaskDestination [(_campPos select 0),(_campPos select 1),0];
TASK_Contact5 setTaskState "Assigned";
["TaskAssigned",["","Defend Base Camp"]] call bis_fnc_showNotification;

waitUntil {sleep 3; {alive _x && side _x isequalTo east && _x distance player < 400} count allunits isEqualTo 0};

TASK_Contact5 setTaskState "Succeeded";
["TaskSucceeded",["","Defend Base Camp"]] call bis_fnc_showNotification;
[_groupMil] call NAT_fnc_clearWaypoints;
[_groupMil,[(_campPos select 0),(_campPos select 1),0],50,2,true] call CBA_fnc_taskDefend;