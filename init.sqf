/*
	NATIVES
	Arma 3 Dynamic Survive & Escape
	Author: Sinbane
*/
//-----------------------------------
NAT_version = "0.0.1-alpha";
publicVariable "NAT_version";
NAT_serverReady = false;
publicVariable "NAT_serverReady";
//-----------------------------------
waitUntil {isPlayer player};
enableSaving [false, false];
enableSentences false;
enableEnvironment false;
player enableSimulation false;
player allowDamage false;
player enableStamina false;
removeAllWeapons player;
removeAllItems player;
removeAllAssignedItems player;
removeUniform player;
removeVest player;
removeBackpack player;
removeHeadgear player;
removeGoggles player;
//-----------------------------------
if ((paramsArray select 1) isEqualTo 0) then {prologueEnabled = true} else {prologueEnabled = false};
//-----------------------------------
NATErrorPos = (getArray(configFile >> "CfgWorlds" >> worldName >> "centerPosition"));
//-----------------------------------
NATzombiesLoaded = false;
HVPBoatsLoaded = false;
NATBoatsLoaded = false;
NATRadObjsLoaded = false;
NATaction = false;
//-----------------------------------
waitUntil {time > 0};
//-----------------------------------
//-GET SETTINGS
if (isServer) then {
	["NAT"] call NAT_fnc_getSettings;
	DebugMode = ["NATdebugMode"] call NAT_fnc_getSetting;
	if (DebugMode isEqualTo 1) then {
		DebugMode = true;
		publicVariable "DebugMode";
	};
	NATgasMasks = ["NATgasMasks"] call NAT_fnc_getSetting;
};
[] call NAT_fnc_vItemInit;
#include "core\gear\civ.sqf";
#include "core\gear\militia.sqf";
#include "core\gear\military.sqf";
#include "core\gear\native.sqf";
//-----------------------------------
//-FIND LOCATIONS
if (isServer) then {
	NAT_mapLocations = [];
	NAT_mapLocationsCities = [];
	NAT_mapLocationsVillages = [];
	NAT_mapLocationsAirports = [];

	{
		NAT_mapLocations pushBackUnique [(locationPosition _x),(size _x)];
		NAT_mapLocationsCities pushBackUnique [(locationPosition _x),(size _x)];
	} forEach nearestLocations [NATErrorPos, ["NameCity","NameCityCapital"], 999999];
	{
		NAT_mapLocations pushBackUnique [(locationPosition _x),(size _x)];
		NAT_mapLocationsVillages pushBackUnique [(locationPosition _x),(size _x)];
	} forEach nearestLocations [NATErrorPos, ["NameVillage"], 999999];
	{
		NAT_mapLocations pushBackUnique [(locationPosition _x),(size _x)];
		NAT_mapLocationsAirports pushBackUnique [(locationPosition _x),(size _x)];
	} forEach nearestLocations [NATErrorPos, ["Airport"], 999999];
	publicVariable "NAT_mapLocations";
	publicVariable "NAT_mapLocationsCities";
	publicVariable "NAT_mapLocationsVillages";
	publicVariable "NAT_mapLocationsAirports";
};
//-----------------------------------
//-TPW init
if (isServer) then {
	[[]] spawn NAT_fnc_tpw_core;
	[10,25,1000,75,60] spawn NAT_fnc_tpw_animals;
};
//-----------------------------------
//-SET TIME OF DAY						setDate [year, month, day, hour, minute]
if (isServer) then {
	_date = numberToDate [(2015+floor(random 20)),random 1];
	setDate [(_date select 0),(_date select 1),(_date select 2),0,0];
	0 setOvercast (random 1);
	0 setFog (random 0.6);
	forceWeatherChange;
	[] spawn NAT_fnc_weather;
	[] spawn {
		while {sunOrMoon isEqualTo 0} do {
			skiptime (1/20);
		};
		NAT_serverReady = true;
		publicVariable "NAT_serverReady";
	};
};
//-----------------------------------
if (isServer) then {
	[] call SIN_fnc_adminInit;
};
//-----------------------------------
cutText ["WAITING FOR SERVER, PLEASE WAIT", "BLACK FADED", 999];
waitUntil {NAT_serverReady isEqualTo true};
cutText ["", "BLACK FADED", 999];
//-----------------------------------
setViewDistance 3000;
_viewDist = ["NATviewDistance"] call NAT_fnc_getSetting;
setObjectViewDistance [_viewDist,(_viewDist/10)];
NAT_safeZones = [];
NAT_clientMarkers = [];
//-----------------------------------
"HVPGasMaskLayer" cutRsc ["equipment_prot","PLAIN",-1,false];
"HVPGasMaskLayer" cutFadeOut 0;
//-----------------------------------
//-INIT LOOT, CARS, BOATS, ZOMBEES! & FURNITURE, RADOBJECTS
("NATHUDpBar" call BIS_fnc_rscLayer) cutRsc ["NATHUDpBar","PLAIN",-1,true];
uiNameSpace getVariable "PBarProgress" ctrlSetTextColor [0.2, 0.5, 0.9, 1];

