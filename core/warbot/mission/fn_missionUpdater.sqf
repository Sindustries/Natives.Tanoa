/*
	fn_missionUpdater
	Author: Sinbane
	Updates available missions periodically
*/

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
	_clearZombiesPos = (_location select 1);
	_clearZombiesSize = (_location select 2 select 0);
	_civilianZones = _civilianZones - _location;
	_nativeZones = _nativeZones - _location;
	NATmissionsData pushBack [_clearZombiesPos,NAT_fnc_missionClearZombies,"CLEAR ZOMBIES","Cleanse this area from zombie presence","","",1,[_clearZombiesPos,_clearZombiesSize]];
};

//-----------------------------------
sleep ((random _maxTime)+_minTime*60*60/timeMultiplier);
[] spawn NAT_fnc_missionUpdater;