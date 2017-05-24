/*
	MILITARY GEAR LIST
*/

NAT_militaryUniforms = [];
NAT_militaryVests = [];
NAT_militaryBackpacks = [];
NAT_militaryWeapons = [];
NAT_militaryMagazines = [];
NAT_militaryItems = ["sc_elasticbandage","sc_morphine","sc_epinephrine","sc_disinfectant","sc_penicillin","sc_potassium","sc_blood","sc_ibuprofen","zk_antibiotic","zk_bandage","FirstAidKit","Medikit","zk_painKillers","sc_tourniquet","sc_energy_drink","zk_f_canteen","zk_waterbottle","sc_bedroll","sc_cigarettepack","sc_cigarette","sc_lighter","sc_boltcutters","sc_tire_iron","sc_transmitter","sc_tire","sc_rope","zk_canopener","ItemGPS","zk_knife","zk_matches","zk_multiMeter","zk_satellitephone","zk_screwdriver"];
NAT_militaryGrenades = [];
NAT_militaryHeadgear = [];
NAT_militaryGoggles = [];

//AUTOSORTER _objects = (getItemCargo cursorObject select 0)+(getWeaponCargo cursorObject select 0)+(getMagazineCargo cursorObject select 0)+(getBackpackCargo cursorObject select 0); copytoclipboard str _objects;

