/*
	fn_weather
	Author: Sinbane
	Main weather controller
*/

_monsoonChance = ["NATmonsoonChance"] call HVP_fnc_getSetting;
_dustStormChance = ["NATdustStormChance"] call HVP_fnc_getSetting;
_tornadoChance = ["NATtornadoChance"] call HVP_fnc_getSetting;

//-----------------------------------
if (DebugMode) then {
	systemChat "DEBUG MODE :: Changing Weather";
	showChat true;
};
//-----------------------------------
(30 * timeMultiplier) setOvercast (random 1);
sleep 30;
(30 * timeMultiplier) setFog (random 0.8);
//-----------------------------------
//-CHECK FOR SPECIAL WEATHER
if (overcast >= 0.7 && overcast < 0.9 && (random 100) < _monsoonChance) then {
	if (DebugMode) then {
		systemChat "DEBUG MODE :: MONSOON INCOMING";
	};
	[(random 360),((random 10)*60),false] spawn NAT_fnc_moonsoon;
};
if (overcast < 0.1) && (random 100) < _dustStormChance) then {
	if (DebugMode) then {
		systemChat "DEBUG MODE :: DUST STORM INCOMING";
	};
	[(random 360),((random 10)*60),false,true] spawn NAT_fnc_dustStorm;
};
if (overcast >= 0.9) && (random 100) < _tornadoChance) then {
	if (DebugMode) then {
		systemChat "DEBUG MODE :: TORNADO INCOMING";
	};
	_pos1 = [[0,0,0],0,999999,0,1] call SIN_fnc_findPos;
	_pos2 = [_pos,1000,5000,0,1] call SIN_fnc_findPos;
	[_pos1,_pos2] spawn NAT_fnc_tornado;
};
//-----------------------------------
_sleepTime = ((random 30)*60);
if (DebugMode) then {
	systemChat format["DEBUG MODE :: Weather sleeping for %1 seconds (%2 minutes)",_sleepTime,(_sleepTime/60)];
	showChat true;
};
sleep _sleepTime;
//-----------------------------------
[] call NAT_fnc_weather;
//-----------------------------------