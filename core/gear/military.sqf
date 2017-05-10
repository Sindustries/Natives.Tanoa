/*
	MILITARY GEAR LIST
*/

NAT_militaryUniforms = [];
NAT_militaryVests = [];
NAT_militaryBackpacks = [];
NAT_militaryWeapons = [];
NAT_militaryItems = [];
NAT_militaryGrenades = [];
NAT_militaryHeadgear = [];
NAT_militaryGoggles = [];

//AUTOSORTER _objects = (getItemCargo cursorObject)+(getWeaponCargo cursorObject)+(getMagazineCargo cursorObject)+(getBackpackCargo cursorObject); copytoclipboard str _objects;

_autoSort = [
"G_Balaclava_blk","G_Balaclava_combat","G_Balaclava_lowprofile","G_Balaclava_oli","H_Booniehat_oli","H_Booniehat_tna_F","H_Cap_oli","V_PlateCarrier1_rgr_noflag_F","V_PlateCarrier2_rgr_noflag_F","U_B_T_Soldier_F","U_B_T_Soldier_AR_F","G_Combat","G_Combat_Goggles_tna_F","H_HelmetB","H_HelmetB_camo","H_HelmetB_grass","H_HelmetB_tna_F","H_HelmetSpecB","H_HelmetSpecB_paint1","H_HelmetB_Enh_tna_F","H_HelmetB_light","H_HelmetB_light_grass","H_HelmetB_Light_tna_F","G_Lowprofile","H_HelmetIA","U_I_C_Soldier_Para_2_F","U_I_C_Soldier_Para_3_F","U_I_C_Soldier_Para_5_F","U_I_C_Soldier_Para_4_F","U_I_C_Soldier_Para_1_F","V_TacVest_blk","V_TacVest_camo","V_TacVest_oli","TRYK_U_B_ARO2_CombatUniform","TRYK_U_B_ARO2R_CombatUniform","TRYK_U_B_AOR2_BLK_CombatUniform","TRYK_U_B_AOR2_BLK_R_CombatUniform","TRYK_U_B_AOR2_GRY_CombatUniform","TRYK_U_B_AOR2_GRY_R_CombatUniform","TRYK_U_B_AOR2_OD_CombatUniform","TRYK_U_B_AOR2_OD_R_CombatUniform","TRYK_Kio_Balaclava","TRYK_kio_balaclava_BLK","TRYK_U_B_MARPAT_Wood_Tshirt","TRYK_U_B_MARPAT_Wood","TRYK_U_B_MARPAT_WOOD_CombatUniform","TRYK_U_B_MARPAT_WOOD_CombatUniformTshirt","TRYK_B_TRYK_OCP_D_T","TRYK_B_TRYK_OCP_T","TRYK_U_B_PCUODs","TRYK_U_B_PCUGs_OD","TRYK_U_B_AOR2_Rollup_CombatUniform","TRYK_U_B_Woodland","TRYK_U_B_Woodland_Tshirt","hgun_ACPC2_F","KA_axe","arifle_Katiba_F","KA_knife","arifle_SPAR_01_blk_F","arifle_ARX_blk_F","SmokeShellBlue","SmokeShellGreen","SmokeShellYellow","ACE_Chemlight_HiRed","ACE_HandFlare_Red","B_Kitbag_rgr","B_Kitbag_sgg","TRYK_B_Coyotebackpack_BLK","TRYK_B_Coyotebackpack_OD","TRYK_B_Kitbag_Base_JSDF","Mask_M50","Mask_M40","Mask_M40_OD"
];

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