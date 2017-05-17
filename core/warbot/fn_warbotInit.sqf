/*
	fn_warbotInit
	Author: Sinbane
	Readies the Dynamic War system
*/
private [];

#include "cfgCompositions.sqf";
#include "cfgRequest.sqf";

NATmilitaryCamps = [];
NATmilitiaCamps = [];
NATnativeCamps = [];
NATcivilianCamps = [];

NATmilitaryZones = [];
NATmilitiaZones = [];
NATnativeZones = [];

NATresFood = 8;
NATresWater = 8;
NATresScrap = 50;

NATmilitaryForce = [];
NATmilitiaForce = [];
NATnativeForce = [];

if (isServer) then {
	[] call NAT_fnc_warbotZoneCreator;
	[] spawn NAT_fnc_warbotZoneMonitor;
};

NATwarbotLoaded = true;
publicVariable "NATwarbotLoaded";

//-----------------------------------