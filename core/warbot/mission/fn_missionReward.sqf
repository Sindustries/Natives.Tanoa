/*
	fn_missionReward
	Author: Sinbane
	Rewards food, water and/or scrap and notifies all players
*/
params [
	["_food",0],
	["_water",0],
	["_scrap",0]
];

//-----------------------------------
if (_food > 0 || _water > 0 || _scrap > 0) then {
	"MISSION COMPLETE - ITEMS SALVGED:" remoteExec ["systemChat",0];
};
//-----------------------------------
if (_food > 0) then {
	NATresFood = NATresFood + _food;
	publicVariable "NATresFood";
	_message = format["FOOD: %1",_food];
	_message remoteExec ["systemChat",0];
	true remoteExec ["showChat"];
};
//-----------------------------------
if (_water > 0) then {
	NATresWater = NATresWater + _water;
	publicVariable "NATresWater";
	_message = format["WATER: %1",_water];
	_message remoteExec ["systemChat",0];
	true remoteExec ["showChat"];
};
//-----------------------------------
if (_scrap > 0) then {
	NATresScrap = NATresScrap + _scrap;
	publicVariable "NATresScrap";
	_message = format["SCRAP: %1",_scrap];
	_message remoteExec ["systemChat",0];
	true remoteExec ["showChat"];
};
//-----------------------------------