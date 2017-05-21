/*
	fn_findShoreBasePos
	Author: Sinbane
	Finds a pier to set as a shore base
*/
private ["_dist","_pierFound","_return"];
//-----------------------------------
params [
    ["_pos",[]]
];

/*_piers = [
"Land_Pier_addon",
"Land_Pier_F",
"Land_nav_pier_m_F",
"Land_PierConcrete_01_4m_ladders_F",
"Land_PierConcrete_01_16m_F",
"Land_PierConcrete_01_steps_F",
"Land_PierWooden_02_16m_F",
"Land_PierWooden_02_barrel_F",
"Land_PierWooden_02_hut_F",
"Land_PierWooden_02_ladder_F",
"Land_PierWooden_01_10m_noRails_F",
"Land_PierWooden_01_16m_F",
"Land_PierWooden_01_dock_F",
"Land_PierWooden_01_hut_F",
"Land_PierWooden_01_ladder_F",
"Land_PierWooden_01_platform_F"
];*/

_piers = [
"Land_Pier_F",
"Land_Pier_addon",
"Land_PierConcrete_01_steps_F",
"Land_PierWooden_02_hut_F",
"Land_PierWooden_01_dock_F",
"Land_PierWooden_01_hut_F"
];

//-----------------------------------

private ["_pierFound","_dist"];
_pierFound = false;
_dist = 100;
while {!_pierFound} do {
	_nearestPiers = nearestObjects [_pos,_piers,_dist];
	if (count _nearestPiers > 0) then {
		_pierFound = true;
		_pier = (_nearestPiers select 0);
		_return = [_pier,(getPos _pier)];
	} else {
		_dist = _dist + 100;
	};
};

_return;

//-----------------------------------