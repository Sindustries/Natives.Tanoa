/*
	fn_clearWaypoints
	Author: Sinbane
	Clears all group waypoints
*/

_group = _this select 0;

while {(count (waypoints _group)) > 0} do {
	deleteWaypoint ((waypoints _group) select 0);
};

//-----------------------------------