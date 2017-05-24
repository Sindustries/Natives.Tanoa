/*
	MILITIA GEAR LIST
*/

NAT_militiaUniforms = [];
NAT_militiaVests = [];
NAT_militiaBackpacks = [];
NAT_militiaWeapons = [];
NAT_militiaItems = ["sc_disinfectant","sc_potassium","sc_ibuprofen","zk_antibiotic","zk_bandage","FirstAidKit","zk_painKillers","sc_tourniquet","sc_cannedfood","sc_chips","sc_cookedmeat","sc_rawmeat","sc_charms","sc_cereal","sc_salisbury_steak","sc_snack_cakes","sc_donut","sc_snoballs","sc_twinkies","ACE_Banana","sc_candybar","zk_cannedfood","zk_powderedmilk","zk_ricebox","zk_tacticalBacon","sc_juicebox","sc_whiskey","sc_beer","sc_coffee","sc_dirty_water","sc_energy_drink","sc_moonshine","zk_soda2","zk_soda1","zk_waterbottle","zk_tent","zk_wood","sc_toolbox""sc_tape","sc_wires","sc_scrap","sc_battery","sc_bible","sc_carbattery","sc_cigarette","sc_cigarettepack","sc_harmonica","sc_iphone","sc_lighter","sc_axe","sc_guitar","sc_razor","sc_syringe","sc_jumpercables","sc_rope","SC_Item_Crack","SC_Item_Meth","SC_Item_Cocaine","C_Item_Marijuana","zk_canopener","zk_cellphone","zk_e_can","zk_e_fuelcan","sc_fuelcan","zk_hammer","zk_knife","zk_matches","zk_pliers","zk_screwdriver","zk_saw","zk_wrench"];
NAT_militiaGrenades = [];
NAT_militiaHeadgear = [];
NAT_militiaGoggles = [];

//AUTOSORTER _objects = (getItemCargo cursorObject select 0)+(getWeaponCargo cursorObject select 0)+(getMagazineCargo cursorObject select 0)+(getBackpackCargo cursorObject select 0); copytoclipboard str _objects;

