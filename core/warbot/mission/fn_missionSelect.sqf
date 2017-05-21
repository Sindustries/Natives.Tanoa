/*
	fn_missionSelect
	Author: Sinbane
	Opens the strategic map and lets host chose a mission
	[] spawn NAT_fnc_missionSelect;


	[_clearZombiesPos,NAT_fnc_missionClearZombies,"CLEAR ZOMBIES","Cleanse this area from zombie presence","","",1,[_clearZombiesPos]]
*/

if (NATmission) exitWith {};

_missionsData 	= [];
_militiaZones = NATmilitiaZones;
_nativeZones = NATnativeZones;
_civilianZones = NATcivilianZones;

//-----------------------------------
//-SETUP MISSIONS

//CLEAR ZOMBIES
if ((random 100) < 75) then {
	_location = (selectRandom (_civilianZones+_nativeZones));
	_clearZombiesPos = (_location select 1);
	_clearZombiesSize = (_location select 2 select 0);
	_civilianZones = _civilianZones - _location;
	_nativeZones = _nativeZones - _location;
	_missionsData pushBack [_clearZombiesPos,NAT_fnc_missionClearZombies,"CLEAR ZOMBIES","Cleanse this area from zombie presence","","",1,[_clearZombiesPos,_clearZombiesSize]];
};

//-----------------------------------

disableserialization;

_parentDisplay 	= [] call bis_fnc_displayMission;
_mapCenter 	= (getPos player);
_ORBAT 		= [];
_markers 	= [];
_images 	= [];
_overcast 	= overcast;
_isNight 	= (sunOrMoon isEqualTo 0);
_scale		= 0.3;
_simul		= true;

[
findDisplay 46,
_mapCenter,
_missionsData,
_ORBAT,
_markers,
_images,
_overcast,
_isNight,
_scale,
_simul
] call Bis_fnc_strategicMapOpen;

//-----------------------------------