/*
	fn_warbotWave
	Author: Sinbane
	Controls the overall struggle for the map

	>> I feel this is very ineffecient.. will come back to this.
	Any tips? let me know, please.
*/
private ["_zone1","_zone2","_zone3","_side"];
params [
	["_base",[0,0,0]],
	["_lastPos",[0,0,0]],
	["_faction",""]
];

if (_base isEqualTo [0,0,0] || _faction isEqualTo "") exitWith {systemChat "FATAL ERROR IN fn_warbotWave"; showChat true};
if (_lastPos isEqualTo [0,0,0]) then {_lastPos = nil};

//-----------------------------------
//-FIND NEAREST ENEMY ZONE

_targets = [];

switch (_faction) do {
	case "military": {
		if (count NATmilitiaZones > 0) then {
			if (isNil "_lastPos") then {
				_zone1 = [_base,"militia"] call NAT_fnc_findNearestZone;
			} else {
				_zone1 = [_lastPos,"militia"] call NAT_fnc_findNearestZone;
			};
		};
		if (count NATnativeZones > 0) then {
			if (isNil "_lastPos") then {
				_zone2 = [_base,"native"] call NAT_fnc_findNearestZone;
			} else {
				_zone2 = [_lastPos,"native"] call NAT_fnc_findNearestZone;
			};
		};
		if (count NATcivilianZones > 0) then {
			if (isNil "_lastPos") then {
				_zone3 = [_base,"civilian"] call NAT_fnc_findNearestZone;
			} else {
				_zone3 = [_lastPos,"civilian"] call NAT_fnc_findNearestZone;
			};
		};
		_side = WEST;
	};
	case "militia": {
		if (count NATmilitaryZones > 0) then {
			if (isNil "_lastPos") then {
				_zone1 = [_base,"military"] call NAT_fnc_findNearestZone;
			} else {
				_zone1 = [_lastPos,"military"] call NAT_fnc_findNearestZone;
			};
		};
		if (count NATnativeZones > 0) then {
			if (isNil "_lastPos") then {
				_zone2 = [_base,"native"] call NAT_fnc_findNearestZone;
			} else {
				_zone2 = [_lastPos,"native"] call NAT_fnc_findNearestZone;
			};
		};
		if (count NATcivilianZones > 0) then {
			if (isNil "_lastPos") then {
				_zone3 = [_base,"civilian"] call NAT_fnc_findNearestZone;
			} else {
				_zone3 = [_lastPos,"civilian"] call NAT_fnc_findNearestZone;
			};
		};
		_side = EAST;
	};
	case "native": {
		if (count NATmilitaryZones > 0) then {
			if (isNil "_lastPos") then {
				_zone1 = [_base,"native"] call NAT_fnc_findNearestZone;
			} else {
				_zone1 = [_lastPos,"native"] call NAT_fnc_findNearestZone;
			};
		};
		if (count NATmilitiaZones > 0) then {
			if (isNil "_lastPos") then {
				_zone2 = [_base,"native"] call NAT_fnc_findNearestZone;
			} else {
				_zone2 = [_lastPos,"native"] call NAT_fnc_findNearestZone;
			};
		};
		if (count NATcivilianZones > 0) then {
			if (isNil "_lastPos") then {
				_zone3 = [_base,"civilian"] call NAT_fnc_findNearestZone;
			} else {
				_zone3 = [_lastPos,"civilian"] call NAT_fnc_findNearestZone;
			};
		};
		_side = RESISTANCE;
	};
};

if (!(isNil "_zone1")) then {
	_targets pushBackUnique (_zone1 select 0);
};
if (!(isNil "_zone2")) then {
	_targets pushBackUnique (_zone2 select 0);
};
if (!(isNil "_zone3")) then {
	_targets pushBackUnique (_zone3 select 0);
};

_targets = [_targets,[],{_base distance _x},"ASCEND"] call BIS_fnc_sortBy;
_target = (_targets select 0);

//-----------------------------------
//-REINFORCE & ATTACK

_aMarkername = format["warbotObjective%1",_faction];
_aMarker = createMarker [_aMarkername,_target];
_aMarker setMarkerShapeLocal "ICON";
_aMarker setMarkerTypeLocal "mil_objective";
_aMarker setMarkerSizeLocal [0.75,0.75];
_aMarker setMarkerAlphaLocal 0;