_autoSort = ["G_Aviator","G_Balaclava_blk","G_Balaclava_combat","G_Balaclava_lowprofile","G_Balaclava_oli","G_Bandanna_aviator","G_Bandanna_beast","G_Bandanna_blk","H_Bandanna_gry","H_Bandanna_blu","H_Bandanna_cbr","H_Bandanna_khk_hs","G_Bandanna_khk","H_Bandanna_khk","H_Bandanna_mcamo","G_Bandanna_oli","H_Bandanna_sgg","H_Bandanna_sand","G_Bandanna_shades","G_Bandanna_sport","H_Bandanna_surfer","H_Bandanna_surfer_blk","H_Bandanna_surfer_grn","G_Bandanna_tan","H_Bandanna_camo","U_I_C_Soldier_Bandit_4_F","U_I_C_Soldier_Bandit_1_F","U_I_C_Soldier_Bandit_2_F","U_I_C_Soldier_Bandit_5_F","U_I_C_Soldier_Bandit_3_F","H_Watchcap_blk","H_Watchcap_cbr","H_Watchcap_camo","H_Watchcap_khk","H_Cap_grn_BI","H_Cap_blk","H_Cap_blu","H_Cap_blk_CMMG","H_Cap_grn","H_Cap_blk_ION","H_Cap_oli","H_Cap_police","H_Cap_press","H_Cap_red","H_Cap_surfer","H_Cap_tan","H_Cap_khaki_specops_UK","H_Cap_usblack","H_Cap_tan_specops_US","H_Cap_blk_Raven","H_Cap_brn_SPECOPS","G_Combat","G_Combat_Goggles_tna_F","H_HelmetB","H_HelmetB_black","H_HelmetB_camo","tacs_Helmet_Ballistic_DarkBlack","H_HelmetB_desert","H_HelmetB_grass","H_HelmetB_sand","H_HelmetB_snakeskin","H_HelmetB_tna_F","U_FRITH_RUIN_coffdpm","U_FRITH_RUIN_coffgrn","U_FRITH_RUIN_cofftan","U_FRITH_RUIN_sdr_fab_rs","U_FRITH_RUIN_sdr_fab","U_FRITH_RUIN_sdr_fabbrn_rs","U_FRITH_RUIN_sdr_fabbrn","U_FRITH_RUIN_sdr_fabdpm_rs","U_FRITH_RUIN_sdr_fabdpm","U_FRITH_RUIN_sdr_fabgrn_rs","U_FRITH_RUIN_sdr_fabgrn","U_FRITH_RUIN_sdr_fabkak_rs","U_FRITH_RUIN_sdr_fabkak","U_FRITH_RUIN_sdr_fabmtp_rs","U_FRITH_RUIN_sdr_fabmtp","U_FRITH_RUIN_sdr_faboli_rs","U_FRITH_RUIN_sdr_faboli","U_FRITH_RUIN_sdr_fabrus_rs","U_FRITH_RUIN_sdr_fabrus","U_FRITH_RUIN_sdr_fabtan_rs","U_FRITH_RUIN_sdr_fabtan","U_FRITH_RUIN_sdr_ltrdrk_rs","U_FRITH_RUIN_sdr_ltrdrk","U_FRITH_RUIN_sdr_ltrred_rs","U_FRITH_RUIN_sdr_ltrred","U_FRITH_RUIN_sdr_ltr_rs","U_FRITH_RUIN_sdr_ltr","U_FRITH_RUIN_SDR_Tshirt_blk_cyp","U_FRITH_RUIN_SDR_Tshirt_blk_boy","U_FRITH_RUIN_SDR_Tshirt_blk_drj","U_FRITH_RUIN_SDR_Tshirt_oli","U_FRITH_RUIN_SDR_Tshirt_oli_bet","U_FRITH_RUIN_SDR_Tshirt_cry","U_FRITH_RUIN_SDR_Tshirt_wht","U_FRITH_RUIN_SDR_Tshirt_wht_zap","U_FRITH_RUIN_SDR_Tshirt_wht_stk","U_FRITH_RUIN_SDR_Tshirt_wht_fpk","FRITH_ruin_modhat_fabaaf","FRITH_ruin_modhat_fabdes","FRITH_ruin_modhat_fabdpm","FRITH_ruin_modhat_fabflw","FRITH_ruin_modhat_fabmtp","FRITH_ruin_modhat_fabjap","FRITH_ruin_modhat_fabrus","FRITH_ruin_modhat_fabtar","FRITH_ruin_modhat_ltr","FRITH_ruin_modhat_ltrpntblk","FRITH_ruin_modhat_ltrpntgrn","FRITH_ruin_modhat_ltrpntred","FRITH_ruin_modhat_ltrpntwht","FRITH_ruin_vestia_lite_ghm","FRITH_ruin_vestia_lite_grn","FRITH_ruin_vestia_lite_ltr","FRITH_ruin_vestia_lite_nja","FRITH_ruin_vestia_lite_tar","FRITH_ruin_modhat_metgrn","FRITH_ruin_modhat_mettan","U_FRITH_RUIN_offdpm","U_FRITH_RUIN_offgrn","U_FRITH_RUIN_offtan","H_Hat_brown","H_Hat_camo","H_Hat_checker","H_Hat_grey","H_Hat_tan","Mask_M40","Mask_M40_OD","U_I_C_Soldier_Para_2_F","U_I_C_Soldier_Para_3_F","U_I_C_Soldier_Para_5_F","U_I_C_Soldier_Para_4_F","U_I_C_Soldier_Para_1_F","H_RacingHelmet_1_black_F","H_RacingHelmet_1_F","H_RacingHelmet_3_F","H_RacingHelmet_4_F","G_Shades_Black","G_Shades_Blue","G_Shades_Green","G_Shades_Red","H_Shemag_olive","H_Shemag_olive_hs","H_ShemagOpen_tan","H_ShemagOpen_khk","V_BandollierB_cbr","V_BandollierB_rgr","V_BandollierB_khk","V_BandollierB_oli","G_Spectacles","G_Squares_Tinted","G_Squares","H_StrawHat","H_StrawHat_dark","tacs_Uniform_TShirt_JP_BS_LP_BB","tacs_Uniform_TShirt_JP_BS_TP_BB","tacs_Uniform_TShirt_JP_LS_LP_BB","tacs_Uniform_TShirt_JP_GS_LP_BB","tacs_Uniform_TShirt_JP_GS_TP_BB","tacs_Uniform_TShirt_JP_WS_LP_BB","tacs_Goggles_Black","tacs_Goggles_Green","tacs_Goggles_Tan","G_Spectacles_Tinted","TRYK_Kio_Balaclava","TRYK_bandana_g","TRYK_H_Bandana_H","TRYK_H_Bandana_wig","TRYK_H_Bandana_wig_g","TRYK_V_Bulletproof_BLK","TRYK_H_headsetcap_Glasses","TRYK_H_headsetcap_blk_Glasses","TRYK_H_headsetcap_od_Glasses","TRYK_V_IOTV_BLK","TRYK_H_Helmet_WOOD","TRYK_H_pakol2","TRYK_H_pakol","TRYK_H_PASGT_OD","TRYK_H_DELTAHELM_NV","TRYK_R_CAP_BLK","TRYK_R_CAP_TAN","TRYK_R_CAP_OD_US","TRYK_r_cap_blk_Glasses","TRYK_r_cap_od_Glasses","TRYK_r_cap_tan_Glasses","TRYK_Shemagh_mesh","TRYK_Shemagh_G","TRYK_Shemagh","TRYK_Shemagh_EAR_G","TRYK_Shemagh_EAR_TAN","TRYK_Shemagh_ESS_G","TRYK_Shemagh_ESS","TRYK_Shemagh_shade_G","TRYK_Shemagh_shade","TRYK_V_TacVest_coyo","TRYK_H_wig","U_C_WorkerCoveralls","U_C_Poor_1","U_I_G_Story_Protagonist_F","U_B_CombatUniform_mcam_worn","arifle_TRG20_F","arifle_TRG21_F","hgun_ACPC2_F","arifle_AK12_F","arifle_AKM_F","arifle_AKS_F","KA_UMP40","KA_UMP45","KA_UMP9","srifle_DMR_06_camo_F","arifle_Mk20_F","arifle_Mk20_GL_F","arifle_Mk20C_F","Mossberg_590","hgun_PDW2000_F","hgun_Pistol_01_F","srifle_DMR_01_F","hgun_Rook40_F","KICKASS_Sawed_Off_Shotgun","KA_SCAR_L_Black_Hand","arifle_SDAR_F","arifle_KA_SKS_F","SMG_02_F","hgun_Pistol_heavy_02_F","SmokeShellRed","SmokeShell","B_AssaultPack_blk","B_AssaultPack_cbr","B_AssaultPack_dgtl","B_AssaultPack_rgr","B_AssaultPack_ocamo","B_AssaultPack_khk","B_AssaultPack_mcamo","B_AssaultPack_sgg","B_AssaultPack_tna_F","B_Bergen_dgtl_F","B_Bergen_hex_F","B_Bergen_mcamo_F","B_Bergen_tna_F","B_Carryall_cbr","tacs_Backpack_Carryall_DarkBlack","B_Carryall_ghex_F","B_Carryall_ocamo","B_Carryall_khk","B_Carryall_mcamo","B_Carryall_oli","B_Carryall_oucamo","B_FieldPack_blk","B_FieldPack_cbr","B_FieldPack_ghex_F","B_FieldPack_ocamo","B_FieldPack_khk","B_FieldPack_oli","B_FieldPack_oucamo","B_Kitbag_cbr","tacs_Backpack_Kitbag_DarkBlack","B_Kitbag_rgr","B_Kitbag_mcamo","B_Kitbag_sgg","B_TacticalPack_blk","B_TacticalPack_rgr","B_TacticalPack_ocamo","B_TacticalPack_mcamo","B_TacticalPack_oli","TRYK_B_tube_blk","TRYK_B_tube_cyt","TRYK_B_tube_od","B_AssaultPack_Kerry"];

