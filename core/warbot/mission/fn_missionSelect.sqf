/*
	fn_missionSelect
	Author: Sinbane
	Opens the strategic map and lets host chose a mission
	[] spawn NAT_fnc_missionSelect;


	[_clearZombiesPos,NAT_fnc_missionClearZombies,"CLEAR ZOMBIES","Cleanse this area from zombie presence","","",1,[_clearZombiesPos]]
*/

if (NATmission) exitWith {};

//-----------------------------------

disableserialization;

_parentDisplay 	= [] call bis_fnc_displayMission;
_mapCenter 	= (getPos player);
_ORBAT 		= [];
_markers 	= [];
_images 	= [];
_overcast 	= overcast;
_isNight 	= (sunOrMoon isEqualTo 0);
_scale		= 1; //0.3;
_simul		= true;

[
findDisplay 46,
_mapCenter,
NATmissionsData,
_ORBAT,
_markers,
_images,
_overcast,
_isNight,
_scale,
_simul
] call Bis_fnc_strategicMapOpen;

//-----------------------------------