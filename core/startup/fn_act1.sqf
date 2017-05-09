/*
	fn_act1
	Author: Sinbane
*/
private ["_spawnPos"];
//-----------------------------------
//-FIND CLOSEST LOCATION & CREATE A DEAD DUDE IN A RANDOM HOUSE
_nearbyLocations = nearestLocations [(getPos player), ["NameCity","NameCityCapital","NameVillage"], 999999, (getPos player)];
_location = (_nearbyLocations select 0);
_locPos = locationPosition _location;
_size = size _location;
_houses = nearestObjects [_locPos, ["Building"], (_size select 0)];
_houseFound = false;
while {!_houseFound} do {
	_house = selectRandom _houses;
	_lootpositions = _house buildingPos -1;
	if (count _lootpositions > 0) then {
		_houseFound = true;
		_spawnPos = selectRandom _lootpositions;
	};
};

_contact = (createGroup WEST) createUnit ["B_Survivor_F", _spawnPos, [], 0, "NONE"];
_contact setDamage 1;
[_contact] call SIN_fnc_emptyUnit;

_contact forceAddUniform (selectRandom NAT_civUniforms);
_contact addBackpack (selectRandom ["TRYK_B_BAF_BAG_OD","TRYK_B_BAF_BAG_BLK","TRYK_B_BAF_BAG_CYT"]);
_contact addMagazines ["KA_dagger_blade",1];
_contact addMagazines ["30Rnd_9x21_Mag_SMG_02", 3];
_contact addWeapon "SMG_05_F";
_contact addPrimaryWeaponItem "muzzle_snds_L";
_contact addPrimaryWeaponItem "acc_flashlight";
_contact addPrimaryWeaponItem "optic_Holosight_blk_F";
_contact addWeapon "KA_dagger";
_contact addWeapon "Binocular";
_contact linkItem "ItemCompass";
_contact linkItem "ItemWatch";
_contact linkItem "ItemRadio";
_contact linkItem "ItemMap";
TASK_ContactNPC = _contact;
//CREATE TASK
TASK_Contact = player createSimpleTask ["Investigate the nearby settlement"];
TASK_Contact setSimpleTaskType "scout";
TASK_Contact setSimpleTaskDescription ["Investigate the settlement, maybe someone knows what the hell just happened", "Investigate", "Investigate"];
TASK_Contact setSimpleTaskDestination _locPos;
TASK_Contact setTaskState "Assigned";
TASK_Contact setSimpleTaskAlwaysVisible true;

waitUntil {sleep 1; player distance _locPos < _size};

TASK_Contact setTaskState "Succeeded";
TASK_Contact2 = player createSimpleTask ["Investigate the corpse"];
TASK_Contact2 setSimpleTaskType "search";
TASK_Contact2 setSimpleTaskDescription ["Investigate the corpse", "Investigate the corpse", "Corpse"];
TASK_Contact2 setSimpleTaskDestination (getPos TASK_ContactNPC);
TASK_Contact2 setTaskState "Assigned";
TASK_Contact2 setSimpleTaskAlwaysVisible true;

TASK1EH = player addEventHandler ["InventoryOpened", {
	private ["_unit","_container"];
	_unit = _this select 0;
	_container = _this select 1;
	if (_container isEqualTo TASK_ContactNPC) exitWith {
		TASK_Contact2 setTaskState "Succeeded";
		player removeEventHandler ["InventoryOpened",TASK1EH];
	};
}];
//-----------------------------------