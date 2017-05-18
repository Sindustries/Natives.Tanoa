/*
	fn_dynObjMonitor
	By Sinbane
	Monitors player position and spawns/manipulates objects based on distance
*/

_distance = (["NATviewDistance"] call NAT_fnc_getSetting);

//-----------------------------------

sleep 20;

//BLACKOUT
{
	if ((getPos _x) distance2D (getPos player) < _distance && (damage _x) < 0.97) then {
		_x setHit ["light_1_hitpoint", 0.97];
		_x setHit ["light_2_hitpoint", 0.97];
		_x setHit ["light_3_hitpoint", 0.97];
		_x setHit ["light_4_hitpoint", 0.97];
	};
} forEach nearestObjects [(getPos player), [ "Lamps_base_F", "PowerLines_base_F", "PowerLines_Small_base_F" ], _distance];

//RADIOACTIVE OBJECTS
{
	if (player distance2D (_x select 0) < _distance && (_x select 2) isEqualTo false) then {
		NATRadioActiveLocations set [_forEachIndex,[(_x select 0),(_x select 1),true]];
		publicVariable "NATradioActiveLocations";
		[(_x select 0),(_x select 1)] call NAT_fnc_radObjSpawner;
	};
} forEach NATRadioActiveLocations;

[] spawn NAT_fnc_dynObjMonitor;

//----------------------------------- Pos = [(_x select 0),0,((_x select 1) select 0),0.2] call SIN_fnc_findPos;