switch (_faction) do {
	case "military": {
		if (count units NATmilitaryForce < 1) then {
			NATmilitaryForce = createGroup WEST;
		};
		while {count units NATmilitaryForce < NATmilitaryForcePower} do {
			_unit = [_base,west,"military",NATmilitaryForce] call NAT_fnc_spawnUnit;
		};
		[NATmilitaryForce] remoteExec ["NAT_fnc_pinMarker",0];
		[NATmilitaryForce,_target] call NAT_fnc_createWaypoint;
		_aMarker setMarkerColorLocal "ColorWEST";
	};
	case "militia": {
		if (count units NATmilitiaForce < 1) then {
			NATmilitiaForce = createGroup EAST;
		};
		while {count units NATmilitiaForce < NATmilitiaForcePower} do {
			_unit = [_base,east,"militia",NATmilitiaForce] call NAT_fnc_spawnUnit;
		};
		[NATmilitiaForce] remoteExec ["NAT_fnc_pinMarker",0];
		[NATmilitiaForce,_target] call NAT_fnc_createWaypoint;
		_aMarker setMarkerColorLocal "ColorEAST";
	};
	case "native": {
		if (count units NATnativeForce < 1) then {
			NATnativeForce = createGroup RESISTANCE;
		};
		while {count units NATnativeForce < NATnativeForcePower} do {
			_unit = [_base,resistance,"native",NATnativeForce] call NAT_fnc_spawnUnit;
		};
		//[NATmilitaryForce] remoteExec ["NAT_fnc_pinMarker",0];
		[NATnativeForce,_target] call NAT_fnc_createWaypoint;
		_aMarker setMarkerColorLocal "ColorGUER";
	};
};

_aMarker setMarkerAlphaLocal 1;

//-----------------------------------
//-WAIT FOR RESOLUTION

switch (_faction) do {
	case "military": {
		if (!(isNil "_lastPos")) then {
			waitUntil {sleep 30; _target in NATmilitaryZones || !(_lastPos in NATmilitaryZones) || {alive _x} count NATmilitaryForce isEqualTo 0};
		} else {
			waitUntil {sleep 30; _target in NATmilitaryZones || {alive _x} count units NATmilitaryForce isEqualTo 0};
		};
		if (!(isNil "_lastPos")) then {
			if (!(_lastPos in NATmilitaryZones)) then {
				[NATmilitaryForce] call NAT_fnc_clearWaypoints;
				[NATmilitaryForce,_lastPos] call NAT_fnc_createWaypoint;
			};
		} else {
			[NATmilitaryForce,[(_target select 0),(_target select 1),0],(10*count units NATmilitaryForce),2,true] call CBA_fnc_taskDefend;
		};
	};
	case "militia": {
		if (!(isNil "_lastPos")) then {
			waitUntil {sleep 30; _target in NATmilitiaZones || !(_lastPos in NATmilitiaZones) || {alive _x} count NATmilitiaForce isEqualTo 0};
		} else {
			waitUntil {sleep 30; _target in NATmilitiaZones || {alive _x} count units NATmilitiaForce isEqualTo 0};
		};
		if (!(isNil "_lastPos")) then {
			if (!(_lastPos in NATmilitiaZones)) then {
				[NATmilitiaForce] call NAT_fnc_clearWaypoints;
				[NATmilitiaForce,_lastPos] call NAT_fnc_createWaypoint;
			};
		} else {
			[NATmilitiaForce,[(_target select 0),(_target select 1),0],(10*count units NATmilitiaForce),2,true] call CBA_fnc_taskDefend;
		};
	};
	case "native": {
		if (!(isNil "_lastPos")) then {
			waitUntil {sleep 30; _target in NATnativeZones || !(_lastPos in NATnativeZones) || {alive _x} count NATnativeForce isEqualTo 0};
		} else {
			waitUntil {sleep 30; _target in NATnativeZones || {alive _x} count units NATnativeForce isEqualTo 0};
		};
		if (!(isNil "_lastPos")) then {
			if (!(_lastPos in NATnativeZones)) then {
				[NATnativeForce] call NAT_fnc_clearWaypoints;
				[NATnativeForce,_lastPos] call NAT_fnc_createWaypoint;
			};
		} else {
			[NATnativeForce,[(_target select 0),(_target select 1),0],(10*count units NATnativeForce),2,true] call CBA_fnc_taskDefend;
		};
	};
};

//-----------------------------------
sleep (300+(random 300));
_base = [_target,_faction] call NAT_fnc_findNearestBase;
[_base,_target,_faction] spawn NAT_fnc_warbotWave;