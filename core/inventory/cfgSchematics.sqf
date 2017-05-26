/*
	cfgSchematics
	Author: Sinbane
	Schematic rewards master config
*/
//-----------------------------------

NATschematicRewards = [

/* SPECIAL PURPOSE SUITS */
[
"SPECIAL PURPOSE SUITS",
{
	[missionNamespace,["U_O_V_Soldier_Viper_F","U_O_V_Soldier_Viper_hex_F"],true,false] call BIS_fnc_addVirtualItemCargo;
},
],

/* STEALTH HELMET */
[
"STEALTH COMBAT HELMET",
{
	[missionNamespace,["H_HelmetB_TI_tna_F"],true,false] call BIS_fnc_addVirtualItemCargo;
},
],

/* VIPER HARSNESS */
[
"VIPER HARNESS'",
{
	[missionNamespace,["B_ViperHarness_blk_F","B_ViperHarness_ghex_F","B_ViperHarness_hex_F","B_ViperHarness_khk_F","B_ViperHarness_oli_F"],true,false] call BIS_fnc_addVirtualBackpackCargo;
},
],

/* LIGHT VIPER HARSNESS */
[
"LIGHT VIPER HARNESS'",
{
	[missionNamespace,["B_ViperLightHarness_blk_F","B_ViperLightHarness_ghex_F","B_ViperLightHarness_hex_F","B_ViperLightHarness_khk_F","B_ViperLightHarness_oli_F"],true,false] call BIS_fnc_addVirtualBackpackCargo;
},
],

/* UAV */
[
"UAV BACKPACK AND TERMINAL",
{
	[missionNamespace,["B_UavTerminal"],true,false] call BIS_fnc_addVirtualItemCargo;
	[missionNamespace,["B_UAV_01_backpack_F"],true,false] call BIS_fnc_addVirtualBackpackCargo;
},
],

/* RANGEFINDER */
[
"RANGEFINDER",
{
	[missionNamespace,["Rangefinder"],true,false] call BIS_fnc_addVirtualItemCargo;
},
],

/* NIGHTSTALKER */
[
"NIGHTSTALKER OPTIC",
{
	[missionNamespace,["optic_Nightstalker"],true,false] call BIS_fnc_addVirtualItemCargo;
},
],

/* THERMAL WEAPON OPTICS */
[
"THERMAL WEAPON OPTICS",
{
	[missionNamespace,["optic_tws","optic_tws_mg"],true,false] call BIS_fnc_addVirtualItemCargo;
},
],

/* 4-FIVE PISTOL + ATTACHMENTS */
[
"4-FIVE .45 acp",
{
	[missionNamespace,["hgun_Pistol_heavy_01_F"],true,false] call BIS_fnc_addVirtualWeaponCargo;
	[missionNamespace,["muzzle_snds_acp","acc_flashlight_pistol","optic_MRD"],true,false] call BIS_fnc_addVirtualItemCargo;
	[missionNamespace,(getArray (configFile >> "CfgWeapons" >> "hgun_Pistol_heavy_01_F" >> "magazines")),true,false] call BIS_fnc_addVirtualMagazineCargo;
},
],

/* CAR-95-1 */
[
"CAR 95-1 5.8mm",
{
	[missionNamespace,["arifle_CTARS_blk_F"],true,false] call BIS_fnc_addVirtualWeaponCargo;
	[missionNamespace,(getArray (configFile >> "CfgWeapons" >> "arifle_CTARS_blk_F" >> "magazines")),true,false] call BIS_fnc_addVirtualMagazineCargo;
},
],

/* SPAR-16S 5.56mm */
[
"SPAR-16S 5.56mm",
{
	[missionNamespace,["arifle_SPAR_02_blk_F"],true,false] call BIS_fnc_addVirtualWeaponCargo;
	[missionNamespace,(getArray (configFile >> "CfgWeapons" >> "arifle_SPAR_02_blk_F" >> "magazines")),true,false] call BIS_fnc_addVirtualMagazineCargo;
},
],

/* GM6 LYNX */
[
"GM6 LYNX 12.7mm",
{
	[missionNamespace,["srifle_GM6_F"],true,false] call BIS_fnc_addVirtualWeaponCargo;
	[missionNamespace,["optic_LRPS"],true,false] call BIS_fnc_addVirtualItemCargo;
	[missionNamespace,(getArray (configFile >> "CfgWeapons" >> "srifle_GM6_F" >> "magazines")),true,false] call BIS_fnc_addVirtualMagazineCargo;
},
],

/* LRR */
[
"M320 LRR .408",
{
	[missionNamespace,["srifle_LRR_F"],true,false] call BIS_fnc_addVirtualWeaponCargo;
	[missionNamespace,["optic_LRPS"],true,false] call BIS_fnc_addVirtualItemCargo;
	[missionNamespace,(getArray (configFile >> "CfgWeapons" >> "srifle_LRR_F" >> "magazines")),true,false] call BIS_fnc_addVirtualMagazineCargo;
},
],

/* TRIPWIRE */
[
"TRIPWIRE MINE",
{
	[missionNamespace,["APERSTripMine_Wire_Mag"],true,false] call BIS_fnc_addVirtualMagazineCargo;
},
],

/* REMOTE BOMBS */
[
"REMOTE EXPLOSIVES",
{
	[missionNamespace,["DemoCharge_Remote_Mag","SatchelCharge_Remote_Mag"],true,false] call BIS_fnc_addVirtualMagazineCargo;
},
],

/* RPG-7 */
[
"RPG-7",
{
	[missionNamespace,["launch_RPG7_F"],true,false] call BIS_fnc_addVirtualWeaponCargo;
	[missionNamespace,(getArray (configFile >> "CfgWeapons" >> "launch_RPG7_F" >> "magazines")),true,false] call BIS_fnc_addVirtualMagazineCargo;
},
],

/* GORGON */
[
"AFV-4 GORGON",
{
	NATbaseVehicleRequest pushBackUnique ["AFV-4 Gorgon",["I_APC_Wheeled_03_cannon_F"],450];
	publicVariable "NATbaseVehicleRequest";
},
],

/* MARSHALL */
[
"AMV-7 MARSHALL",
{
	NATbaseVehicleRequest pushBackUnique ["AMV-7 Marshall",["B_APC_Wheeled_01_cannon_F"],500];
	publicVariable "NATbaseVehicleRequest";
},
],

/* GHOST HAWK */
[
"UH-80 GHOST HAWK",
{
	NATbaseVehicleRequest pushBackUnique ["UH-80 Ghost Hawk",["B_Heli_Transport_01_F"],400];
	publicVariable "NATbaseVehicleRequest";
},
]


];

//-----------------------------------