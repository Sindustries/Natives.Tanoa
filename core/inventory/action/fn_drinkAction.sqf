/*
   	fn_drinkAction
    Author: Sinbane

    Description:
   	Glug glug
*/
private ["_use"];
params [
	["_item",""]
];
if (_item isEqualTo "") exitWith {};
_use = false;
//-----------------------------------
switch (_item) do {
	case "zk_f_canteen": {
		_use = true;
		[3,2,0.66] call NAT_fnc_needsUpdate;
		[4,2,0.8] call NAT_fnc_needsUpdate;
	};
	case "zk_waterbottle": {
		_use = true;
		[3,2,0.45] call NAT_fnc_needsUpdate;
		[4,2,0.6] call NAT_fnc_needsUpdate;
	};
	case "sc_energy_drink": {
		_use = true;
		[3,2,0.2] call NAT_fnc_needsUpdate;
		[4,1,0.3] call NAT_fnc_needsUpdate;
		[5,2,0.25] call NAT_fnc_needsUpdate;
		[6,2,1.5] call NAT_fnc_needsUpdate;
	};
	case "zk_soda2": {
		_use = true;
		[3,2,0.3] call NAT_fnc_needsUpdate;
		[4,2,0.3] call NAT_fnc_needsUpdate;
		[6,2,0.3] call NAT_fnc_needsUpdate;
	};
	case "zk_soda1": {
		_use = true;
		[3,2,0.3] call NAT_fnc_needsUpdate;
		[4,2,0.3] call NAT_fnc_needsUpdate;
		[6,2,0.3] call NAT_fnc_needsUpdate;
	};
	case "sc_dirty_water": {
		_use = true;
		[3,2,0.15] call NAT_fnc_needsUpdate;
		[7,1,0.05] call NAT_fnc_needsUpdate;
	};
	case "sc_coffee": {
		_use = true;
		[3,2,0.3] call NAT_fnc_needsUpdate;
		[4,1,0.4] call NAT_fnc_needsUpdate;
		[5,2,0.3] call NAT_fnc_needsUpdate;
		[6,1,2] call NAT_fnc_needsUpdate;
	};
	case "sc_beer": {
		_use = true;
		[3,2,0.1] call NAT_fnc_needsUpdate;
		[4,1,0.3] call NAT_fnc_needsUpdate;
	};
	case "sc_whiskey": {
		_use = true;
		[3,2,0.1] call NAT_fnc_needsUpdate;
		[4,1,0.3] call NAT_fnc_needsUpdate;
	};
	case "sc_moonshine": {
		_use = true;
		[3,2,0.1] call NAT_fnc_needsUpdate;
		[4,1,0.3] call NAT_fnc_needsUpdate;
	};
	case "sc_juicebox": {
		_use = true;
		[3,2,0.2] call NAT_fnc_needsUpdate;
		[4,2,0.2] call NAT_fnc_needsUpdate;
	};
};
//-----------------------------------
_use;
//-----------------------------------