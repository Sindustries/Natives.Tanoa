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
		if ((random 100) < 80) then {
			_unit addHeadgear (selectRandom NAT_militiaHeadgear);
		};
		if ((random 100) < 50) then {
			_unit addGoggles (selectRandom NAT_militiaGoggles);
		};
		_unit linkItem "ItemCompass";
		_unit linkItem "ItemWatch";
		_unit linkItem "ItemMap";
		_weapons = NAT_militiaWeapons;
		_items = NAT_militiaItems;
		_grenades = NAT_militiaGrenades;
		[_unit,"tacs_Insignia_ZombieOutbreakResponseTeam"] call bis_fnc_setUnitInsignia;
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
		_unit addItem "sc_dogtag";
		_unit addItem "FirstAidKit";
		_unit addItem "FirstAidKit";
		_unit addItem "FirstAidKit";
		_weapons = NAT_militaryWeapons;
		_items = NAT_militaryItems;
		_grenades = NAT_militaryGrenades;
	};
	case "native": {
		_medChance = 5;
		_unit forceAddUniform (selectRandom NAT_nativeUniforms);
		_unit addBackpack (selectRandom NAT_nativeBackpacks);
		if ((random 100) < 25) then {
			_unit addHeadgear (selectRandom NAT_nativeHeadgear);
		};
		if ((random 100) < 50) then {
			_unit addGoggles (selectRandom NAT_nativeGoggles);
		};
		_weapons = NAT_nativeWeapons;
		_items = NAT_nativeItems;
		_unit setFace (selectRandom ["RyanZombieFace1","RyanZombieFace1_Glowing","RyanZombieFace2","RyanZombieFace2_Glowing","RyanZombieFace3","RyanZombieFace3_Glowing","RyanZombieFace4","RyanZombieFace4_Glowing","RyanZombieFace5","RyanZombieFace5_Glowing","RyanZombieFace6","RyanZombieFace6_Glowing"]);

	};
};
//-----------------------------------
if (_wep isEqualTo true && (!(isNil "_weapons"))) then {
	private ["_wepCount","_pistolCount","_weapon","_mags"];
	//COUNT THE WEAPONS
	_wepCount = 0;
	_pistolCount = 0;
	{
		if (_x isKindOf ["Rifle", configFile >> "CfgWeapons"]) then {
			_wepCount = _wepCount + 1;
		};
		if (_x isKindOf ["Pistol", configFile >> "CfgWeapons"]) then {
			_pistolCount = _pistolCount + 1;
		};
	} forEach _weapons;
	//ADD THE WEAPONS
	if (_wepCount > 0) then {
		_weaponFound = false;
		while {!_weaponFound} do {
			_weapon = (selectRandom _weapons);
			if (_weapon isKindOf ["Rifle", configFile >> "CfgWeapons"]) then {
				_weaponFound = true;
				_mags = (getArray (configFile >> "CfgWeapons" >> _weapon >> "magazines"));
				if (count _mags > 0) then {
					_unit addMagazines [(selectRandom _mags),9];
				};
				_unit addWeaponGlobal _weapon;
				_unit addPrimaryWeaponItem "acc_flashlight";
				_unit addPrimaryWeaponItem (selectRandom ["optic_ACO_grn","optic_Aco","optic_Arco_blk_F","optic_Arco_ghex_F","optic_ERCO_blk_F","optic_Holosight","optic_Holosight_blk_F","optic_Holosight_khk_F","optic_Holosight_smg","optic_Holosight_smg_blk_F","optic_MRCO","optic_Hamr","optic_Hamr_khk_F"]);
			};
		};
	};
	if (_pistolCount > 0) then {
		_weaponFound = false;
		while {!_weaponFound} do {
			_weapon = (selectRandom _weapons);
			if (_weapon isKindOf ["Pistol", configFile >> "CfgWeapons"]) then {
				_weaponFound = true;
				_mags = (getArray (configFile >> "CfgWeapons" >> _weapon >> "magazines"));
				if (count _mags > 0) then {
					_unit addMagazines [(selectRandom _mags),5];
				};
				_unit addWeaponGlobal _weapon;
			};
		};
	};
};
if (_type isEqualTo "military") then {
	_unit addWeaponGlobal "binocular";
};
//-----------------------------------
//-MISC ITEMS
if (_medChance > (random 100)) then {
	_unit addItem "zk_bandage";
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
	for "_i" from 0 to (floor (random 3)) do {
		_item = (selectRandom _items);
		if (_item isKindOf ["CA_Magazine", configFile >> "CfgMagazines"]) then {
            _unit addMagazine _item;
        } else {
            _unit addItem _item;
        };
	};
};
[_unit] spawn NAT_fnc_gasMask;
//-----------------------------------