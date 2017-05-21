/*
	cfgRequest
	Author: Sinbane
	Unit & Vehicle master list
*/
//-----------------------------------
/*
	UNITS
	[DISPLAY NAME, GEARLIST, FOOD COST, WATER COST]	- GEARLIST IS core\warbot\cfgGearlist.sqf
	[
	"NAME",
	[
		[],		//PRIMARY WEAPONS
		[],		//PRIMARY WEAPON ITEMS
		[],		//SIDEARMS
		[],		//SIDEARM ITEMS
		[],		//GRENADES
		[],		//UNIFORMS
		[],		//VESTS
		[],		//BACKPACKS
		[],		//HEADGEAR
		[],		//GOGGLES
		[]		//LINKED ITEMS
	],
	30,		//FOOD COST
	30		//WATER COST
	],
*/

NATbaseUnitRequest = [
	[
	"Operator",
	[
		["arifle_SPAR_01_blk_F"],		//PRIMARY WEAPONS
		["acc_flashlight","optic_Holosight_blk_F"],		//PRIMARY WEAPON ITEMS
		["hgun_Rook40_F"],		//SIDEARMS
		[],		//SIDEARM ITEMS
		[["SmokeShell",1]],		//GRENADES
		NAT_militaryUniforms,		//UNIFORMS
		NAT_militaryVests,		//VESTS
		NAT_militaryBackpacks,		//BACKPACKS
		NAT_militaryHeadgear,		//HEADGEAR
		NAT_militaryGoggles,		//GOGGLES
		[]		//LINKED ITEMS
	],
	10,		//FOOD COST
	10		//WATER COST
	],
	[
	"Diver",
	[
		["SMG_05_F"],		//PRIMARY WEAPONS
		["muzzle_snds_L","acc_pointer_IR","optic_Aco"],		//PRIMARY WEAPON ITEMS
		["hgun_Pistol_heavy_01_F"],		//SIDEARMS
		["muzzle_snds_acp","acc_flashlight_pistol","optic_MRD"],		//SIDEARM ITEMS
		[["SmokeShell",1],["SmokeShellBlue",3]],		//GRENADES
		["U_I_Wetsuit","U_O_Wetsuit","U_B_Wetsuit"],		//UNIFORMS
		["V_RebreatherIA","V_RebreatherIR","V_RebreatherB"],		//VESTS
		["tacs_Backpack_AssaultExpanded_Black"],		//BACKPACKS
		[],		//HEADGEAR
		["G_Diving","G_I_Diving","G_O_Diving","G_B_Diving"],		//GOGGLES
		["TRYK_Headset_NV"]		//LINKED ITEMS
	],
	10,		//FOOD COST
	10		//WATER COST
	],
	[
	"Exterminator",
	[
		["Mossberg_590"],		//PRIMARY WEAPONS
		[],		//PRIMARY WEAPON ITEMS
		["KA_Mk23_black"],		//SIDEARMS
		["KA_Mk23_Flashlight"],		//SIDEARM ITEMS
		[["SmokeShell",1],["SmokeShellBlue",3]],		//GRENADES
		["TRYK_T_PAD","TRYK_U_pad_hood_CSATBlk","TRYK_U_pad_hood_Blod","TRYK_U_pad_hood_Blk","TRYK_U_pad_hood_Cl_blk","TRYK_U_pad_hood_BKT2","TRYK_U_nohoodPcu_gry","TRYK_U_pad_hood_odBK","TRYK_U_pad_hood_Cl","TRYK_U_pad_hood_tan","TRYK_hoodie_3c","TRYK_hoodie_FR","TRYK_hoodie_Blk","TRYK_hoodie_Wood","TRYK_U_hood_mc","TRYK_U_hood_nc","TRYK_T_BLK_PAD","TRYK_T_CSAT_PAD","TRYK_T_OD_PAD","TRYK_T_TAN_PAD","TRYK_T_T2_PAD","TRYK_U_denim_hood_3c","TRYK_U_denim_hood_blk","TRYK_U_denim_hood_mc","TRYK_U_denim_hood_nc","TRYK_U_denim_jersey_blk","TRYK_U_denim_jersey_blu","TRYK_U_pad_j_blk","TRYK_U_pad_j","TRYK_T_camo_3c_BG","TRYK_T_camo_desert_marpat_BG","TRYK_T_camo_Wood_BG","TRYK_T_camo_wood_marpat_BG","TRYK_T_camo_3c","TRYK_T_camo_Desert_marpat","TRYK_T_camo_tan","TRYK_T_camo_Wood","TRYK_T_camo_wood_marpat"],		//UNIFORMS
		["TRYK_V_PlateCarrier_blk"],		//VESTS
		[],		//BACKPACKS
		["TRYK_H_PASGT_BLK"],		//HEADGEAR
		["G_Balaclava_TI_G_blk_F"],		//GOGGLES
		["TRYK_Shemagh_G_NV","TRYK_Shemagh_G_NV","TRYK_Shemagh_TAN_NV"]		//LINKED ITEMS
	],
	20,		//FOOD COST
	20		//WATER COST
	],
	[
	"Biohazard",
	[
		["arifle_ARX_blk_F"],		//PRIMARY WEAPONS
		["muzzle_snds_65_TI_blk_F","acc_pointer_IR","optic_ERCO_blk_F","bipod_01_F_blk"],		//PRIMARY WEAPON ITEMS
		["hgun_Pistol_heavy_02_F"],		//SIDEARMS
		["acc_flashlight_pistol"],		//SIDEARM ITEMS
		[["SmokeShell",1],["SmokeShellBlue",3]],	//GRENADES
		["TRYK_U_B_PCUHsW8","TRYK_U_B_PCUHsW3","TRYK_U_B_PCUHs","TRYK_U_B_PCUGHs","TRYK_U_B_PCUODHs"],		//UNIFORMS
		["V_TacVestIR_blk","tacs_Vest_Tactical_DarkBlack"],		//VESTS
		["TRYK_B_Kitbag_blk","TRYK_B_BAF_BAG_BLK"],		//BACKPACKS
		[],		//HEADGEAR
		["Mask_M40"],		//GOGGLES
		["TRYK_balaclava_NV","TRYK_balaclava_BLACK_NV"]		//LINKED ITEMS
	],
	30,		//FOOD COST
	30		//WATER COST
	]
];

