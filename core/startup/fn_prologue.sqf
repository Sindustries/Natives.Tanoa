/*
	fn_prologue
	Author: Sinbane
*/
private [];
params [
	["_pos",[]]
];

_heliLandPos = [_pos,1800,3600,0] call SIN_fnc_findPos;
_helipad = createVehicle ["Land_HelipadEmpty_F", _heliLandPos, [], 0, "NONE"];

//-----------------------------------
//-PLAYER STARTING GEAR

{
	if (isPlayer _x) then {
		_x forceAddUniform (selectRandom NAT_civUniforms);
		//_x linkItem "itemMap";
		_x linkItem "itemWatch";
	};
} forEach allUnits;

//-----------------------------------
//-HELICOPTER & CREW

_heli = createVehicle ["O_Heli_Light_02_unarmed_F",[(_pos select 0),(_pos select 1),500],[],0,"FLY"];
[
	_heli,
	["Blue",1],
	["Proxy",0,"Missiles_revolving",0,"AddCargoHook_COver",0]
] call BIS_fnc_initVehicle;

[_heli,true,true] call SIN_fnc_emptyVeh;

//_heli flyInHeight 300+(random 200);
_heli setDir ((getPos _heli) getDir _heliLandPos);

_heligroup = createGroup WEST;
_pilot = _heligroup createUnit ["B_Helipilot_F", [5,5,5], [], 0, "NONE"];
_pilot setcaptive true;
_pilot setskill 0;
_pilot disableAI "TARGET";
_pilot disableAI "AUTOTARGET";

removeAllWeapons _pilot;
removeAllItems _pilot;
removeAllAssignedItems _pilot;
removeUniform _pilot;
removeVest _pilot;
removeBackpack _pilot;
removeHeadgear _pilot;
removeGoggles _pilot;
_pilot forceAddUniform (selectRandom NAT_civUniforms);
_pilot addHeadgear "TRYK_H_EARMUFF";
_pilot addGoggles "TRYK_headset_Glasses";

_heligroup setBehaviour "CARELESS";
_heligroup setCombatMode "BLUE";
_heligroup allowfleeing 0;
_heli lock true;
_heli allowDamage false;
_pilot allowDamage false;
_pilot assignAsDriver _heli;

_pilot moveindriver _heli;
_pilot doMove _heliLandPos;
_heligroup setSpeedMode "FULL";

//-----------------------------------
//-MOVE PLAYERS INSIDE

{
	if (isPlayer _x) then {
		[_x] call ace_hearing_fnc_putInEarplugs;
		_x assignAsCargo _heli;
		_x moveInCargo _heli;
		_x enableSimulationGlobal true;
		_x setVariable ["NATspawned", true, true];
	};
} forEach allUnits;

//-----------------------------------
//-WAIT UNTIL IN POSITION

waitUntil {_heli distance2D _helipad < 400};
[_heliPad,_heli] spawn NAT_fnc_gravity_ray;
waitUntil {(damage _heli) > 0};
[] spawn {
	{cutText ["", "WHITE OUT", 4]; sleep 4; enableEnvironment false} remoteExec ["bis_fnc_call", 0];
};
sleep 5;
//-----------------------------------
//-FIND A CRASH SITE

if (isServer) then {
	_crashSite = [(getPos _heli),0,1000,0] call SIN_fnc_findPos;
	_heli setDamage 1;
	_pilot setDamage 1;
	_heli setPos _crashSite;
	{
		if (isPlayer _x) then {
			[_x] call ace_hearing_fnc_removeEarplugs;
			_pos = [_crashSite,3,70] call SIN_fnc_findPos;
			_x setPos _pos;
			_x setDir (random 360);
			_x enableSimulationGlobal false;
		};
	} forEach allUnits;
};

sleep 10;
//-----------------------------------
//-WAKING UP

{
	if (isPlayer _x) then {
		{
			player enableSimulationGlobal true;
			player removeItems "ACE_earPlugs";
			player setUnconscious true;
			sleep 4;
			cutText ["", "WHITE IN", 4];
			enableEnvironment true;
			sleep 6;
			player setUnconscious false;
			player allowDamage true;

			if (primaryWeapon player isEqualTo "" && secondaryWeapon player isEqualTo "" && handgunWeapon player isEqualTo "") then {
				player addWeapon "hgun_P07_F";
				sleep 0.1;
				player removeWeapon "hgun_P07_F";
			};
			[] spawn NAT_fnc_locationDisplay;
		} remoteExec ["bis_fnc_call", _x];
	};
} forEach allUnits;

//-----------------------------------
//-ACT 1
sleep 20;
[] remoteExec ["NAT_fnc_act1",0];
//-----------------------------------