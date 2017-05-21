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

NATcivilianZones = [];
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
	[] spawn {
		waitUntil {sleep 5; {isPlayer _x && isTouchingGround _x} count playableUnits isEqualTo playersNumber WEST};
		[] spawn NAT_fnc_warbotZoneMonitor;
		[] spawn NAT_fnc_missionUpdater;
	};
};

NATwarbotLoaded = true;
publicVariable "NATwarbotLoaded";

//-----------------------------------