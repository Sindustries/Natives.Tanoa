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

//AUTOSORTER _objects = (getItemCargo cursorObject select 0)+(getWeaponCargo cursorObject select 0)+(getMagazineCargo cursorObject select 0)+(getBackpackCargo cursorObject select 0); copytoclipboard str _objects;

"sc_mre","sc_candybar","zk_cannedfood","zk_tacticalBacon"
_autoSort = ["tacs_Cap_Headphones_BlackLogo","tacs_Cap_BlackLogo","tacs_Cap_TanLogo","tacs_Cap_Earpiece_BlackLogo","tacs_Cap_Earpiece_TanLogo","tacs_Cap_Backwards_BlackLogo","tacs_Cap_Backwards_TanLogo","tacs_Helmet_Ballistic_DarkBlack","tacs_Hat_Boonie_RangerGreen","tacs_Hat_Boonie_Woodland","tacs_Hat_Boonie_UCP","tacs_Vest_PlateCarrierFull_Black","tacs_Vest_PlateCarrierFull_Green","tacs_Vest_PlateCarrier_Black","tacs_Vest_PlateCarrier_Green","tacs_Vest_Tactical_DarkBlack","G_Balaclava_blk","G_Balaclava_combat","G_Balaclava_lowprofile","G_Balaclava_oli","H_Bandanna_gry","H_Bandanna_cbr","H_Bandanna_khk_hs","H_Bandanna_khk","G_Bandanna_oli","H_Bandanna_sgg","H_Watchcap_blk","H_Booniehat_khk_hs","H_Booniehat_oli","H_Booniehat_tna_F","H_Cap_blk","H_Cap_oli","H_Cap_oli_hs","H_Cap_usblack","Mask_M40","Mask_M40_OD","Mask_M50","TRYK_Kio_Balaclava","TRYK_kio_balaclava_BLK","TRYK_kio_balaclavas","TRYK_kio_balaclava_BLK_ear","TRYK_kio_balaclava_ear","TRYK_kio_balaclava_ESS","TRYK_R_CAP_BLK","TRYK_r_cap_blk_Glasses","TRYK_Shemagh_G","TRYK_Shemagh_ESS_G","tacs_Uniform_Garment_LS_BS_BP_BB","tacs_Uniform_Garment_LS_BS_GP_BB","tacs_Uniform_Garment_LS_OS_EP_TB","tacs_Uniform_Garment_LS_OS_TP_TB","tacs_Uniform_Garment_LS_GS_BP_BB","tacs_Uniform_Garment_LS_GS_GP_BB","tacs_Uniform_Garment_LS_GS_EP_TB","tacs_Uniform_Garment_LS_GS_TP_TB","tacs_Uniform_Garment_LS_ES_BP_BB","tacs_Uniform_Garment_LS_ES_GP_BB","tacs_Uniform_Garment_LS_ES_EP_TB","tacs_Uniform_Garment_LS_TS_BP_BB","tacs_Uniform_Garment_LS_TS_GP_BB","tacs_Uniform_Garment_LS_TS_TP_TB","tacs_Uniform_Garment_RS_BS_BP_BB","tacs_Uniform_Garment_RS_BS_GP_BB","tacs_Uniform_Garment_RS_OS_EP_TB","tacs_Uniform_Garment_RS_OS_TP_TB","tacs_Uniform_Garment_RS_GS_BP_BB","tacs_Uniform_Garment_RS_GS_GP_BB","tacs_Uniform_Garment_RS_GS_EP_TB","tacs_Uniform_Garment_RS_GS_TP_TB","tacs_Uniform_Garment_RS_ES_BP_BB","tacs_Uniform_Garment_RS_ES_GP_BB","tacs_Uniform_Garment_RS_ES_EP_TB","tacs_Uniform_Garment_RS_TS_BP_BB","tacs_Uniform_Garment_RS_TS_GP_BB","tacs_Uniform_Garment_RS_TS_TP_TB","tacs_Uniform_Combat_LS_BS_DGP_BB","tacs_Uniform_Combat_LS_BS_GP_BB","tacs_Uniform_Combat_LS_BS_GP_TB","tacs_Uniform_Combat_LS_BS_TP_BB","tacs_Uniform_Combat_LS_BS_TP_TB","tacs_Uniform_Combat_LS_CDBS_GP_TB","tacs_Uniform_Combat_LS_CLBS_GP_BB","tacs_Uniform_Combat_LS_CLRS_TP_BB","tacs_Uniform_Combat_LS_CPS_BP_BB","tacs_Uniform_Combat_LS_GS_BP_BB","tacs_Uniform_Combat_LS_GS_TP_BB","tacs_Uniform_Combat_LS_TS_BP_BB","tacs_Uniform_Combat_LS_TS_GP_BB","tacs_Uniform_Combat_LS_TS_GP_TB","tacs_Uniform_Combat_RS_BS_GP_BB","tacs_Uniform_Combat_RS_BS_GP_TB","tacs_Uniform_Combat_RS_BS_TP_BB","tacs_Uniform_Combat_RS_BS_TP_TB","tacs_Uniform_Combat_RS_CDBS_GP_TB","tacs_Uniform_Combat_RS_CLBS_GP_BB","tacs_Uniform_Combat_RS_CLRS_TP_BB","tacs_Uniform_Combat_RS_CPS_BP_BB","tacs_Uniform_Combat_RS_GS_BP_BB","tacs_Uniform_Combat_RS_BS_DGP_BB","tacs_Uniform_Combat_RS_GS_TP_BB","tacs_Uniform_Combat_RS_TS_BP_BB","tacs_Uniform_Combat_RS_TS_GP_BB","tacs_Uniform_Combat_RS_TS_GP_TB","tacs_Uniform_TShirt_JP_BS_LP_BB","tacs_Uniform_TShirt_JP_BS_TP_BB","tacs_Uniform_TShirt_JP_LS_LP_BB","tacs_Uniform_TShirt_JP_GS_LP_BB","tacs_Uniform_TShirt_JP_GS_TP_BB","tacs_Uniform_TShirt_JP_WS_LP_BB","tacs_Uniform_Polo_TP_BS_LP_BB","tacs_Uniform_Polo_TP_BS_TP_TB","tacs_Uniform_Polo_TP_LS_GP_BB","tacs_Uniform_Polo_TP_LS_TP_TB","tacs_Uniform_Polo_TP_OS_LP_BB","tacs_Uniform_Polo_TP_OS_TP_BB","tacs_Uniform_Polo_TP_GS_TP_TB","tacs_Uniform_Polo_TP_TS_GP_BB","tacs_Uniform_Polo_TP_WS_LP_BB","tacs_Uniform_Polo_TP_WS_GP_BB","tacs_Uniform_Polo_TP_WS_TP_TB","tacs_Uniform_Polo_CP_BS_TP_BB","tacs_Uniform_Polo_CP_LS_TP_OB","tacs_Uniform_Polo_CP_RS_LP_BB","TRYK_U_B_ARO1_BLK_CombatUniform","TRYK_U_B_ARO1_BLK_R_CombatUniform","TRYK_U_B_ARO1_GR_R_CombatUniform","TRYK_U_B_ARO1_GRY_CombatUniform","TRYK_U_B_ARO1_GRY_R_CombatUniform","TRYK_U_B_ARO2_CombatUniform","TRYK_U_B_ARO2R_CombatUniform","TRYK_U_B_AOR2_BLK_CombatUniform","TRYK_U_B_AOR2_BLK_R_CombatUniform","TRYK_U_B_AOR2_GRY_CombatUniform","TRYK_U_B_AOR2_GRY_R_CombatUniform","TRYK_U_B_AOR2_OD_CombatUniform","TRYK_U_B_AOR2_OD_R_CombatUniform","TRYK_U_B_PCUHsW8","TRYK_U_B_PCUHsW3","TRYK_U_B_PCUHsW9","TRYK_U_B_PCUHsW7","TRYK_U_B_BLKBLK_CombatUniform","TRYK_U_B_BLKBLK_R_CombatUniform","TRYK_U_B_BLKOCP_CombatUniform","TRYK_U_B_BLKOCP_R_CombatUniformTshirt","TRYK_U_B_BLOD_T","TRYK_U_B_BLKTAN_CombatUniform","TRYK_U_B_BLKTANR_CombatUniformTshirt","TRYK_U_B_BLTAN_T","TRYK_U_B_3cr","TRYK_U_B_3c","TRYK_U_B_BLK3CD","TRYK_U_B_BLK3CD_Tshirt","TRYK_U_B_BLKTAN","TRYK_U_B_BLKTAN_Tshirt","TRYK_U_B_BLK","TRYK_U_B_BLK_Tshirt","TRYK_U_B_BLK_OD","TRYK_U_B_BLK_OD_Tshirt","TRYK_U_B_OD_BLK","TRYK_U_B_OD_BLK_2","TRYK_U_B_ODTAN","TRYK_U_B_ODTAN_Tshirt","TRYK_U_B_Sage_Tshirt","TRYK_U_B_BLK_TAN_1","TRYK_U_B_BLK_TAN_2","TRYK_B_TRYK_MTP_T","TRYK_U_Bts_PCUs","TRYK_U_Bts_PCUGs","TRYK_U_Bts_GRYGRY_PCUs","TRYK_U_Bts_UCP_PCUs","TRYK_U_Bts_Wood_PCUs","TRYK_U_Bts_PCUODs","TRYK_U_B_PCUHs","TRYK_U_B_PCUGHs","TRYK_U_B_PCUODHs","TRYK_U_B_PCUGs_BLK_R","TRYK_U_B_PCUGs_gry_R","TRYK_U_B_PCUGs_OD_R","TRYK_U_B_PCUs_R","TRYK_U_B_PCUs","TRYK_U_B_PCUGs","TRYK_U_B_BLK_OD_Rollup_CombatUniform","TRYK_U_B_BLK_tan_Rollup_CombatUniform","TRYK_U_B_wh_blk_Rollup_CombatUniform","TRYK_U_B_wh_OD_Rollup_CombatUniform","TRYK_U_B_wh_tan_Rollup_CombatUniform","TRYK_U_B_Woodland","TRYK_U_B_Woodland_Tshirt","hgun_ACPC2_F","bv_FlashLight","arifle_Katiba_F","arifle_Katiba_C_F","arifle_Katiba_GL_F","srifle_DMR_06_camo_F","Mossberg_590","tacs_MX_GL_BlackCamo","arifle_MX_GL_Black_F","tacs_MX_BlackCamo","arifle_MX_Black_F","srifle_DMR_01_F","arifle_SPAR_01_blk_F","arifle_SPAR_01_GL_blk_F","arifle_SPAR_03_blk_F","SMG_01_F","ACE_M14","ACE_Chemlight_HiOrange","ACE_Chemlight_HiRed","ACE_Chemlight_HiWhite","ACE_Chemlight_HiYellow","ACE_HandFlare_Green","ACE_HandFlare_Red","ACE_HandFlare_White","ACE_HandFlare_Yellow","SmokeShellRed","SmokeShellYellow","tacs_Backpack_AssaultExpanded_Black","tacs_Backpack_AssaultExpanded_Green","tacs_Backpack_AssaultExpanded_Tan","tacs_Backpack_Carryall_DarkBlack","tacs_Backpack_Kitbag_DarkBlack","B_AssaultPack_blk","B_AssaultPack_rgr","B_AssaultPack_tna_F","B_Carryall_ghex_F","B_Carryall_khk","B_Kitbag_rgr","B_Kitbag_mcamo","B_Kitbag_sgg","TRYK_B_Alicepack","TRYK_B_AssaultPack_MARPAT_Desert","TRYK_B_AssaultPack_MARPAT_Wood","TRYK_B_AssaultPack_Type2camo","TRYK_B_AssaultPack_UCP","TRYK_B_Coyotebackpack_BLK","TRYK_B_Carryall_JSDF","TRYK_B_Carryall_blk","TRYK_B_Carryall_wood","TRYK_B_FieldPack_Wood","TRYK_B_Kitbag_aaf","TRYK_B_Kitbag_blk","TRYK_B_Kitbag_Base","TRYK_B_Kitbag_Base_JSDF","TRYK_B_Medbag","TRYK_B_Medbag_BK","TRYK_B_Medbag_OD","TRYK_B_BAF_BAG_BLK","TRYK_B_BAF_BAG_CYT","TRYK_B_BAF_BAG_mcamo","TRYK_B_BAF_BAG_OD","TRYK_B_BAF_BAG_rgr","sc_elasticbandage","sc_morphine","sc_epinephrine","sc_disinfectant","sc_penicillin","sc_potassium","sc_blood","sc_ibuprofen","zk_antibiotic","zk_bandage","FirstAidKit","Medikit","zk_painKillers","sc_tourniquet","sc_energy_drink","zk_f_canteen","zk_waterbottle","sc_bedroll","sc_cigarettepack","sc_cigarette","sc_lighter","sc_boltcutters","sc_tire_iron","sc_transmitter","sc_tire","sc_rope","zk_canopener","ItemGPS","zk_knife","zk_matches","zk_multiMeter","zk_satellitephone","zk_screwdriver"];

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
	//vITEMS
	if ((_autoSort select _i) in NATvInvItemsOnly && !((_autoSort select _i) in NAT_militaryGrenades)) then {
		NAT_militaryItems pushBackUnique (_autoSort select _i);
	};
};