cutText ["RAISING THE DEAD", "BLACK FADED", 999];
["Z"] call NAT_fnc_getSettings;
[] call z_fnc_init;
if (isServer) then {
	uiSleep 1;
	NATzombiesLoaded = true;
	publicVariable "NATZombiesLoaded";
} else {
	waitUntil {NATzombiesLoaded isEqualTo true};
};
/*
cutText ["LOADING LOOT", "BLACK FADED", 999];
if (isServer) then {
	uiSleep 1;
	[] call HVP_fnc_lootInit;
	HVPLootLoaded = true;
	publicVariable "HVPLootLoaded";
} else {
	waitUntil {HVPLootLoaded isEqualTo true};
};

cutText ["LOADING VEHICLES (LAND)", "BLACK FADED", 999];
if (isServer) then {
	uiSleep 1;
	[] call NAT_fnc_spawnVeh;
	NATCarsLoaded = true;
	publicVariable "NATCarsLoaded";
} else {
	waitUntil {NATCarsLoaded isEqualTo true};
};

cutText ["LOADING VEHICLES (SEA)", "BLACK FADED", 999];
if (isServer) then {
	uiSleep 1;
	[] call NAT_fnc_spawnBoats;
	NATBoatsLoaded = true;
	publicVariable "NATBoatsLoaded";
} else {
	waitUntil {NATBoatsLoaded isEqualTo true};
};
*/
cutText ["LOADING RADIOACTIVE ZONES", "BLACK FADED", 999];
if (isServer) then {
	uiSleep 1;
	[] call NAT_fnc_radInit;
	NATRadObjsLoaded = true;
	publicVariable "NATRadObjsLoaded";
} else {
	waitUntil {NATRadObjsLoaded isEqualTo true};
};

("NATHUDpBar" call BIS_fnc_rscLayer) cutText ["","PLAIN"];
cutText ["", "BLACK FADED", 999];
//-----------------------------------
//-CUSTOM KEYS AND ADDACTIONS
[] spawn {
	waitUntil {!isNull (findDisplay 46)};
	private "_keyHandler";
	_keyHandler = (findDisplay 46) displayAddEventHandler ["KeyDown", {
		[_this select 0,_this select 1,_this select 2,_this select 3,_this select 4] call NAT_fnc_keyHandler;
	}];
};
[] spawn NAT_fnc_addActions;
[] call NAT_fnc_eventHandlers;
//-----------------------------------
[] call NAT_fnc_fuelStation;
//-----------------------------------
//-PLAYER VARIABLES
player setVariable ["NATspawned",false,true];
player setVariable ["NAT_pumpingFuel",false];
//-----------------------------------
//-PLAYER STARTING GEAR
player forceAddUniform (selectRandom NAT_civUniforms);
player linkItem "itemWatch";
player setVariable ["NAT_vInv",[["zk_waterbottle",1],["zk_tacticalBacon",2]],true];
//-----------------------------------
//-BEGIN PROLOGUE
if (isServer) then {
	setTimeMultiplier (["NATtimeMultiplier"] call NAT_fnc_getSetting);
	group player selectLeader player;

	_location = (selectRandom (NAT_mapLocationsCities+NAT_mapLocationsVillages));
	_pos = [(_location select 0),0,(_location select 1 select 0),0,0,0] call SIN_fnc_findPos;
	if (prologueEnabled) then {
		[_pos] spawn NAT_fnc_prologue;
	} else {
		skipTime 0.2;
		{
			if (isPlayer _x) then {
				_x setVariable ["NATspawned", true, true];
				_x setPos _pos;
			};
		} forEach playableUnits;
		player allowDamage true;
		[] spawn NAT_fnc_act1;
	};
};
waitUntil {(player getVariable "NATspawned") isEqualTo true};
//-----------------------------------
enableEnvironment true;
player enableSimulation true;
player enableStamina true;
cutText ["", "BLACK IN", 10];
//-----------------------------------
[] call NAT_fnc_needsInit;
[player] spawn NAT_fnc_gasMask;
[] spawn NAT_fnc_mineDetector;
[] spawn NAT_fnc_handleDamage;
[] spawn NAT_fnc_healthMonitor;
[] spawn NAT_fnc_healthRegen;
[] spawn NAT_fnc_cache;
//-----------------------------------
waitUntil {isTouchingGround player};
setViewDistance (["NATviewDistance"] call NAT_fnc_getSetting);
[] spawn NAT_fnc_locationDisplay;
[] spawn NAT_fnc_radObject;
[] spawn NAT_fnc_radLocation;
//-----------------------------------
sleep 30;
["NATnotification",["HINT","USE SHIFT+I TO OPEN YOUR STATUS MENU","i"]] call bis_fnc_showNotification;