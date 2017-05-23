/*
	fn_warbotWave
	Author: Sinbane
	Controls the overall struggle for the map

	>> I feel this is very ineffecient.. will come back to this.
	Any tips? let me know, please.
*/
private ["_base","_zone1","_zone2","_zone3","_side"];
params [
	["_faction",""],
	["_lastPos",nil]
];

if (_faction isEqualTo "") exitWith {systemChat "FATAL ERROR IN fn_warbotWave"; showChat true};

//-----------------------------------
//-FIND NEAREST ENEMY ZONE

_targets = [];

switch (_faction) do {
	case "military": {
		if (isNil "_lastPos") then {
			_loc = (selectRandom NATmilitaryCamps);
			_base = (_loc select 0);
		} else {
			_base = [(_lastPos select 1),"military"] call NAT_fnc_findNearestBase;
		};
		if (count NATmilitiaZones > 0) then {

			if (isNil "_lastPos") then {
				_zone1 = [_base,"militia"] call NAT_fnc_findNearestZone;
			} else {
				_zone1 = [(_lastPos select 1),"militia"] call NAT_fnc_findNearestZone;
			};
		};
		if (count NATnativeZones > 0) then {
			if (isNil "_lastPos") then {
				_zone2 = [_base,"native"] call NAT_fnc_findNearestZone;
			} else {
				_zone2 = [(_lastPos select 1),"native"] call NAT_fnc_findNearestZone;
			};
		};
		if (count NATcivilianZones > 0) then {
			if (isNil "_lastPos") then {
				_zone3 = [_base,"civilian"] call NAT_fnc_findNearestZone;
			} else {
				_zone3 = [(_lastPos select 1),"civilian"] call NAT_fnc_findNearestZone;
			};
		};
		_side = WEST;
	};
};

if (!(isNil "_zone1")) then {
	_targets pushBackUnique _zone1;
};
if (!(isNil "_zone2")) then {
	_targets pushBackUnique _zone2;
};
if (!(isNil "_zone3")) then {
	_targets pushBackUnique _zone3;
};

_targets = [_targets,[],{_base distance (_x select 1)},"ASCEND"] call BIS_fnc_sortBy;
_targetZone = (_targets select 0);
_targetPos = (_targetZone select 1);

//-----------------------------------
//-REINFORCE & ATTACK

_aMarkername = format["warbotObjective%1",_faction];
_aMarker = createMarker [_aMarkername,_targetPos];
_aMarker setMarkerShape "ICON";
_aMarker setMarkerSize [0.75,0.75];
_aMarker setMarkerAlpha 0;

switch (_faction) do {
	case "military": {
		if (count units NATmilitaryForce < 1) then {
			NATmilitaryForce = createGroup WEST;
			NATmilitaryForce setGroupIdGlobal ["Main Force"];
		};
		while {count units NATmilitaryForce < NATmilitaryForcePower} do {
			_pos = [_base,0,75,4] call SIN_fnc_findPos;
			_unit = [_pos,west,"military",NATmilitaryForce] call NAT_fnc_spawnUnit;
		};
		[NATmilitaryForce] remoteExec ["NAT_fnc_pinMarker",0];
		[NATmilitaryForce] call NAT_fnc_clearWaypoints;
		_wp = [_targetPos,0,(_targetZone select 2 select 0)] call SIN_fnc_findPos;
		[NATmilitaryForce,_wp,"SAD","RED"] call NAT_fnc_createWaypoint;
		[(leader NATmilitaryForce),format["Moving to secure %1",(_targetZone select 0)]] remoteExec ["sideChat",0];
		_aMarker setMarkerType "mil_objective";
		_aMarker setMarkerColor "ColorWEST";
		_aMarker setMarkerPos [(_targetPos select 0),(_targetPos select 1)+100];
	};
};

_aMarker setMarkerAlpha 1;

//-----------------------------------
//-WAIT FOR RESOLUTION

switch (_faction) do {
	case "military": {
		waitUntil {sleep 10; (_targetZone in NATmilitaryZones) || {alive _x} count units NATmilitaryForce isEqualTo 0};
		if (count units NATmilitaryForce > 0) then {
			[NATmilitaryForce,[(_targetPos select 0),(_targetPos select 1),0],(10*count units NATmilitaryForce),2,true] call CBA_fnc_taskDefend;
			[(leader NATmilitaryForce),format["%1 is secure, holding here for a while.",(_targetZone select 0)]] remoteExec ["sideChat",0];
		};
	};
};

//-----------------------------------
//sleep ((1*60*60/timeMultiplier)+random(2*60*60/timeMultiplier));
sleep 10;
deleteMarker _aMarker;
[_faction,_targetZone] spawn NAT_fnc_warbotWave;