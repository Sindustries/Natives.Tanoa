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
//-FIND NEAREST ENEMY ZONES

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
			_zone1 = [_base,"militia"] call NAT_fnc_findNearestZone;
		};
		if (count NATnativeZones > 0) then {
			_zone2 = [_base,"native"] call NAT_fnc_findNearestZone;
		};
		if (count NATcivilianZones > 0) then {
			_zone3 = [_base,"civilian"] call NAT_fnc_findNearestZone;
		};
	};
	case "militia": {
		if (isNil "_lastPos") then {
			_loc = (selectRandom NATmilitiaCamps);
			_base = (_loc select 0);
		} else {
			_base = [(_lastPos select 1),"militia"] call NAT_fnc_findNearestBase;
		};
		if (count NATmilitaryZones > 0) then {
			_zone1 = [_base,"military"] call NAT_fnc_findNearestZone;
		};
		if (count NATnativeZones > 0) then {
			_zone2 = [_base,"native"] call NAT_fnc_findNearestZone;
		};
		if (count NATcivilianZones > 0) then {
			_zone3 = [_base,"civilian"] call NAT_fnc_findNearestZone;
		};
	};
	case "native": {
		if (isNil "_lastPos") then {
			_loc = (selectRandom NATnativeCamps);
			_base = (_loc select 0);
		} else {
			_base = [(_lastPos select 1),"native"] call NAT_fnc_findNearestBase;
		};
		if (count NATmilitaryZones > 0) then {
			_zone1 = [_base,"military"] call NAT_fnc_findNearestZone;
		};
		if (count NATmilitiaZones > 0) then {
			_zone2 = [_base,"militia"] call NAT_fnc_findNearestZone;
		};
		if (count NATcivilianZones > 0) then {
			_zone3 = [_base,"civilian"] call NAT_fnc_findNearestZone;
		};
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
	case "militia": {
		if (count units NATmilitiaForce < 1) then {
			NATmilitiaForce = createGroup EAST;
			NATmilitiaForce setGroupIdGlobal ["Militia Force"];
		};
		while {count units NATmilitiaForce < NATmilitiaForcePower} do {
			_pos = [_base,0,75,4] call SIN_fnc_findPos;
			_unit = [_pos,east,"militia",NATmilitiaForce] call NAT_fnc_spawnUnit;
		};
		[NATmilitiaForce] remoteExec ["NAT_fnc_pinMarker",0];
		[NATmilitiaForce] call NAT_fnc_clearWaypoints;
		_wp = [_targetPos,0,(_targetZone select 2 select 0)] call SIN_fnc_findPos;
		[NATmilitiaForce,_wp,"SAD","RED"] call NAT_fnc_createWaypoint;
		_aMarker setMarkerType "mil_objective";
		_aMarker setMarkerColor "ColorEAST";
		_aMarker setMarkerPos [(_targetPos select 0)-100,(_targetPos select 1)];
	};
	case "native": {
		if (count units NATnativeForce < 1) then {
			NATnativeForce = createGroup EAST;
			NATnativeForce setGroupIdGlobal ["Native Force"];
		};
		while {count units NATnativeForce < NATnativeForcePower} do {
			_pos = [_base,0,75,4] call SIN_fnc_findPos;
			_unit = [_pos,resistance,"native",NATnativeForce] call NAT_fnc_spawnUnit;
		};
		//[NATnativeForce] remoteExec ["NAT_fnc_pinMarker",0];
		[NATnativeForce] call NAT_fnc_clearWaypoints;
		_wp = [_targetPos,0,(_targetZone select 2 select 0)] call SIN_fnc_findPos;
		[NATnativeForce,_wp,"SAD","RED"] call NAT_fnc_createWaypoint;
		_aMarker setMarkerType "mil_objective";
		_aMarker setMarkerColor "ColorGUER";
		_aMarker setMarkerPos [(_targetPos select 0)+100,(_targetPos select 1)];
	};
};

_aMarker setMarkerAlpha 1;

//-----------------------------------
//-WAIT FOR RESOLUTION

switch (_faction) do {
	case "military": {
		waitUntil {sleep 10; (_targetZone in NATmilitaryZones) || {alive _x} count units NATmilitaryForce isEqualTo 0};
		if (count units NATmilitaryForce > 0) then {
			[NATmilitaryForce] call NAT_fnc_clearWaypoints;
			[NATmilitaryForce,[(_targetPos select 0),(_targetPos select 1),0],(10*count units NATmilitaryForce),2,true] call CBA_fnc_taskDefend;
			[(leader NATmilitaryForce),format["%1 is secure, holding here for a while.",(_targetZone select 0)]] remoteExec ["sideChat",0];
		};
	};
	case "militia": {
		waitUntil {sleep 10; (_targetZone in NATmilitiaZones) || {alive _x} count units NATmilitiaForce isEqualTo 0};
		if (count units NATmilitiaForce > 0) then {
			[NATmilitiaForce] call NAT_fnc_clearWaypoints;
			[NATmilitiaForce,[(_targetPos select 0),(_targetPos select 1),0],(10*count units NATmilitiaForce),2,true] call CBA_fnc_taskDefend;
		};
	};
	case "native": {
		waitUntil {sleep 10; (_targetZone in NATnativeZones) || {alive _x} count units NATnativeForce isEqualTo 0};
		if (count units NATnativeForce > 0) then {
			[NATnativeForce] call NAT_fnc_clearWaypoints;
			[NATnativeForce,[(_targetPos select 0),(_targetPos select 1),0],(10*count units NATnativeForce),2,true] call CBA_fnc_taskDefend;
		};
	};
};

//-----------------------------------
//-REARM
waveRearm = {
	_unit = _this select 0;
	if (alive _unit) then {
		_pWep = primaryWeapon _unit;
		_sWep = handgunWeapon _unit;
		_mags = magazinesAmmoFull _unit;
		_FAK = {_x isEqualTo "FirstAidKit"} count (items _unit);
		{
			if ((_x select 0) in (getArray (configFile >> "CfgWeapons" >> _pWep >> "magazines"))) then {
				_unit removeMagazines (_x select 0);
				_unit addMagazines [(_x select 0),9];
			};
			if ((_x select 0) in (getArray (configFile >> "CfgWeapons" >> _sWep >> "magazines"))) then {
				_unit removeMagazines (_x select 0);
				_unit addMagazines [(_x select 0),5];
			};
		} forEach _mags;
		if (_FAK < 3) then {
			while {_FAK < 3 && _unit canAdd "FirstAidKit"} do {
				_unit addItem "FirstAidKit";
			};
		};
	};
};
switch (_faction) do {
	case "military": {
		if (count units NATmilitaryForce > 0) then {
			{[_x] call waveRearm} forEach (units NATmilitaryForce);
		};
	};
	case "militia": {
		if (count units NATmilitiaForce > 0) then {
			{[_x] call waveRearm} forEach (units NATmilitiaForce);
		};
	};
	case "military": {
		if (count units NATnativeForce > 0) then {
			{[_x] call waveRearm} forEach (units NATnativeForce);
		};
	};
};

//-----------------------------------
deleteMarker _aMarker;
sleep ((1*60*60/timeMultiplier)+random(2*60*60/timeMultiplier));
[_faction,_targetZone] spawn NAT_fnc_warbotWave;