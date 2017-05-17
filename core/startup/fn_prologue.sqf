/*
	fn_prologue
	Author: Sinbane
*/
private [];
params [
	["_pos",[]]
];

_heliLandPos = [_pos,2000,3600,0] call SIN_fnc_findPos;
_helipad = createVehicle ["Land_HelipadEmpty_F", _heliLandPos, [], 0, "CAN_COLLIDE"];

//-----------------------------------
//-HELICOPTER & CREW

_heli = createVehicle ["O_Heli_Light_02_unarmed_F",[(_pos select 0),(_pos select 1),500],[],0,"FLY"];
[
	_heli,
	["Black",1],
	["Proxy",0,"Missiles_revolving",0,"AddCargoHook_COver",0]
] call BIS_fnc_initVehicle;

//_heli flyInHeight 300+(random 200);
_heli setDir ((getPos _heli) getDir _heliLandPos);

_heligroup = createGroup WEST;
_pilot = _heligroup createUnit ["B_Helipilot_F", [5,5,5], [], 0, "NONE"];
_pilot setcaptive true;
_pilot setskill 0;
_pilot disableAI "TARGET";
_pilot disableAI "AUTOTARGET";

[_pilot] call NAT_fnc_Unequip;
[_pilot,"military",false] call NAT_fnc_Equip;
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

[_heli,true,true] call SIN_fnc_emptyVeh;

sleep 3;

//-----------------------------------
//-MOVE PLAYERS INSIDE

_aiCount = (8-({isPlayer _x} count playableUnits));
_groupMil = [_heliLandPos,west,"military",_aiCount,0.2] call NAT_fnc_createGroup;

{
	if (!isPlayer _x && (group _x) isEqualTo _groupMil) then {
		_x assignAsCargo _heli;
		_x moveInCargo _heli;
		_x allowDamage false;
	};
	if (isPlayer _x) then {
		_x assignAsCargo _heli;
		_x moveInCargo _heli;
		_x enableSimulationGlobal true;
		[_x] joinSilent _groupMil;
		_x setVariable ["NATspawned", true, true];
		[_x] spawn {
			sleep 3;
			["NATnotification",["HINT","PRESS SHIFT+O TO EQUIP EARPLUGS","i"]] remoteExec ["bis_fnc_showNotification",(_this select 0)];
		}
	};
} forEach allUnits;

//-----------------------------------
//-WAIT UNTIL IN POSITION

waitUntil {_heli distance2D _helipad < 1400};
[_heliPad,_heli] spawn NAT_fnc_gravity_ray;

[_heli] spawn {
	_heli = _this select 0;
	sleep 10;
	if (damage _heli isEqualTo 0 && alive _heli) then {
		_heli setDamage 0.97;
	};
};

waitUntil {(damage _heli) > 0};
_pilot setDamage 1;

{
	unassignVehicle _x;
	_x action ["Eject",vehicle _x];
} forEach (units _groupMil);

{
	sleep (random 2);
	cutText ["", "WHITE OUT", 0];
	waitUntil {(getPos player select 2) < 10};
	enableEnvironment false;
} remoteExec ["bis_fnc_call", 0];

_fire = createVehicle ["test_EmptyObjectForSmoke", (getPos _heli),[], 0, "NONE"];
_fire attachTo [_heli, [0,0,0.7]];
_sparks1 = createSoundSource ["Sound_SparklesWreck1", (getPos _heli), [], 0];
_sparks2 = createSoundSource ["Sound_SparklesWreck2", (getPos _heli), [], 0];
_sparks1 attachTo [_heli];
_sparks2 attachTo [_heli];

[_heli] spawn {
	waitUntil {isTouchingGround (_this select 0)};
	[(_this select 0),"vehicle_collision"] remoteExec ["say3D", 0];
};

[_heli,_sparks1,_sparks2,_fire] spawn {
	private ["_alarm","_sparks1","_sparks2","_fire"];
	_pod = _this select 0;
	_sparks1 = _this select 1;
	_sparks2 = _this select 2;
	_fire = _this select 3;
	sleep 180+(random 300);
	{deleteVehicle _x;} forEach (_fire getVariable ["effects", []]);
	deleteVehicle _fire;
	deleteVehicle _sparks1;
	deleteVehicle _sparks2;
};

sleep 3;
//-----------------------------------
//-FIND A CRASH SITE

{
	if (alive _x) then {
		if (surfaceIsWater (getPos _x)) then {
			_shore = [(getPos (leader (group _x))),0,100,2,0,1,1] call SIN_fnc_findPos;
			_pos = [_shore,0,50] call SIN_fnc_findPos;
			_x setPos _pos;
			_x setDir (random 360);
		} else {
			_pos = [(getPos _x),0,50,3] call SIN_fnc_findPos;
			_x setPos _pos;
		};
		_x enableSimulationGlobal false;
	};
} forEach (units _groupMil);

sleep 3;
//-----------------------------------
//-WAKING UP		player switchmove "Acts_UnconsciousStandUp_part1"

{
	if (isPlayer _x) then {
		{
			player enableSimulationGlobal true;
			player setUnconscious true;
			player allowDamage true;
			sleep 6;
			cutText ["", "WHITE IN", 4];
			enableEnvironment true;
			sleep 4;
			player setUnconscious false;

			if (primaryWeapon player isEqualTo "" && secondaryWeapon player isEqualTo "" && handgunWeapon player isEqualTo "") then {
				player addWeapon "hgun_P07_F";
				sleep 0.1;
				player removeWeapon "hgun_P07_F";
			};
		} remoteExec ["bis_fnc_call", _x];
	} else {
		_x enableSimulationGlobal true;
		_x setUnconscious true;
		_x allowDamage true;
		[_x] spawn {
			sleep 10;
			(_this select 0) setUnconscious false;
		};
	};
} forEach (units _groupMil);

sleep 1;

{
	if (isPlayer) then {
		_x setDamage 0.2;
	};
} forEach allUnits;

//-----------------------------------
//-ACT 1
sleep 20;
if (isServer) then {
	[_groupMil] spawn NAT_fnc_act1;
};
//-----------------------------------