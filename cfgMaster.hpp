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


/* MAIN SETTINGS */

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