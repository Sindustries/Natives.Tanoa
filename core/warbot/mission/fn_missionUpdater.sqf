/*
	fn_missionUpdater
	Author: Sinbane
	Updates available missions periodically
*/

NATmissionsData	= [];

_minTime = ["NATmissionUpdateMin"] call NAT_fnc_getSetting;
_maxTime = ["NATmissionUpdateMax"] call NAT_fnc_getSetting;

_militiaZones = NATmilitiaZones;
_nativeZones = NATnativeZones;
_civilianZones = NATcivilianZones;

//-----------------------------------
//-SETUP MISSIONS

//CLEAR ZOMBIES
if ((random 100) < (["NATclearZombiesChance"] call NAT_fnc_getSetting)) then {
	_location = (selectRandom (_civilianZones+_nativeZones));
	_pos = (_location select 1);
	_size = (_location select 2 select 0);
	_civilianZones = _civilianZones - _location;
	_nativeZones = _nativeZones - _location;
	NATmissionsData pushBack [_pos,{[_this select 9] spawn NAT_fnc_missionClearZombies},"CLEAR ZOMBIES","Cleanse this area from zombie presence","","",1,[_pos,_size]];
};

//RESCUE CIVILIANS
if ((random 100) < (["NATrescueCiviliansChance"] call NAT_fnc_getSetting)) then {
	_location = (selectRandom (_militiaZones+_nativeZones));
	_pos = (_location select 1);
	_size = (_location select 2 select 0);
	_militiaZones = _militiaZones - _location;
	_nativeZones = _nativeZones - _location;
	NATmissionsData pushBack [_pos,{[_this select 9] spawn NAT_fnc_missionRescueCivilians},"RESCUE CIVILIANS","Intel suggests there is a small group of civilians being held captive here, rescue them","","",1,[_pos,_size]];
};

//-----------------------------------
sleep ((random _maxTime)+_minTime*60*60/timeMultiplier);
[] spawn NAT_fnc_missionUpdater;