_autoSort = ["G_Aviator","H_Bandanna_gry","H_Bandanna_blu","H_Bandanna_cbr","H_Bandanna_khk_hs","H_Bandanna_khk","H_Bandanna_mcamo","H_Bandanna_sgg","H_Bandanna_sand","H_Bandanna_camo","H_Watchcap_blk","H_Watchcap_camo","H_Beret_blk","tacs_Hat_Boonie_UCP","tacs_Hat_Boonie_Woodland","H_Booniehat_oli","H_Booniehat_tna_F","H_Booniehat_dgtl","H_Cap_grn_BI","H_Cap_blk","tacs_Cap_BlackLogo","H_Cap_blk_CMMG","H_Cap_grn","H_Cap_blk_ION","H_Cap_oli","H_Cap_oli_hs","tacs_Cap_TanLogo","H_Cap_khaki_specops_UK","H_Cap_usblack","H_Cap_blk_Raven","tacs_Cap_Backwards_BlackLogo","tacs_Cap_Earpiece_BlackLogo","tacs_Cap_Headphones_BlackLogo","V_Chestrig_blk","V_Chestrig_rgr","V_Chestrig_khk","V_Chestrig_oli","tacs_Uniform_Garment_LS_BS_BP_BB","tacs_Uniform_Garment_LS_BS_GP_BB","tacs_Uniform_Garment_LS_OS_EP_TB","tacs_Uniform_Garment_LS_OS_TP_TB","tacs_Uniform_Garment_LS_GS_BP_BB","tacs_Uniform_Garment_LS_GS_GP_BB","tacs_Uniform_Garment_LS_GS_EP_TB","tacs_Uniform_Garment_LS_GS_TP_TB","tacs_Uniform_Garment_LS_ES_BP_BB","tacs_Uniform_Garment_LS_ES_GP_BB","tacs_Uniform_Garment_LS_ES_EP_TB","tacs_Uniform_Garment_LS_TS_BP_BB","tacs_Uniform_Garment_LS_TS_GP_BB","tacs_Uniform_Garment_LS_TS_TP_TB","tacs_Uniform_Garment_RS_BS_BP_BB","tacs_Uniform_Garment_RS_BS_GP_BB","tacs_Uniform_Garment_RS_OS_EP_TB","tacs_Uniform_Garment_RS_OS_TP_TB","tacs_Uniform_Garment_RS_GS_BP_BB","tacs_Uniform_Garment_RS_GS_GP_BB","tacs_Uniform_Garment_RS_GS_EP_TB","tacs_Uniform_Garment_RS_GS_TP_TB","tacs_Uniform_Garment_RS_ES_BP_BB","tacs_Uniform_Garment_RS_ES_GP_BB","tacs_Uniform_Garment_RS_ES_EP_TB","tacs_Uniform_Garment_RS_TS_BP_BB","tacs_Uniform_Garment_RS_TS_GP_BB","tacs_Uniform_Garment_RS_TS_TP_TB","H_HelmetB_black","H_HelmetB_camo","tacs_Helmet_Ballistic_DarkBlack","H_HelmetB_grass","H_HelmetB_tna_F","tacs_Uniform_Combat_LS_BS_DGP_BB","tacs_Uniform_Combat_LS_BS_GP_BB","tacs_Uniform_Combat_LS_BS_GP_TB","tacs_Uniform_Combat_LS_BS_TP_BB","tacs_Uniform_Combat_LS_BS_TP_TB","tacs_Uniform_Combat_LS_CDBS_GP_TB","tacs_Uniform_Combat_LS_CLBS_GP_BB","tacs_Uniform_Combat_LS_CLRS_TP_BB","tacs_Uniform_Combat_LS_CPS_BP_BB","tacs_Uniform_Combat_LS_GS_BP_BB","tacs_Uniform_Combat_LS_GS_TP_BB","tacs_Uniform_Combat_LS_TS_BP_BB","tacs_Uniform_Combat_LS_TS_GP_BB","tacs_Uniform_Combat_LS_TS_GP_TB","tacs_Uniform_Combat_RS_BS_GP_BB","tacs_Uniform_Combat_RS_BS_GP_TB","tacs_Uniform_Combat_RS_BS_TP_BB","tacs_Uniform_Combat_RS_BS_TP_TB","tacs_Uniform_Combat_RS_CDBS_GP_TB","tacs_Uniform_Combat_RS_CLBS_GP_BB","tacs_Uniform_Combat_RS_CLRS_TP_BB","tacs_Uniform_Combat_RS_CPS_BP_BB","tacs_Uniform_Combat_RS_GS_BP_BB","tacs_Uniform_Combat_RS_BS_DGP_BB","tacs_Uniform_Combat_RS_GS_TP_BB","tacs_Uniform_Combat_RS_TS_BP_BB","tacs_Uniform_Combat_RS_TS_GP_BB","tacs_Uniform_Combat_RS_TS_GP_TB","U_B_CTRG_1","U_B_CTRG_3","U_B_CTRG_2","U_B_CTRG_Soldier_F","U_B_CTRG_Soldier_3_F","U_B_CTRG_Soldier_2_F","U_B_CTRG_Soldier_urb_1_F","U_B_CTRG_Soldier_urb_3_F","U_B_CTRG_Soldier_urb_2_F","H_HelmetSpecB","H_HelmetSpecB_blk","H_HelmetSpecB_paint1","H_HelmetB_Enh_tna_F","H_HelmetB_light","H_HelmetB_light_black","H_HelmetB_light_grass","H_HelmetB_Light_tna_F","Mask_M40","H_MilCap_ghex_F","H_MilCap_tna_F","H_MilCap_dgtl","H_HelmetIA","acc_flashlight_pistol","tacs_Vest_PlateCarrier_Black","tacs_Vest_PlateCarrier_Green","tacs_Vest_PlateCarrierFull_Black","tacs_Vest_PlateCarrierFull_Green","H_Cap_headphones","V_TacVestIR_blk","G_Shades_Black","G_Shades_Blue","G_Shades_Green","G_Shades_Red","G_Spectacles","G_Squares_Tinted","G_Squares","V_TacChestrig_grn_F","tacs_Uniform_Polo_TP_BS_LP_BB","tacs_Uniform_Polo_TP_BS_TP_TB","tacs_Uniform_Polo_TP_LS_GP_BB","tacs_Uniform_Polo_TP_LS_TP_TB","tacs_Uniform_Polo_TP_OS_LP_BB","tacs_Uniform_Polo_TP_OS_TP_BB","tacs_Uniform_Polo_TP_GS_TP_TB","tacs_Uniform_Polo_TP_TS_GP_BB","tacs_Uniform_Polo_TP_WS_LP_BB","tacs_Uniform_Polo_TP_WS_GP_BB","tacs_Uniform_Polo_TP_WS_TP_TB","tacs_Uniform_Polo_CP_BS_TP_BB","tacs_Uniform_Polo_CP_LS_TP_OB","tacs_Uniform_Polo_CP_RS_LP_BB","G_Tactical_Clear","G_Tactical_Black","V_TacVest_blk","V_TacVest_camo","tacs_Vest_Tactical_DarkBlack","G_Spectacles_Tinted","TRYK_B_TRYK_3C_T","TRYK_U_B_ACU","TRYK_U_B_ACUTshirt","TRYK_U_B_ARO1_CombatUniform","TRYK_U_B_ARO1R_CombatUniform","TRYK_U_B_ARO1_BLK_CombatUniform","TRYK_U_B_ARO1_BLK_R_CombatUniform","TRYK_U_B_ARO1_CBR_CombatUniform","TRYK_U_B_ARO1_CBR_R_CombatUniform","TRYK_U_B_ARO1_GR_CombatUniform","TRYK_U_B_ARO1_GR_R_CombatUniform","TRYK_U_B_ARO1_GRY_CombatUniform","TRYK_U_B_ARO1_GRY_R_CombatUniform","TRYK_U_B_ARO2_CombatUniform","TRYK_U_B_ARO2R_CombatUniform","TRYK_DMARPAT_T","TRYK_C_AOR2_T","TRYK_U_B_AOR2_BLK_CombatUniform","TRYK_U_B_AOR2_BLK_R_CombatUniform","TRYK_U_B_AOR2_GRY_CombatUniform","TRYK_U_B_AOR2_GRY_R_CombatUniform","TRYK_U_B_AOR2_OD_CombatUniform","TRYK_bandana_g","TRYK_H_Bandana_H","TRYK_U_B_BLKBLK_CombatUniform","TRYK_U_B_BLKBLK_R_CombatUniform","TRYK_U_B_BLKOCP_CombatUniform","TRYK_U_B_BLKOCP_R_CombatUniformTshirt","TRYK_U_B_BLOD_T","TRYK_U_B_BLKTAN_CombatUniform","TRYK_U_B_BLKTANR_CombatUniformTshirt","TRYK_U_B_BLTAN_T","TRYK_H_Booniehat_MARPAT_Desert","TRYK_H_Booniehat_MARPAT_WOOD","TRYK_H_Booniehat_JSDF","TRYK_U_B_C01_Tsirt","TRYK_U_B_C02_Tsirt","TRYK_U_B_3cr","TRYK_U_B_3c","TRYK_U_B_BLK3CD","TRYK_U_B_BLK3CD_Tshirt","TRYK_U_B_BLKTAN","TRYK_U_B_BLKTAN_Tshirt","TRYK_U_B_BLK","TRYK_U_B_BLK_Tshirt","TRYK_U_B_BLK_OD","TRYK_U_B_BLK_OD_Tshirt","TRYK_U_B_OD_BLK","TRYK_U_B_OD_BLK_2","TRYK_U_B_ODTAN","TRYK_U_B_ODTAN_Tshirt","TRYK_U_B_Sage_Tshirt","TRYK_U_B_BLK_TAN_1","TRYK_U_B_BLK_TAN_2","TRYK_headset_Glasses","TRYK_H_headsetcap_Glasses","TRYK_H_headsetcap_blk_Glasses","TRYK_H_headsetcap_od_Glasses","TRYK_H_headsetcap_blk","TRYK_H_headsetcap_od","TRYK_H_headsetcap","TRYK_OVERALL_SAGE_BLKboots_nk_blk2","TRYK_OVERALL_nok_flesh","TRYK_OVERALL_SAGE_BLKboots_nk","TRYK_OVERALL_SAGE_BLKboots_nk_blk","TRYK_OVERALL_flesh","TRYK_OVERALL_SAGE","TRYK_OVERALL_SAGE_BLKboots","TRYK_H_AOR1","TRYK_H_AOR2","TRYK_H_GR","TRYK_H_Helmet_MARPAT_Wood","TRYK_H_Helmet_WOOD","TRYK_H_PASGT_BLK","TRYK_R_CAP_BLK","TRYK_R_CAP_OD_US","TRYK_r_cap_blk_Glasses","TRYK_r_cap_od_Glasses","TRYK_r_cap_tan_Glasses","TRYK_Shemagh_mesh","TRYK_Shemagh_G","TRYK_Shemagh","TRYK_Shemagh_EAR_G","TRYK_Shemagh_EAR_TAN","TRYK_Shemagh_ESS_G","TRYK_Shemagh_ESS","TRYK_Shemagh_shade_G","TRYK_Shemagh_shade","TRYK_TAC_EARMUFF_Gs","TRYK_TAC_SET_bn","TRYK_NOMIC_TAC_EARMUFF_Gs","TRYK_TAC_EARMUFF_SHADE_Gs","TRYK_H_TACEARMUFF_H","TRYK_H_Helmet_JSDF","hgun_ACPC2_F","hgun_ACPC2_snds_F","srifle_DMR_07_blk_F","KA_Mk23_black","KA_Mk23_silver","arifle_Katiba_F","arifle_Katiba_GL_F","LMG_03_F","srifle_DMR_03_F","Mossberg_590","SMG_05_F","arifle_SPAR_01_blk_F","arifle_SPAR_01_GL_blk_F","arifle_SPAR_03_blk_F","MMG_02_black_F","arifle_ARX_blk_F","hgun_Pistol_heavy_02_F","1Rnd_HE_Grenade_shell","10Rnd_50BW_Mag_F","UGL_FlareWhite_F","SmokeShellBlue","SmokeShell","1Rnd_SmokeBlue_Grenade_shell","1Rnd_Smoke_Grenade_shell","B_AssaultPack_blk","B_AssaultPack_dgtl","B_AssaultPack_rgr","B_AssaultPack_tna_F","tacs_Backpack_AssaultExpanded_Black","tacs_Backpack_AssaultExpanded_Green","B_Bergen_dgtl_F","B_Bergen_tna_F","tacs_Backpack_Carryall_DarkBlack","B_Carryall_ghex_F","B_Carryall_oli","tacs_Backpack_Kitbag_DarkBlack","B_Kitbag_rgr","B_Kitbag_sgg","B_TacticalPack_blk","B_TacticalPack_rgr","B_TacticalPack_oli","TRYK_B_Alicepack","TRYK_B_AssaultPack_MARPAT_Wood","TRYK_B_AssaultPack_Type2camo","TRYK_B_AssaultPack_UCP","TRYK_B_Coyotebackpack_BLK","TRYK_B_Coyotebackpack_OD","TRYK_B_Carryall_JSDF","TRYK_B_Carryall_blk","TRYK_B_Carryall_wood","TRYK_B_Kitbag_aaf","TRYK_B_Kitbag_blk","TRYK_B_Kitbag_Base","TRYK_B_Medbag_BK","TRYK_B_Medbag_OD","TRYK_B_BAF_BAG_BLK","TRYK_B_BAF_BAG_mcamo","TRYK_B_BAF_BAG_rgr"];

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
		{
			NAT_militaryMagazines pushBackUnique _x;
		} forEach (getArray (configFile >> "CfgWeapons" >> (_autoSort select _i) >> "magazines"));
	};
	//GRENADES
	if ((_autoSort select _i) isKindOf ["CA_Magazine", configFile >> "CfgMagazines"]) then {
		NAT_militaryGrenades pushBackUnique (_autoSort select _i);
	};
	//vITEMS
	if ((_autoSort select _i) in NATvInvItemsOnly && !((_autoSort select _i) in NAT_militaryGrenades)) then {
		NAT_militaryItems pushBackUnique (_autoSort select _i);
	};
};