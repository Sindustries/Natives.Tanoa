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
		[]		//LINKED ITEMS,
	],
	30,		//FOOD COST
	30		//WATER COST
	],
*/

NATbaseUnitRequest = [
	[
	"Biohazard",
	[
		["arifle_ARX_blk_F"],		//PRIMARY WEAPONS
		["muzzle_snds_65_TI_blk_F","acc_pointer_IR","optic_ERCO_blk_F","bipod_01_F_blk"],		//PRIMARY WEAPON ITEMS
		["Desert_Eagle"],		//SIDEARMS
		[],		//SIDEARM ITEMS
		[["ACE_M14",3],["ACE_HandFlare_Red",3],["SmokeShellRed",3]],		//GRENADES
		["TRYK_U_B_PCUHs"],		//UNIFORMS
		["V_TacVestIR_blk"],		//VESTS
		["TRYK_B_Kitbag_blk"],		//BACKPACKS
		[],		//HEADGEAR
		["Mask_M40"],		//GOGGLES
		["TRYK_balaclava_NV"]		//LINKED ITEMS
	],
	30,		//FOOD COST
	30		//WATER COST
	],
];

//-----------------------------------
/*
	UNITS
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