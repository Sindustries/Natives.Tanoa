/*
    fn_campAddAction;
    Author: Sinbane

    Description:
    Adds correct action to camp object
*/
private ["_action"];
params [
	["_obj",objNull]
];

if (isNull _obj) exitWith {};
_objType = (typeOf _obj);

//-----------------------------------
switch (_objType) do {
	case "Land_TentA_F": {
		_action = _obj addAction ["TAKE DOWN TENT",NAT_fnc_campDestroy, "", 2, true, true, "", "", 6, false]
	};
	case "Land_Sleeping_bag_blue_F": {
		_action = _obj addAction ["ROLL UP BEDROLL", NAT_fnc_campDestroy, "", 2, true, true, "", "", 6, false]
	};
	case "Land_Campfire_F": {
		_action = _obj addAction ["DESTROY", NAT_fnc_campDestroy, "", 2, true, true, "", "", 6, false]
	};
};
_obj setVariable ["NATcampRemoveAction",_action];
//-----------------------------------