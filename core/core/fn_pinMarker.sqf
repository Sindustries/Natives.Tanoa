/*
	fn_pinMarker
	Author: Sinbane
	Creates a map marker that follows the group's leader until they die
*/
private ["_colour","_aMarker"];
params [
	["_group",""]
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
if (_group in NATpinnedGroups) exitWith {};
NATpinnedGroups pushBack _group;

//-----------------------------------

{
	if (_x isEqualTo (leader _group)) then {
		_aMarkername = format["%1%2",(getPos _x),(random 10000)];
		_aMarker = createMarkerLocal [_aMarkername,(getPos _x)];
		_aMarker setMarkerShapeLocal "ICON";
		_aMarker setMarkerTypeLocal "mil_triangle";
		_aMarker setMarkerColorLocal _colour;
		_aMarker setMarkerSizeLocal [0.75,0.75];
		_aMarker setMarkerAlphaLocal 0;
	};
} forEach (units _group);

while {{alive _x} count (units _group) > 0} do {
	_aMarker setMarkerPosLocal (getPos (leader _group));
	_aMarker setMarkerDirLocal (getDir (leader _group));
	switch ((side (leader _group))) do {
		case WEST: {
			if  ("ItemRadio" in (assignedItems player)) then {
				_aMarker setMarkerAlphaLocal 0.8;
				_aMarker setMarkerTextLocal (groupid _group);
				sleep 3;
			} else {
				_aMarker setMarkerAlphaLocal 0;
				sleep 12;
			};
		};
		case EAST: {
			if ((["sc_receiver"] call NAT_fnc_vInvCheck)) then {
				_aMarker setMarkerAlphaLocal 0.8;
				sleep 6;
			} else {
				_aMarker setMarkerAlphaLocal 0;
				sleep 12;
			};
		};
	};
};
private "_toRemove";
_toRemove = [];
{
	if (_x isEqualTo _group) then {
		_toRemove pushBack _group;
	};
} forEach NATpinnedGroups;
NATpinnedGroups = NATpinnedGroups - _toRemove;
_aMarker setMarkerType "mil_destroy";
_aMarker setMarkerDir 45;
_aMarker setMarkerText "";

sleep 600;

deleteMarker _aMarker;

//-----------------------------------