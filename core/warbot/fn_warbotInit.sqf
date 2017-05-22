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

NATmilitaryForcePower = ["NATmilitaryForcePower"] call NAT_fnc_getSetting;
NATmilitiaForcePower = ["NATmilitiaForcePower"] call NAT_fnc_getSetting;
NATnativeForcePower = ["NATnativeForcePower"] call NAT_fnc_getSetting;

NATmaxUnits = ["NATmaxUnits"] call NAT_fnc_getSetting;
NATmilitaryForce = createGroup WEST;
NATmilitiaForce = createGroup EAST;
NATnativeForce = createGroup RESISTANCE;

if (isServer) then {
	[] call NAT_fnc_warbotZoneCreator;
	[] spawn {
		waitUntil {sleep 5; {isPlayer _x && isTouchingGround _x} count playableUnits isEqualTo playersNumber WEST};
		[] spawn NAT_fnc_warbotZoneMonitor;
		[] spawn NAT_fnc_missionUpdater;
	};
	[] spawn {
		waitUntil {sleep 3; count NATmilitaryCamps > 0 && count NATmilitiaCamps > 0 && count NATnativeCamps > 0};
		_loc = (selectRandom NATmilitaryCamps);
		_base = (_loc select 0);
		[_base,[0,0,0],"military"] spawn NAT_fnc_warbotWave;

		_loc = (selectRandom NATmilitiaCamps);
		_base = (_loc select 0);
		[_base,[0,0,0],"militia"] spawn NAT_fnc_warbotWave;

		_loc = (selectRandom NATnativeCamps);
		_base = (_loc select 0);
		[_base,[0,0,0],"native"] spawn NAT_fnc_warbotWave;
	};
};

NATwarbotLoaded = true;
publicVariable "NATwarbotLoaded";

//-----------------------------------