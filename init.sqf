/*
	NATIVES
	Arma 3 Dynamic Survive & Escape
	Author: Sinbane
*/
if (isServer) then {
	//-----------------------------------
	NAT_version = "0.0.1-alpha";
	publicVariable "NAT_version";
	NAT_serverReady = false;
	publicVariable "NAT_serverReady";
	//-----------------------------------
	diag_log "----------------------------------------------------------------------------------------------------";
	diag_log "--------------------------------------- NATVIES SERVER INIT ----------------------------------------";
	diag_log "----------------------------------------------------------------------------------------------------";
	//-----------------------------------
	//-GET SETTINGS
	["NAT"] call NAT_fnc_getSettings;
	DebugMode = ["NATdebugMode"] call NAT_fnc_getSetting;
	if (DebugMode isEqualTo 1) then {
		DebugMode = true;
		publicVariable "DebugMode";
	};
	NATgasMasks = ["NATgasMasks"] call NAT_fnc_getSetting;
	//-----------------------------------
	//-SET TIME OF DAY						setDate [year, month, day, hour, minute]
	setDate numberToDate [(2015+floor(random 20)),random 1];
	setTimeMultiplier 0;
	//-----------------------------------
	//-FIND LOCATIONS
	diag_log "-- FINDING LOCATIONS --";
	NAT_cities = [];
	NAT_villages = [];
	NAT_local = [];
	{
		if (type _x isEqualTo "NameCityCapital" || type _x isEqualTo "NameCity") then {
			NAT_cities pushBack [(text _x),(locationPosition _x),(size _x)];
		};
		if (type _x isEqualTo "NameVillage") then {
			NAT_villages pushBack [(text _x),(locationPosition _x),(size _x)];
		};
		if (type _x isEqualTo "NameLocal") then {
			NAT_local pushBack [(text _x),(locationPosition _x),(size _x)];
		};
	} forEach nearestLocations [[0,0,0], ["NameCity","NameCityCapital","NameLocal","NameMarine","NameVillage"], 100000];
	publicVariable "NAT_cities";
	publicVariable "NAT_villages";
	publicVariable "NAT_local";
	diag_log "-- COMPLETE --";
	//-----------------------------------
	//-TPW init
	[[]] spawn NAT_fnc_tpw_core;
	[10,600,2,[50,250,500],0] spawn NAT_fnc_tpw_air;
	[10,25,1000,75,60] spawn NAT_fnc_tpw_animals;
	//-----------------------------------
	setTimeMultiplier (["NATtimeMultiplier"] call NAT_fnc_getSetting);
	[] spawn NAT_fnc_weather;
	[] call SIN_fnc_adminInit;
	//-----------------------------------
	NAT_serverReady = true;
	publicVariable "NAT_serverReady";
	//-----------------------------------
	diag_log "----------------------------------------------------------------------------------------------------";
	diag_log "----------------------------------- NATIVES SERVER INIT COMPLETE  ----------------------------------";
	diag_log "----------------------------------------------------------------------------------------------------";
};
//-----------------------------------
diag_log "----------------------------------------------------------------------------------------------------";
diag_log "--------------------------------------- NATIVES CLIENT INIT ----------------------------------------";
diag_log "----------------------------------------------------------------------------------------------------";
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
waitUntil {time > 0};
//-----------------------------------
cutText ["WAITING FOR SERVER, PLEASE WAIT", "BLACK FADED", 999];
waitUntil {NAT_serverReady isEqualTo true};
cutText ["", "BLACK FADED", 999];
diag_log "-- SERVER READY, PREPARING.. --";
//-----------------------------------
NAT_safeZones = [];
NAT_clientMarkers = [];
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
//-----------------------------------
[] call NAT_fnc_fuelStation;
//-----------------------------------
//-PLAYER VARIABLES
player setVariable ["NATspawned",false,true];
player setVariable ["NAT_pumpingFuel",false];
//-----------------------------------
//-BEGIN PROLOGUE
if (isServer) then {
	_pos = [[0,0,0],0,999999,0,0,0] call SIN_fnc_findPos;
	[_pos] spawn NAT_fnc_prologue;
};
waitUntil {(player getVariable "NATspawned") isEqualTo true};
//-----------------------------------
//enableSaving [false, true];
enableEnvironment true;
player enableSimulation true;
player enableStamina true;
cutText ["", "BLACK IN", 10];
//-----------------------------------
diag_log "----------------------------------------------------------------------------------------------------";
diag_log "--------------------------------- WILDLANDS CLIENT INIT COMPLETE  ----------------------------------";
diag_log "----------------------------------------------------------------------------------------------------";
//-----------------------------------