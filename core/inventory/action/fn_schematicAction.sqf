/*
   	fn_schematicAction
    Author: Sinbane

    Description:
   	Reads the schematic and awards things
*/
private ["_use","_msg","_baseLocs","_bases"];
params [
	["_item",""]
];
if (_item isEqualTo "") exitWith {false};
if (count NATmilitaryCamps < 1) exitWith {
	systemChat "Use this item again when you have a base available"; showChat true;
	false;
};
_baseLocs = [];
_bases = [];
if (count NATmilitaryCamps > 0) then {
    {_bases pushBack (_x select 1); _baseLocs pushBack (_x select 0)} forEach NATmilitaryCamps;
    _baseLocs = [_baseLocs,[],{player distance _x},"ASCEND"] call BIS_fnc_sortBy;
};
if (player distance2D (_baseLocs select 0) > 10) exitWith {
	systemChat "You must be within 10m of a base to use this item!"; showChat true;
	false;
};

_use = false;
//-----------------------------------
switch (_item) do {
	case "SC_Item_Blueprint": {
		_use = true;

	};
	case "zk_file2": {
		_use = true;

	};
	case "zk_file1": {
		_use = true;

	};
	case "SC_Item_Folder": {
		_use = true;

	};
	case "SC_Item_SDCard": {
		_use = true;

	};
	case "SC_Item_Disc": {
		_use = true;

	};
	case "sc_iphone": {
		_use = true;

	};
	case "sc_usbdrive": {
		_use = true;

	};
	case "zk_laptop": {
		_use = true;

	};
	case "SC_Item_Harddrive": {
		_use = true;

	};
};
//-----------------------------------
if (_use) then {
	if (count NATschematicRewards > 0) then {
		_reward = (selectRandom NATschematicRewards);
		call (_reward select 1);
		NATschematicRewards = NATschematicRewards - _reward;
		publicVariable "NATschematicRewards";
		[format["%1 HAS BEEN UNLOCKED",(_reward select 0)]] remoteExec ["systemChat",0];
	} else {
		systemChat "No more rewards available";
	};
};
_use;
//-----------------------------------