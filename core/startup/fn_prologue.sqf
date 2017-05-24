/*
	fn_prologue
	Author: Sinbane
*/
private ["_group"];
params [
	["_pos",[]]
];

_shorePos = [_pos,0,1000,0,0,1,1] call SIN_fnc_findPos;
_startPos = [_shorePos,1000,3000,100,2] call SIN_fnc_findPos;

_veh = createVehicle ["I_C_Boat_Transport_02_F",_startPos,[],0,"NONE"];
[
	_veh,
	["Black",1],
	true
] call BIS_fnc_initVehicle;
[_veh,true,true,true] call SIN_fnc_emptyVeh;
[_veh] spawn NAT_fnc_pinMarkerVeh;
[_veh,0.4+(random 0.3)] remoteExec ["setFuel",0];
_dir = [_veh, _shorePos] call BIS_fnc_DirTo;
_veh setDir _dir;

//MOVE PLAYERS/AI INTO HOST GROUP
{
	[_x] joinSilent (group player);
} forEach playableUnits;
_aiCount = (4-({isPlayer _x} count playableUnits));
if (_aiCount > 0) then {
	for "_i" from 1 to _aiCount do {
		_unit = [_pos,west,"military",(group player)] call NAT_fnc_spawnUnit;
	};
};
//MOVE GROUP INTO BOAT
{
	if (_x isEqualTo player) then {
		_x moveInDriver _veh;
		_x action ["engineOn", _veh];
	} else {
		_x moveInCargo _veh;
	};
} forEach (units group player);

{
	if (isPlayer _x) then {
		_x setVariable ["NATspawned",true,true];
		[_x] spawn {
			sleep 3;
			["NATnotification",["HINT","PRESS SHIFT+O TO EQUIP EARPLUGS","i"]] remoteExec ["bis_fnc_showNotification",(_this select 0)];
		};
	};
} forEach playableUnits;

[] spawn NAT_fnc_act1;

//-----------------------------------