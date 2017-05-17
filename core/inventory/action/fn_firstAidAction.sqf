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
		if (player getVariable ["NATneedsDamageModif",1] > 0.75) then {
			player setVariable ["NATneedsDamageModif",0.75];
		};
	};
	case "Medikit": {
		_use = true;
		_heal = ((random 0.15)+(random 0.1));
		if (player getVariable ["NATneedsDamageModif",1] > 0.5) then {
			player setVariable ["NATneedsDamageModif",0.5];
		};
	};
	case "sc_ibuprofen": {
		if (player getVariable ["NATneedsDamageModif",1] > 0.9) then {
			player setVariable ["NATneedsDamageModif",0.9];
			_use = true;
		} else {
			_use = false;
		};
	};
	case "zk_painKillers": {
		if (player getVariable ["NATneedsDamageModif",1] > 0.75) then {
			player setVariable ["NATneedsDamageModif",0.75];
			_use = true;
		} else {
			_use = false;
		};
	};
	case "sc_morphine": {
		if (player getVariable ["NATneedsDamageModif",1] > 0.5) then {
			player setVariable ["NATneedsDamageModif",0.5];
			_use = true;
		} else {
			_use = false;
		};
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