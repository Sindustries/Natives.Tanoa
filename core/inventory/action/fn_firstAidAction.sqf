/*
   	fn_firstAidAction
    Author: Sinbane

    Description:
   	Performs first aid
*/
private ["_use","_damage","_heal"];
params [
	["_item",""],
	["_heal",0]
];
if (_item isEqualTo "") exitWith {};
NATaction = true;
_use = false;
//-----------------------------------
switch (_item) do {
	case "sc_elasticbandage": {
		_use = true;
		_heal = ((random 0.05)+(random 0.05));
	};
	case "zk_bandage": {
		_use = true;
		_heal = ((random 0.025)+(random 0.025));
	};
	case "FirstAidKit": {
		_use = true;
		_heal = ((random 0.075)+(random 0.15));
	};
	case "Medikit": {
		_use = true;
		_heal = ((random 0.15)+(random 0.1));
	};
	case "sc_ibuprofen": {
		_use = false;

	};
	case "zk_painKillers": {
		_use = false;

	};
	case "sc_morphine": {
		_use = false;

	};
	case "sc_epinephrine": {
		_use = false;

	};
	case "sc_disinfectant": {
		_use = false;

	};
	case "sc_penicillin": {
		_use = false;

	};
	case "sc_potassium": {
		_use = true;
		[8,1,1] call NAT_fnc_needsUpdate;
	};
	case "sc_blood": {
		_use = false;

	};
	case "zk_antibiotic": {
		_use = false;

	};
	case "sc_tourniquet": {
		_use = false;

	};
};
//-----------------------------------
if (_use) then {
	[_heal] spawn {
		_heal = _this select 0;
		player action ["heal", player];
		sleep 5;
		if (_heal > 0) then {
			player setDamage ((damage player)-_heal);
		};
	};
};
NATaction = false;
_use;
//-----------------------------------