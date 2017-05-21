/*
	fn_checkTanoaPos
	Author: Sinbane
	Checks that the supplied position is on the main island/connected island of Tanoa
*/
private ["_pass","_return"];
//-----------------------------------
params [
    ["_pos",[]]
];

_pass = 0;
_return = false;
_islandZones = [[[8092.05,10362.7,0.00175095],4000],[[11196.3,9635.81,0.00164795],4000],[[11212.6,3367.12,0.00170135],2500]];

//-----------------------------------

{
	if (_pos distance2D (_x select 0) <= (_x select 1)) exitWith {
		_return = true;
	};
} forEach _islandZones;

_return;

//-----------------------------------