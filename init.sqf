/*
	NATIVES
	Arma 3 Dynamic Survive & Escape
	Author: Sinbane
*/
//-----------------------------------
NAT_version = "0.0.1-alpha";
NAT_serverReady = false;
publicVariable "NAT_serverReady";
//-----------------------------------
waitUntil {isPlayer player};
enableSaving [false, false];
enableSentences false;
enableEnvironment false;
player enableSimulation false;
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
private ["_startPoint"];
_startPoint = (paramsArray select 1);
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
if (DebugMode) then {systemChat format["%1 version %2",briefingName,NAT_version]};
//-----------------------------------
//-FIND LOCATIONS
private ["_startPos"];
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
	if (worldName isEqualTo "Tanoa") then {
		_startPos = [[10000,10000,0],4500];
	};
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
[] spawn NAT_fnc_cache;
[] call NAT_fnc_needsInit;
[] call NAT_fnc_warbotInit;
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
[player,"military",true] call NAT_fnc_equip;
player setVariable ["NAT_vInv",[["zk_f_canteen",1],["sc_mre",2],["sc_carbattery",100],["sc_wires",3],["zk_wrench",3],["zk_pliers",3],["sc_tire",100],["sc_tire_iron",100],["FirstAidKit",1]],true];
//-----------------------------------
[] spawn NAT_fnc_dynObjMonitor;
[] spawn NAT_fnc_mineDetector;
[] call NAT_fnc_handleDamage;
[] spawn NAT_fnc_healthMonitor;
[] spawn NAT_fnc_healthRegen;
//-----------------------------------
//-BEGIN PROLOGUE
cutText ["PREPARING GAME, PLEASE WAIT", "BLACK FADED", 999];
if (isServer) then {
	private ["_location"];
	setTimeMultiplier (["NATtimeMultiplier"] call NAT_fnc_getSetting);
	if (!(isNil "_startPos")) then {
		_loc = (selectRandom (nearestLocations [(_startPos select 0), ["NameCity","NameCityCapital","NameVillage"], (_startPos select 1)]));
		_location = [(locationPosition _loc),(size _loc)];
	} else {
		_location = (selectRandom (NAT_mapLocationsCities+NAT_mapLocationsVillages));
	};
	_pos = [(_location select 0),0,(_location select 1 select 0),0,0,0] call SIN_fnc_findPos;
	if (_startPoint isEqualTo 0) then {
		[_pos] spawn NAT_fnc_prologue;
	};
	if (_startPoint isEqualTo 1) then {
		skipTime 0.2;
		_aiCount = (8-({isPlayer _x} count playableUnits));
		_groupMil = [_pos,west,"military",_aiCount,0.2] call NAT_fnc_createGroup;
		{
			if (isPlayer _x) then {
				[_x] joinSilent _groupMil;
			};
		} forEach playableUnits;
		{
			if (isPlayer _x) then {
				_x setVariable ["NATspawned", true, true];
				_x allowDamage true;
			};
			_x setPos _pos;
		} forEach (units _groupMil);
		[_groupMil] spawn NAT_fnc_act1;
	};
	if (_startPoint isEqualTo 2) then {
		skipTime 2;
		_campPos = [_pos] call NAT_fnc_findBasePos;
		[_campPos,"military",6] call NAT_fnc_createBase;
		_aiCount = (8-({isPlayer _x} count playableUnits));
		_groupMil = [_campPos,west,"military",_aiCount,0.2] call NAT_fnc_createGroup;
		{
			if (isPlayer _x) then {
				[_x] joinSilent grpNull;
				_x setPos _pos;
				_x setVariable ["NATspawned", true, true];
				_x allowDamage true;
			};
		} forEach playableUnits;
		{
			_x setPos _pos;
		} forEach (units _groupMil);
		[_campPos,_groupMil] spawn NAT_fnc_act2;
	};
};
waitUntil {(player getVariable "NATspawned") isEqualTo true};
//-----------------------------------
enableEnvironment true;
player enableSimulation true;
player enableStamina true;
cutText ["", "BLACK IN", 10];
//-----------------------------------
waitUntil {isTouchingGround player};
setViewDistance (["NATviewDistance"] call NAT_fnc_getSetting);
[] spawn NAT_fnc_locationDisplay;
[] spawn NAT_fnc_radObject;
[] spawn NAT_fnc_radLocation;
//-----------------------------------
sleep 30;
["NATnotification",["HINT","PRESS F1 TO OPEN YOUR STATUS MENU","i"]] call bis_fnc_showNotification;