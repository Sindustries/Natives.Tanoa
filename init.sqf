/*
	NATIVES
	Arma 3 Dynamic Survive & Escape
	Author: Sinbane
*/
//-----------------------------------
NAT_version = "0.2.5-alpha";
NAT_authors = "Sinbane";
NAT_serverReady = false;
//-----------------------------------
waitUntil {isPlayer player};
enableSaving [false, false];
//enableSentences false;
0 fadeSound 0;
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
NATErrorPos = (getArray(configFile >> "CfgWorlds" >> worldName >> "centerPosition"));
//-----------------------------------
NATzombiesLoaded = false;
NATwarbotLoaded = false;
NATRadObjsLoaded = false;
NATaction = false;
NATmission = false;
NATpinnedGroups = [];
//-----------------------------------
waitUntil {time > 0};
[] call NAT_fnc_init;
//-----------------------------------