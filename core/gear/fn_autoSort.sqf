/*
	fn_autoSort
	Author: Sinbane
	Takes a masterlist of classnames and correctly places them in apprioriate arrays
*/
private [];
params [
	["_autoSort",[]]],
	["_arrays",[]]
];

if (count _autoSort isEqualTo 1 || _arrays isEqualTo 1) exitWith {};
//-----------------------------------
{
	for "_i" from 0 to ((count _autoSort)-1) do {
		//UNIFORMS
		if ((_autoSort select _i) isKindOf ["Uniform_Base", configFile >> "CfgWeapons"]) then {
			NAT_militaryUniforms pushBackUnique (_autoSort select _i);
		};
		//VESTS
		if ((_autoSort select _i) isKindOf ["Vest_NoCamo_Base", configFile >> "CfgWeapons"] || (_autoSort select _i) isKindOf ["Vest_Camo_Base", configFile >> "CfgWeapons"]) then {
			NAT_militaryVests pushBackUnique (_autoSort select _i);
		};
		//BACKPACKS
		if ((_autoSort select _i) isKindOf ["Bag_Base", configFile >> "CfgVehicles"]) then {
			NAT_militaryBackpacks pushBackUnique (_autoSort select _i);
		};
		//HEADGEAR
		if ((_autoSort select _i) isKindof ["HelmetBase", configFile >> "CfgWeapons"] || (_autoSort select _i) isKindOf ["H_HelmetB", configFile >> "CfgWeapons"]) then {
			NAT_militaryHeadgear pushBackUnique (_autoSort select _i);
		};
		//GOGGLES
		if ((_autoSort select _i) isKindOf ["None", configFile >> "CfgGlasses"]) then {
			NAT_militaryGoggles pushBackUnique (_autoSort select _i);
		};
		//WEAPONS
		if ((_autoSort select _i) isKindOf ["Rifle", configFile >> "CfgWeapons"] || (_autoSort select _i) isKindOf ["Pistol", configFile >> "CfgWeapons"]) then {
			NAT_militaryWeapons pushBackUnique (_autoSort select _i);
		};
		//GRENADES
		if ((_autoSort select _i) isKindOf ["CA_Magazine", configFile >> "CfgMagazines"]) then {
			NAT_militaryGrenades pushBackUnique (_autoSort select _i);
		};
	};
} forEach _arrays;

//-----------------------------------