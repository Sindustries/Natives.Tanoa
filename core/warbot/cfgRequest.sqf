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
	0.2,	//SKILL
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
		[["SmokeShell",1],["ACE_HandFlare_White",1]],		//GRENADES
		NAT_militaryUniforms,		//UNIFORMS
		NAT_militaryVests,		//VESTS
		NAT_militaryBackpacks,		//BACKPACKS
		NAT_militaryHeadgear,		//HEADGEAR
		NAT_militaryGoggles,		//GOGGLES
		[]		//LINKED ITEMS
	],
	0.2,	//SKILL
	10,		//FOOD COST
	10		//WATER COST
	],
	[
	"Biohazard",
	[
		["arifle_ARX_blk_F"],		//PRIMARY WEAPONS
		["muzzle_snds_65_TI_blk_F","acc_pointer_IR","optic_ERCO_blk_F","bipod_01_F_blk"],		//PRIMARY WEAPON ITEMS
		["hgun_Rook40_F"],		//SIDEARMS
		["muzzle_snds_L"],		//SIDEARM ITEMS
		[["ACE_M14",3],["ACE_HandFlare_Red",3],["SmokeShellRed",3]],		//GRENADES
		["TRYK_U_B_PCUHsW8","TRYK_U_B_PCUHsW3","TRYK_U_B_PCUHs","TRYK_U_B_PCUGHs","TRYK_U_B_PCUODHs"],		//UNIFORMS
		["V_TacVestIR_blk","tacs_Vest_Tactical_DarkBlack"],		//VESTS
		["TRYK_B_Kitbag_blk","TRYK_B_BAF_BAG_BLK"],		//BACKPACKS
		[],		//HEADGEAR
		["Mask_M40"],		//GOGGLES
		["TRYK_balaclava_NV","TRYK_balaclava_BLACK_NV"]		//LINKED ITEMS
	],
	0.5,	//SKILL
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
	30,		//SCRAP COST
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