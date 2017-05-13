/*
	NATIVE GEAR LIST
*/

NAT_nativeUniforms = [];
NAT_nativeVests = [];
NAT_nativeBackpacks = [];
NAT_nativeWeapons = [];
NAT_nativeItems = [];
NAT_nativeGrenades = [];
NAT_nativeHeadgear = [];
NAT_nativeGoggles = [];

//AUTOSORTER _objects = (getItemCargo cursorObject select 0)+(getWeaponCargo cursorObject select 0)+(getMagazineCargo cursorObject select 0)+(getBackpackCargo cursorObject select 0); copytoclipboard str _objects;

_autoSort = ["G_Bandanna_beast","G_Bandanna_blk","H_Bandanna_gry","H_Bandanna_blu","H_Bandanna_cbr","G_Bandanna_khk","H_Bandanna_khk","H_Bandanna_mcamo","G_Bandanna_oli","H_Bandanna_sgg","H_Bandanna_sand","H_Bandanna_surfer","H_Bandanna_surfer_blk","H_Bandanna_surfer_grn","G_Bandanna_tan","H_Bandanna_camo","U_I_C_Soldier_Bandit_4_F","U_I_C_Soldier_Bandit_1_F","U_I_C_Soldier_Bandit_2_F","U_I_C_Soldier_Bandit_5_F","U_I_C_Soldier_Bandit_3_F","U_C_Man_casual_2_F","U_C_Man_casual_3_F","U_C_Man_casual_1_F","U_C_Poloshirt_blue","U_C_Poloshirt_burgundy","U_C_Poloshirt_redwhite","U_C_Poloshirt_salmon","U_C_Poloshirt_stripped","U_C_Poloshirt_tricolour","U_OrestesBody","H_Shemag_olive","U_C_man_sport_1_F","U_C_man_sport_3_F","U_C_man_sport_2_F","U_C_Man_casual_6_F","U_C_Man_casual_4_F","U_C_Man_casual_5_F","TRYK_H_ghillie_top_green","optic_Aco","U_C_Journalist","U_Marshal","KA_crossbow_black","KA_crossbow_wood","SmokeShellRed","TRYK_B_tube_blk","TRYK_B_tube_cyt","TRYK_B_tube_od","sc_rawmeat","sc_human_flesh","sc_cookedmeat","sc_dirty_water","sc_moonshine","sc_scrap","sc_baseball","sc_basketball","sc_book","sc_rock","sc_tincan","sc_meth","sc_green_goo","sc_red_goo","sc_skull","zk_knife","SC_Item_SealedContainer"];

for "_i" from 0 to ((count _autoSort)-1) do {
	//UNIFORMS
	if ((_autoSort select _i) isKindOf ["Uniform_Base", configFile >> "CfgWeapons"]) then {
		NAT_nativeUniforms pushBackUnique (_autoSort select _i);
	};
	//VESTS
	if ((_autoSort select _i) isKindOf ["Vest_NoCamo_Base", configFile >> "CfgWeapons"] || (_autoSort select _i) isKindOf ["Vest_Camo_Base", configFile >> "CfgWeapons"]) then {
		NAT_nativeVests pushBackUnique (_autoSort select _i);
	};
	//BACKPACKS
	if ((_autoSort select _i) isKindOf ["Bag_Base", configFile >> "CfgVehicles"]) then {
		NAT_nativeBackpacks pushBackUnique (_autoSort select _i);
	};
	//HEADGEAR
	if ((_autoSort select _i) isKindof ["HelmetBase", configFile >> "CfgWeapons"] || (_autoSort select _i) isKindOf ["H_HelmetB", configFile >> "CfgWeapons"]) then {
		NAT_nativeHeadgear pushBackUnique (_autoSort select _i);
	};
	//GOGGLES
	if ((_autoSort select _i) isKindOf ["None", configFile >> "CfgGlasses"]) then {
		NAT_nativeGoggles pushBackUnique (_autoSort select _i);
	};
	//WEAPONS
	if ((_autoSort select _i) isKindOf ["Rifle", configFile >> "CfgWeapons"] || (_autoSort select _i) isKindOf ["Pistol", configFile >> "CfgWeapons"]) then {
		NAT_nativeWeapons pushBackUnique (_autoSort select _i);
	};
	//GRENADES
	if ((_autoSort select _i) isKindOf ["CA_Magazine", configFile >> "CfgMagazines"]) then {
		NAT_nativeGrenades pushBackUnique (_autoSort select _i);
	};
	//vITEMS
	if ((_autoSort select _i) in NATvInvItemsOnly && !((_autoSort select _i) in NAT_nativeGrenades)) then {
		NAT_nativeItems pushBackUnique (_autoSort select _i);
	};
};