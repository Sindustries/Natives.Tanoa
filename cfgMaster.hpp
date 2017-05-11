#define true 1
#define false 0
/*
    MASTER CONFIG
*/
class NAT {

/* MAIN SETTINGS */
	NATdebugMode = true;

	NATviewDistance = 1000;			//Default view distance (meters)
	NATtimeMultiplier = 10;			//Default time multiplier

	NATgasMasks[] = { "H_PilotHelmetFighter_B","H_PilotHelmetFighter_O","H_PilotHelmetFighter_I","H_CrewHelmetHeli_B","H_CrewHelmetHeli_O","H_CrewHelmetHeli_I","H_HelmetO_ViperSP_hex_F","H_HelmetO_ViperSP_ghex_F","Mask_M50","Mask_M40","Mask_M40_OD" };

/* VIRTUAL INVENTORY ITEMS :: SYNTAX - ARRAY [DISPLAY NAME,CLASS NAME] */

	vInvItems[] = {
		{ "First Aid Kit","FirstAidKit" },
		{ "Antibiotics", "rb_antibiotic" },
		{ "Bandage", "rb_bandage" },
		{ "Meat (Raw)", "rb_Meat" },
		{ "Meat (Cooked)", "rb_MeatC" },
		{ "Tactical Bacon", "rb_TacticalBacon" },
		{ "Baked Beans", "rb_BakedBeans" },
		{ "Tactical Bacon (Empty)", "rb_TacticalBaconempty" },
		{ "Baked Beans (Empty)", "rb_BakedBeansempty" },
		{ "Bottle (Empty)", "rb_bottle" },
		{ "Bottle (Clean)", "rb_bottleclean" },
		{ "Bottle (Dirty)", "rb_bottledirty" },
		{ "Bottle (Salt)", "rb_bottlesalt" },
		{ "Wood", "rb_WoodPile" },
		{ "Spirit", "rb_Spirit" },
		{ "Franta", "rb_franta" },
		{ "Spirit (Empty)", "rb_Spiritempty" },
		{ "Franta (Empty)", "rb_frantaempty" },
		{ "Can", "rb_oldcan" },
		{ "Redgull", "rb_redgull" },
		{ "Redgull (Empty)", "rb_redgullempty" },
		{ "Hammer", "rb_hammer" },
		{ "Saw", "rb_saw" },
		{ "Wrench", "rb_wrench" },
		{ "Axe", "rb_Axe" },
		{ "Fuelcan (Full)", "rb_Fuelcan" },
		{ "Fuelcan (Empty)", "rb_Fuelcan_empty" },
		{ "Tire", "rb_tire" },
		{ "Duct Tape", "rb_ducttape" },
		{ "Cereal", "rb_cereal" },
		{ "Rice", "rb_RiceBox" },
		{ "Canteen (Clean)", "rb_canteen" },
		{ "Canteen (Dirty)", "rb_canteen_dirty" },
		{ "Canteen (Salt)", "rb_canteen_salt" },
		{ "Canteen (Empty)", "rb_canteen_empty" },
		{ "Matches", "rb_matches" },
		{ "Nails", "rb_nails" },
		{ "Knife", "rb_knife" },
		{ "HandyCam", "rb_HandyCam" },
		{ "Laptop", "rb_Laptop" },
		{ "Mobile Phone", "rb_MobilePhone" },
		{ "Smartphone", "rb_SmartPhone" }
	};


/* WEATHER SETTINGS */

	NATweatherVariation = 0.2;		//Increments of weather change
	NATmonsoonChance = 10;			//Chance (%) of a monsoon if conditions met
	NATdustStormChance = 33;		//Chance (%) of a duststorm if conditions met
	NATtornadoChance = 5;			//Chance (%) of a tornado if conditions met

};

class Z {
	NAT_maxZombies = 12;				//Total number of alive zombies (per player)
	NAT_zhordeSize = 4; 				//Max num to spawn on each spawner
	NAT_zSpawnChance = 75;				//Chance of a spawner spawning zombies (%)
	NAT_zBossChance = 2.5;				//Chance of spawning a boss zombie (demon)
	NAT_zDeleteDist = 300;				//Distance (METERS) from players to remove zombies
};