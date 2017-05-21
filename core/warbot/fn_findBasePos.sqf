/*
	fn_findCampPos
	Author: Sinbane
	Finds a random location
*/
private ["_maxDist","_posFound","_return"];
//-----------------------------------
params [
    ["_pos",[]],
    ["_maxBaseDist",500]
];

_errorPos = (getArray(configFile >> "CfgWorlds" >> worldName >> "centerPosition"));
_maxDist = 50;

//-----------------------------------

_posFound = false;
while {!_posFound} do {
	_return = [_pos,0,_maxDist,30,0,0.15,0] call BIS_fnc_findSafePos;
	if ((_return select 0) != (_errorPos select 0) && (_return select 1) != (_errorPos select 1)) then {
		_nearestBase = [_return,"all"] call NAT_fnc_findNearestBase;
		if (_return distance _nearestBase >= _maxBaseDist) then {
			_posFound = true;
		};
	} else {
		_maxDist = _maxDist + 100;
	};
};

_return;

//-----------------------------------