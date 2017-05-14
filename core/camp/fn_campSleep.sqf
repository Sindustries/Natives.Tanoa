/*
    fn_campSleep
    Author: Sinbane

    Description:
   	Play sleeps for time chosen
*/
private ["_tent","_caller","_id","_time"];

_obj = _this select 0;
_caller = _this select 1;
_id = _this select 2;
_time = _this select 3 select 0;

//-----------------------------------
//FAILS

if (!isServer) exitWith {
	systemChat "Only the host can do this";
	showChat true;
};

if ({_x distance _obj < 100 && side _x in [EAST,RESISTANCE] && alive _x} count allUnits > 0) exitWith {
	systemChat "You can't sleep now, there are enemies nearby";
	showChat true;
};
if ({isPlayer _x && alive _x && _x distance _obj < 30} count playableUnits != {alive _x && isPlayer _x} count playableUnits) exitWith {
	systemChat "All players must be closer";
	showChat true;
};

//PASS
sleepFnc = {
	_time = _this select 0;

	gameSaved = false;
	player enableSimulationGlobal false;
	player setCaptive true;
	cutText ["", "BLACK OUT", 6];
	sleep 6;
	if (isServer) then {
		skipTime _time;
	};

	/* UPDATE NEEDS */
	_math = (1-((NATneedsHungerTime*_time)/100));
	_value = ((player getVariable ["NATneedsHunger",0])+_math);
	[1,1,_value] call NAT_fnc_needsUpdate;

	_math = (1-((NATneedsThirstTime*_time)/100));
	_value = ((player getVariable ["NATneedsThirst",0])+_math);
	[3,1,_value] call NAT_fnc_needsUpdate;

	_math = (1-((NATneedsSleepTime*_time)/100));
	_value = ((player getVariable ["NATneedsSleep",0])+_math);
	[5,2,_value] call NAT_fnc_needsUpdate;

	_math = (1-((NATneedsRadiationTime*_time)/100));
	_value = ((player getVariable ["NATneedsRadtiation",0])+_math);
	[1,2,_value] call NAT_fnc_needsUpdate;

	if (player getVariable "NATneedsHealthy" isEqualTo true) then {
		if (damage player > 0) then {
			_math = (1-((NATneedsHealthTime*_time)/100));
			_value = ((damage player)+_math);
			player setDamage ((damage player)-_value);
		};
	};

	cutText ["", "BLACK IN", 6];
	sleep 6;
	if (isServer) then {
		gameSaved = [] call NAT_fnc_saveGame;
		publicVariable "gameSaved";
	};
	waitUntil {gameSaved};
	gameSaved = nil;
	player enableSimulationGlobal true;
	player setCaptive false;
};

[_time] remoteExec ["sleepFnc",0];

//-----------------------------------