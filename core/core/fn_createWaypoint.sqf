/*
	fn_createWaypoint
	Author: Sinbane
	Gives group a waypoint
*/

params [
["_group",""],
["_pos",[0,0,0]],
["_type","MOVE"],
["_mode","YELLOW"],
["_behaviour","AWARE"],
["_desc",""]
];

if (_group isEqualTo "" || _pos isEqualTo [0,0,0] || _type isEqualTo "" || _mode isEqualTo "") exitWith {};

_wp = _group addWaypoint [[(_pos select 0),(_pos select 1),0],0];
_wp setWaypointType _type;
_wp setWaypointCombatMode _mode;
_wp setWaypointBehaviour _behaviour;
_wp setWaypointFormation "STAG COLUMN";
_wp setWaypointDescription _desc;
_wp;
//-----------------------------------