for "_i" from 0 to ((count _autoSort)-1) do {
	//UNIFORMS
	if ((_autoSort select _i) isKindOf ["Uniform_Base", configFile >> "CfgWeapons"]) then {
		NAT_militiaUniforms pushBackUnique (_autoSort select _i);
	};
	//VESTS
	if ((_autoSort select _i) isKindOf ["Vest_NoCamo_Base", configFile >> "CfgWeapons"] || (_autoSort select _i) isKindOf ["Vest_Camo_Base", configFile >> "CfgWeapons"]) then {
		NAT_militiaVests pushBackUnique (_autoSort select _i);
	};
	//BACKPACKS
	if ((_autoSort select _i) isKindOf ["Bag_Base", configFile >> "CfgVehicles"]) then {
		NAT_militiaBackpacks pushBackUnique (_autoSort select _i);
	};
	//HEADGEAR
	if ((_autoSort select _i) isKindof ["HelmetBase", configFile >> "CfgWeapons"] || (_autoSort select _i) isKindOf ["H_HelmetB", configFile >> "CfgWeapons"]) then {
		NAT_militiaHeadgear pushBackUnique (_autoSort select _i);
	};
	//GOGGLES
	if ((_autoSort select _i) isKindOf ["None", configFile >> "CfgGlasses"]) then {
		NAT_militiaGoggles pushBackUnique (_autoSort select _i);
	};
	//WEAPONS
	if ((_autoSort select _i) isKindOf ["Rifle", configFile >> "CfgWeapons"] || (_autoSort select _i) isKindOf ["Pistol", configFile >> "CfgWeapons"]) then {
		NAT_militiaWeapons pushBackUnique (_autoSort select _i);
	};
	//GRENADES
	if ((_autoSort select _i) isKindOf ["CA_Magazine", configFile >> "CfgMagazines"]) then {
		NAT_militiaGrenades pushBackUnique (_autoSort select _i);
	};
	//vITEMS
	if ((_autoSort select _i) in NATvInvItemsOnly && !((_autoSort select _i) in NAT_militiaGrenades)) then {
		NAT_militiaItems pushBackUnique (_autoSort select _i);
	};
};