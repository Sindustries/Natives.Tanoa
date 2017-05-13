/*
    fn_campAddAction;
    Author: Sinbane

    Description:02
    Adds correct action to camp object
*/
private ["_sleep","_removeStr","_removeAction","_sleep4Action","_sleep8Action","_sleep12Action"];
params [
	["_obj",objNull]
];

if (isNull _obj) exitWith {};
_objType = (typeOf _obj);
_sleep = false;

//-----------------------------------
switch (_objType) do {
	case "Land_TentA_F": {
		_sleep = true;
		_removeStr = "Take down";
	};
	case "Land_Sleeping_bag_blue_F": {
		_sleep = true;
		_removeStr = "Roll up";
	};
	case "Land_Campfire_F": {
		_removeStr = "Destroy";
	};
};
_obj setVariable ["NATcampRemoveAction",_removeAction];
//-----------------------------------
//-ADD ACTIONS
if (_sleep) then {
	_sleep4Action = _obj addAction ["Sleep (4 Hours)",NAT_fnc_campSleep, [4], 20, true, true, "", "", 3, false];
	_sleep8Action = _obj addAction ["Sleep (8 Hours)",NAT_fnc_campSleep, [8], 19, true, true, "", "", 3, false];
	_sleep12Action = _obj addAction ["Sleep (12 Hours)",NAT_fnc_campSleep, [12], 18, true, true, "", "", 3, false];
	_obj setVariable ["NATcampSleep4Action",_sleep4Action];
	_obj setVariable ["NATcampSleep8Action",_sleep8Action];
	_obj setVariable ["NATcampSleep12Action",_sleep12Action];
};
_removeAction = _obj addAction [_removeStr,NAT_fnc_campDestroy, "", 0, true, true, "", "", 3, false];
//-----------------------------------