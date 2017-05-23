/*
   	fn_eatAction
    Author: Sinbane

    Description:
   	Eats the nom noms
*/
private ["_use"];
params [
	["_item",""]
];
if (_item isEqualTo "") exitWith {};
_use = false;
//-----------------------------------
switch (_item) do {
	case "zk_tacticalBacon": {
		if (["zk_canopener"] call NAT_fnc_vInvCheck) then {
			_use = true;
			[1,2,0.3] call NAT_fnc_needsUpdate;
			[2,2,0.3] call NAT_fnc_needsUpdate;
			["zk_e_can",1,true] call NAT_fnc_vInvAdjust;
		};
	};
	case "sc_cookedmeat": {
		_use = true;
		[1,2,0.4] call NAT_fnc_needsUpdate;
		[2,2,0.75] call NAT_fnc_needsUpdate;
	};
	case "sc_cannedfood": {
		if (["zk_canopener"] call NAT_fnc_vInvCheck) then {
			_use = true;
			[1,2,0.25] call NAT_fnc_needsUpdate;
			[2,2,0.25] call NAT_fnc_needsUpdate;
			["zk_e_can",1,true] call NAT_fnc_vInvAdjust;
		};
	};
	case "sc_mre": {
		_use = true;
		[1,2,0.66] call NAT_fnc_needsUpdate;
		[2,2,0.8] call NAT_fnc_needsUpdate;
		[4,1,1] call NAT_fnc_needsUpdate;
	};
	case "zk_cannedfood": {
		if (["zk_canopener"] call NAT_fnc_vInvCheck) then {
			_use = true;
			[1,2,0.25] call NAT_fnc_needsUpdate;
			[2,2,0.25] call NAT_fnc_needsUpdate;
			["zk_e_can",1,true] call NAT_fnc_vInvAdjust;
		};
	};
	case "zk_ricebox": {
		_use = true;
		[1,2,0.15] call NAT_fnc_needsUpdate;
		[2,2,0.3] call NAT_fnc_needsUpdate;
		[4,1,0.8] call NAT_fnc_needsUpdate;
	};
	case "sc_rawmeat": {
		_use = true;
		[1,2,0.35] call NAT_fnc_needsUpdate;
		[2,2,0.8] call NAT_fnc_needsUpdate;
		[7,1,0.075] call NAT_fnc_needsUpdate;
	};
	case "sc_chips": {
		_use = true;
		[1,2,0.15] call NAT_fnc_needsUpdate;
	};
	case "sc_charms": {
		_use = true;
		[1,2,0.05] call NAT_fnc_needsUpdate;
	};
	case "sc_carrot": {
		_use = true;
		[1,2,0.05] call NAT_fnc_needsUpdate;
	};
	case "sc_cereal": {
		_use = true;
		[1,2,0.2] call NAT_fnc_needsUpdate;
		[2,2,0.2] call NAT_fnc_needsUpdate;
	};
	case "sc_corn": {
		_use = true;
		[1,2,0.06] call NAT_fnc_needsUpdate;
	};
	case "sc_human_flesh": {
		_use = true;
		[1,2,0.4] call NAT_fnc_needsUpdate;
		[2,2,0.8] call NAT_fnc_needsUpdate;
		[7,1,0.085] call NAT_fnc_needsUpdate;
	};
	case "sc_potato": {
		_use = true;
		[1,2,0.05] call NAT_fnc_needsUpdate;
	};
	case "sc_salisbury_steak": {
		_use = true;
		[1,2,0.3] call NAT_fnc_needsUpdate;
		[2,2,0.2] call NAT_fnc_needsUpdate;
	};
	case "sc_snack_cakes": {
		_use = true;
		[1,2,0.25] call NAT_fnc_needsUpdate;
		[2,2,0.05] call NAT_fnc_needsUpdate;
	};
	case "sc_donut": {
		_use = true;
		[1,2,0.1] call NAT_fnc_needsUpdate;
	};
	case "sc_snoballs": {
		_use = true;
		[1,2,0.1] call NAT_fnc_needsUpdate;
	};
	case "sc_twinkies": {
		_use = true;
		[1,2,0.1] call NAT_fnc_needsUpdate;
	};
	case "ACE_Banana": {
		_use = true;
		[1,2,0.25] call NAT_fnc_needsUpdate;
		[8,1,0.25] call NAT_fnc_needsUpdate;
	};
	case "sc_candybar": {
		_use = true;
		[1,2,0.05] call NAT_fnc_needsUpdate;
	};
	case "zk_powderedmilk": {
		_use = true;
		[1,2,0.12] call NAT_fnc_needsUpdate;
		[2,2,0.3] call NAT_fnc_needsUpdate;
		[4,1,0.8] call NAT_fnc_needsUpdate;
	};
};
//-----------------------------------
[] call NAT_fnc_vInvUpdate;
_use;
//-----------------------------------