/*
	fn_equip
	Author: Sinbane
	Equips the unit with correct gear for their class
*/
private ["_medChance","_weapons","_items","_grenades"];
params [
	["_unit",objNull],
	["_type",""],
	["_wep",true]
];
if (_unit isEqualTo objNull || _type isEqualTo "") exitWith {};	//[player,"military",true] call NAT_fnc_equip;
//-----------------------------------
switch (_type) do {
	case "civ": {
		_medChance = 0;
		_unit forceAddUniform (selectRandom NAT_civUniforms);
		_unit linkItem "ItemWatch";
	};
	case "militia": {
		_medChance = 25;
		_unit forceAddUniform (selectRandom NAT_militiaUniforms);
		_unit addBackpack (selectRandom NAT_militiaBackpacks);
		_unit addVest (selectRandom NAT_militiaVests);
		if ((random 100) < 20) then {
			_unit addHeadgear (selectRandom NAT_militiaHeadgear);
		};
		if ((random 100) < 50) then {
			_unit addGoggles (selectRandom NAT_militiaGoggles);
		};
		_unit linkItem "ItemCompass";
		_unit linkItem "ItemWatch";
		_unit linkItem "ItemRadio";
		_unit linkItem "ItemMap";
		_weapons = NAT_militiaWeapons;
		_items = NAT_militiaItems;
		_grenades = NAT_militiaGrenades;
	};
	case "military": {
		_medChance = 50;
		_unit forceAddUniform (selectRandom NAT_militaryUniforms);
		_unit addBackpack (selectRandom NAT_militaryBackpacks);
		_unit addVest (selectRandom NAT_militaryVests);
		if ((random 100) < 80) then {
			_unit addHeadgear (selectRandom NAT_militaryHeadgear);
		};
		if ((random 100) < 50) then {
			_unit addGoggles (selectRandom NAT_militaryGoggles);
		};
		_unit linkItem "ItemCompass";
		_unit linkItem "ItemWatch";
		_unit linkItem "ItemRadio";
		_unit linkItem "ItemMap";
		_weapons = NAT_militaryWeapons;
		_items = NAT_militaryItems;
		_grenades = NAT_militaryGrenades;
	};
};
//-----------------------------------
if (_wep isEqualTo true && (!(isNil "_weapons"))) then {
	private ["_weapon","_mags"];
	//ADD THE WEAPONS
	_weaponFound = false;
	while {!_weaponFound} do {
		_weapon = (selectRandom _weapons);
		if (_weapon isKindOf ["Rifle", configFile >> "CfgWeapons"]) then {
			_weaponFound = true;
			_mags = (getArray (configFile >> "CfgWeapons" >> _weapon >> "magazines"));
			if (count _mags > 0) then {
				_unit addMagazines [(selectRandom _mags),3];
			};
			_unit addWeaponGlobal _weapon;
			_unit addPrimaryWeaponItem (selectRandom ["acc_flashlight","acc_pointer_IR"]);
			if (_type isEqualTo "military") then {
				_unit addPrimaryWeaponItem (selectRandom ["optic_Aco","optic_Arco_blk_F","optic_ERCO_blk_F","optic_Holosight","optic_Holosight_blk_F","optic_Holosight_khk_F","optic_MRCO","optic_Hamr","optic_Hamr_khk_F"]);
			};
		};
	};
	_weaponFound = false;
	while {!_weaponFound} do {
		_weapon = (selectRandom _weapons);
		if (_weapon isKindOf ["Pistol", configFile >> "CfgWeapons"]) then {
			_weaponFound = true;
			_mags = (getArray (configFile >> "CfgWeapons" >> _weapon >> "magazines"));
			if (count _mags > 0) then {
				_unit addMagazines [(selectRandom _mags),2];
			};
			_unit addWeaponGlobal _weapon;
		};
	};
};
//-----------------------------------
//-MISC ITEMS
if (_medChance > (random 100)) then {
	_unit addItem "FirstAidKit";
	if (_medChance > (random 100)) then {
		_unit addItem "RyanZombiesAntiVirusTemporary_Item";
	};
};
if (!(isNil "_grenades")) then {
	for "_i" from 0 to floor(random 3) do {
		_unit addMagazines [(selectRandom _grenades),floor(random 2)];
	};
};
if (!(isNil "_items")) then {
	for "_i" from 0 to ((count (_items)-1)) do {
		if ((random 100) < 50) then {
			player additem (selectRandom _items);
		};
	};
};
[_unit] spawn NAT_fnc_gasMask;
//-----------------------------------