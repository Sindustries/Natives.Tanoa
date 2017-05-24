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
	NATsealedVehicles[] = { "B_MRAP_01_F","O_T_MRAP_02_ghex_F","I_MRAP_03_F","B_MRAP_01_hmg_F","O_T_MRAP_02_hmg_ghex_F2","I_MRAP_03_hmg_F","B_APC_Tracked_01_CRV_F" };

/* VIRTUAL INVENTORY ITEMS :: SYNTAX - ARRAY [DISPLAY NAME,CLASS NAME] */

	#include "cfgvItems.hpp"

/* NEEDS SETTINGS */

	NATneedsHealthTime = 24;		//Time (in hours) until health is full (if healthy)
	NATneedsHungerTime = 14; 		//Time (in hours) until hunger is full
	NATneedsThirstTime = 12; 		//Time (in hours) until thirst is full
	NATneedsSleepTime = 18; 		//Time (in hours) until sleep is full
	NATneedsRadiationTime = 24; 	//Time (in hours) until radiation is full

/* WARBOT SETTINGS */

	NATmaxUnits = 50;				//Hard cap on the amount of units per side main force
	NATmilitaryForcePower = 10;		//Starting military force power
	NATmilitiaForcePower = 25;		//Starting militia force power
	NATnativeForcePower = 50;		//Starting native force power

/* MISSIONS SETTINGS */

	NATmissionUpdateMin = 1;			//Min time (in-game hours) to update available missions
	NATmissionUpdateMax = 4;			//Max time (in-game hours) to update available missions

	NATclearZombiesChance = 75;			//Chance (%) of CLEAR ZOMBIES mission appearing
	NATrescueCiviliansChance = 45;		//Chance (%) of RESCUE CIVILIANS mission appearing

/* WEATHER SETTINGS */

	NATweatherOvercast = true;		//Overcast enabled?
	NATweatherFog = true;			//Fog enabled?

	NATweatherVariation = 0.2;		//Increments of weather change
	NATmonsoonChance = 10;			//Chance (%) of a monsoon if conditions met
	NATdustStormChance = 33;		//Chance (%) of a duststorm if conditions met
	NATtornadoChance = 5;			//Chance (%) of a tornado if conditions met

};

class Z {
	NAT_zSpawnChance = 75;			//Chance of a spawner spawning zombies (%)
	NAT_zSpawnNum = 6;				//MAX number of zombies spawned per spawner
	NAT_zSpawnDistance = 200;		//Distance (m) a unit must be to a spawner to trigger a spawn
};