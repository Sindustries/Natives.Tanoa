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

	#include "cfgvItems.hpp"

/* NEEDS SETTINGS */

	NATneedsHealthTime = 24;		//Time (in hours) until health is full (if healthy)
	NATneedsHungerTime = 18; 		//Time (in hours) until hunger is full
	NATneedsThirstTime = 12; 		//Time (in hours) until thirst is full
	NATneedsSleepTime = 16; 		//Time (in hours) until sleep is full
	NATneedsRadiationTime = 24; 	//Time (in hours) until radiation is full

/* MISSIONS SETTINGS */

	NATmissionUpdateMin = 1;			//Min time (in-game hours) to update available missions
	NATmissionUpdateMax = 4;			//Max time (in-game hours) to update available missions

	NATclearZombiesChance = 75;			//Chance (%) of CLEAR ZOMBIES mission appearing

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