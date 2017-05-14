/*
	fn_pinMarker
	Author: Sinbane
	Creates a map marker that follows the group's leader until they die
*/
private ["_colour","_aMarker"];
params [
	["_group"]
];

switch ((side (leader _group))) do {
	case WEST: {
		_colour = "ColorWEST";
	};
	case EAST: {
		_colour = "ColorEAST";
	};
};

if ((side (leader _group)) in [RESISTANCE,CIVILIAN]) exitWith {};

//-----------------------------------

{
	if (_x isEqualTo (leader _group)) then {
		_aMarkername = format["%1%2",(getPos _x),(random 10000)];
		_aMarker = createMarker [_aMarkername,(getPos _x)];
		_aMarker setMarkerShape "ICON";
		_aMarker setMarkerType "mil_triangle";
		_aMarker setMarkerColor _colour;
		_aMarker setMarkerSize [0.75,0.75];
		_aMarker setMarkerAlpha 0;
	};
} forEach (units _group);

while {{alive _x} count (units _group) > 0} do {
	_aMarker setPos (getPos (leader _group));
	_aMarker setMarkerDir (getDir (leader _group));

	if ((side (leader _group)) isEqualTo WEST && "itemRadio" in (assignedItems player)) then {
		_aMarker setMarkerAlpha 0.8;
		_aMarker setMarkerText (groupid _group);
	} else {
		_aMarker setMarkerAlpha 0;
	};

	if ((side (leader _group)) isEqualTo EAST && (["sc_receiver"] call NAT_fnc_vInvCheck)) then {
		_aMarker setMarkerAlpha 0.8;
	} else {
		_aMarker setMarkerAlpha 0;
	};

	sleep 3;
};

_aMarker setMarkerType "mil_destroy";
_aMarker setMarkerDir 45;
_aMarker setMarkerColor "ColorRed";

sleep 600;

deleteMarker _aMarker;

//-----------------------------------