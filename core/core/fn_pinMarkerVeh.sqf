/*
	fn_pinMarkerVeh
	Author: Sinbane
	Creates a map marker that follows the vehicle while it's alive
*/
private ["_colour","_aMarker"];
params [
	["_veh",""]
];

if (_veh getVariable "NATmarker" isEqualTo true) exitWith {};
_veh setVariable ["NATmarker",true];

_name = getText (configFile >> "CfgVehicles" >> (typeOf _veh) >> "displayName");

//-----------------------------------

_aMarkername = format["%1%2",(getPos _veh),(random 10000)];
_aMarker = createMarker [_aMarkername,(getPos _veh)];
_aMarker setMarkerShape "ICON";
_aMarker setMarkerType "mil_triangle";
_aMarker setMarkerColor "ColorGrey";
_aMarker setMarkerSize [0.75,0.75];
_aMarker setMarkerAlpha 0;
_aMarker setMarkerText _name;

while {alive _veh} do {
	_aMarker setMarkerPos (getPos _veh);
	_aMarker setMarkerDir (getDir _veh);
	if (count (crew _veh) > 0) then {
		_aMarker setMarkerAlpha 0;
	} else {
		_aMarker setMarkerAlpha 0.8;
	};
	sleep 6;
};

_aMarker setMarkerType "mil_destroy";
_aMarker setMarkerDir 45;
_aMarker setMarkerText "";

sleep 600;

deleteMarker _aMarker;

//-----------------------------------