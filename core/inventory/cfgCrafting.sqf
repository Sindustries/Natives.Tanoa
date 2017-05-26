/*
	cfgCrafting
	Author: Sinbane
	Crafting master config
*/
//-----------------------------------

/* COOKING */
NATcraftCooking = [
	[
		"sc_cookedmeat",
		[["sc_rawmeat",1]],
		30
	],
	[
		"zk_waterbottle",
		[["sc_dirty_water",1],["zk_WaterPurificationTablets",1]],
		30
	],

];

/* MEDICAL */
NATcraftMedical = [
	[
		"zk_bandage",
		[["sc_cloth",1],["sc_disinfectant",1]],
		20
	],
	[
		"FirstAidKit",
		[["zk_bandage",2],["zk_painKillers",1]],
		40
	],
	[
		"Medikit",
		[["FirstAidKit",2],["sc_morphine",1]],
		60
	]
];

//-----------------------------------
//-NAMES+ICONS!
{
	for "_i" from 0 to (count NATvInvItems)-1 do {
		if ((_x select 0) isEqualTo (NATvInvItems select _i select 1)) then {
			NATcraftCooking set [_forEachIndex,[(NATvInvItems select _i select 0),(_x select 0),(_x select 1),(NATvInvItems select _i select 2),(_x select 2)]];
		};
	};
} forEach NATcraftCooking;
{
	for "_i" from 0 to (count NATvInvItems)-1 do {
		if ((_x select 0) isEqualTo (NATvInvItems select _i select 1)) then {
			NATcraftCooking set [_forEachIndex,[(NATvInvItems select _i select 0),(_x select 0),(_x select 1),(NATvInvItems select _i select 2),(_x select 2)]];
		};
	};
} forEach NATcraftMedical;
//-----------------------------------