//-----------------------------------
/*
	VEHICLES
	[DISPLAY NAME, CLASSNAMES,SCRAP COST]

	[
	"NAME",
	[
		""
	],
	30		//SCRAP COST
	],

*/

NATbaseVehicleRequest = [
[
	"Quad",
	[
		"B_Quadbike_01_F",
		"B_T_Quadbike_01_F",
		"O_Quadbike_01_F",
		"O_T_Quadbike_01_ghex_F",
		"I_Quadbike_01_F",
		"I_G_Quadbike_01_F",
		"C_Quadbike_01_F"
	],
	30		//SCRAP COST
],
[
	"Hatchback",
	[
		"C_Hatchback_01_F"
	],
	60		//SCRAP COST
],
[
	"Offroad (Civilian)",
	[
		"C_Offroad_01_F"
	],
	80		//SCRAP COST
],
[
	"Offroad (Camo)",
	[
		"tacs_Offroad_B_Black",
		"I_G_Offroad_01_F"
	],
	80		//SCRAP COST
],
[
	"MB 4WD",
	[
		"I_C_Offroad_02_unarmed_F"
	],
	80		//SCRAP COST
],
[
	"Truck",
	[
		"I_G_Van_01_transport_F"
	],
	120		//SCRAP COST
],
[
	"Truck (Box)",
	[
		"C_Van_01_box_F"
	],
	145		//SCRAP COST
],
[
	"SUV",
	[
		"C_SUV_01_F"
	],
	70		//SCRAP COST
],
[
	"Zamak",
	[
		"I_Truck_02_covered_F"
	],
	190		//SCRAP COST
],
[
	"Tempest",
	[
		"O_T_Truck_03_covered_ghex_F"
	],
	200		//SCRAP COST
],
[
	"HEMTT",
	[
		"B_Truck_01_covered_F"
	],
	200		//SCRAP COST
],
[
	"Prowler (Unarmed)",
	[
		"B_T_LSV_01_unarmed_F"
	],
	80		//SCRAP COST
],
[
	"Qilin (Unarmed)",
	[
		"O_T_LSV_02_unarmed_F"
	],
	80		//SCRAP COST
],
[
	"Offroad (HMG)",
	[
		"I_G_Offroad_01_armed_F",
		"tacs_Offroad_B_Armed_Black"
	],
	125		//SCRAP COST
],
[
	"Prowler (Armed)",
	[
		"B_T_LSV_01_armed_F"
	],
	130		//SCRAP COST
],
[
	"Qilin (Armed)",
	[
		"O_T_LSV_02_armed_F"
	],
	135		//SCRAP COST
],
[
	"Hunter",
	[
		"B_MRAP_01_F"
	],
	180		//SCRAP COST
],
[
	"Ifrit",
	[
		"O_T_MRAP_02_ghex_F"
	],
	190		//SCRAP COST
],
[
	"Strider",
	[
		"I_MRAP_03_F"
	],
	200		//SCRAP COST
],
[
	"Hunter (HMG)",
	[
		"B_MRAP_01_hmg_F"
	],
	250		//SCRAP COST
],
[
	"Ifrit (HMG)",
	[
		"O_T_MRAP_02_hmg_ghex_F"
	],
	260		//SCRAP COST
],
[
	"Strider (HMG)",
	[
		"I_MRAP_03_hmg_F"
	],
	270		//SCRAP COST
],
[
	"CRV-6e Bobcat",
	[
		"B_APC_Tracked_01_CRV_F"
	],
	300		//SCRAP COST
]
];

