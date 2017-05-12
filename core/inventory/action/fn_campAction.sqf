/*
   	fn_campAction
    Author: Sinbane

    Description:
   	Build your camp
*/
private ["_use"];
params [
	["_item",""]
];
if (_item isEqualTo "") exitWith {};
_use = false;
NATaction = true;
//-----------------------------------
switch (_item) do {
	case "zk_tent": {
		_use = true;
		[_item] spawn NAT_fnc_campObjectPlace;
	};
	case "sc_bedroll": {
		_use = true;
		[_item] spawn NAT_fnc_campObjectPlace;
	};
	case "zk_wood": {
		if ((["zk_matches"] call NAT_fnc_vInvCheck) || (["sc_lighter"] call NAT_fnc_vInvCheck)) then {
			_use = true;
			[_item] spawn NAT_fnc_campObjectPlace;
		};
	};
};
//-----------------------------------
_use;
//-----------------------------------