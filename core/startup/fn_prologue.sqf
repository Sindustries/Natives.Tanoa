/*
	fn_prologue
	Author: Sinbane
*/
private ["_group"];
params [
	["_pos",[]]
];

_shorePos = [_pos,0,1000,0,0,1,1] call SIN_fnc_findPos;
_target = createVehicle ["Land_HelipadEmpty_F", _shorePos, [], 0, "CAN_COLLIDE"];
_startPos = [_shorePos,1000,3000,100,2] call SIN_fnc_findPos;

_veh = createVehicle ["I_C_Boat_Transport_02_F",_startPos,[],0,"NONE"];
[
	_veh,
	["Black",1],
	true
] call BIS_fnc_initVehicle;
[_veh,true,true,true] call SIN_fnc_emptyVeh;
[_veh] spawn NAT_fnc_pinMarkerVeh;
[_veh,0.2+(random 0.3)] remoteExec ["setFuel",0];
_veh setDir (getDir _target);

_aiCount = (4-({isPlayer _x} count playableUnits));
_group = [_shorePos,west,"military",_aiCount] call NAT_fnc_createGroup;
if (count units _group < 1) then {
	_group = createGroup WEST;
};

//JOINALL
{
	if (isPlayer _x) then {
		[_x] joinSilent _group;
	};
} forEach playableUnits;

_group selectLeader player;
player moveInDriver _veh;

{
	if (isPlayer _x) then {
		_x setVariable ["NATspawned", true, true];
		_x enableSimulationGlobal true;
	};
	_x moveInCargo _veh;
} forEach (units _group);

player action ["engineOn", _veh];

deleteVehicle _target;
{
	if (isPlayer _x) then {
		[_x] spawn {
			sleep 3;
			["NATnotification",["HINT","PRESS SHIFT+O TO EQUIP EARPLUGS","i"]] remoteExec ["bis_fnc_showNotification",(_this select 0)];
		};
	};
} forEach playableUnits;

[_group] spawn NAT_fnc_act1;

//-----------------------------------