//-----------------------------------
/*
	BOATS
	[DISPLAY NAME, CLASSNAMES,SCRAP COST]

	[
	"NAME",
	[
		""
	],
	30,		//SCRAP COST
	],

*/

NATbaseBoatRequest = [
[
	"Jet Ski",
	[
		"C_Scooter_Transport_01_F"
	],
	40		//SCRAP COST
],
[
	"Dinghy",
	[
		"B_Boat_Transport_01_F",
		"B_T_Boat_Transport_01_F",
		"O_Boat_Transport_01_F",
		"O_T_Boat_Transport_01_F",
		"O_G_Boat_Transport_01_F",
		"I_Boat_Transport_01_F",
		"I_G_Boat_Transport_01_F",
		"I_C_Boat_Transport_01_F",
		"C_Rubberboat"
	],
	60		//SCRAP COST
],
[
	"Motorboat",
	[
		"C_Boat_Civil_01_F"
	],
	90		//SCRAP COST
],
[
	"RHIB",
	[
		"I_C_Boat_Transport_02_F",
		"C_Boat_Transport_02_F"
	],
	90		//SCRAP COST
],
[
	"SDV",
	[
		"B_SDV_01_F",
		"O_SDV_01_F",
		"I_SDV_01_F"
	],
	130		//SCRAP COST
],
[
	"Speedboat (Minigun)",
	[
		"B_Boat_Armed_01_minigun_F",
		"B_T_Boat_Armed_01_minigun_F",
		"I_Boat_Armed_01_minigun_F"
	],
	150		//SCRAP COST
],
[
	"Speedboat (HMG)",
	[
		"O_Boat_Armed_01_hmg_F",
		"O_T_Boat_Armed_01_hmg_F"
	],
	175		//SCRAP COST
]
];