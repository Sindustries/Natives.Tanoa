/*
	fn_zoneCheck
	Author: Sinbane
	Checks that the supplied position is in the zone as pos2
*/
private ["_pass","_zone1","_zone2","_return"];
//-----------------------------------
params [
    ["_pos",[]],
    ["_pos2",[]]
];

if (worldName != "Tanoa") exitWith {true};

_pass = 0;
_zone1 = 0;
_zone2 = 0;
_return = false;

/* ZONE 1 - MAIN ISLAND */
_islandZone1 = [[[8223.93,10409.4,0],[4000,4000]],[[4690.93,8478.54,0],[1000,1000]],[[11237.8,8779.19,0],[5000,5000]],[[11334.7,5133.13,0],[4000,4000]]];
/* ZONE 2 - SOUTH WESTERN ISLES */
_islandZone2 = [[[0,0,0],[0,0]],[[2246.32,6747.21,0],[2000,2000]],[[2461.48,3591.07,0],[2000,2000]],[[5057.49,2930.27,0],[2000,2000]],[[5784.38,4138.59,0],[2000,2000]],[[4273.97,5073.16,0],[2000,2000]],[[3147.33,9234.46,0],[1000,1000]]];
/* ZONE 3 - NORTH WESTERN ISLAND */
_islandZone3 = [[[3109.57,12791.2,0],[2000,2000]],[[2331.07,11693.5,0],[2000,2000]],[[4237.96,14572.7,0],[2000,2000]]];
/* ZONE 4 - HOTEL RESORT ISLAND */
_islandZone4 = [[[12712.1,14118.4,0],[1000,1000]]];

//-----------------------------------

while {_zone1 isEqualTo 0 && _zone2 isEqualTo 0} do {
	{
		if (_pos distance2D (_x select 0) <= (_x select 1 select 0)) then {
			_zone1 = 1;
		};
		if (_pos2 distance2D (_x select 0) <= (_x select 1 select 0)) then {
			_zone2 = 1;
		};
	} forEach _islandZone1;
	{
		if (_pos distance2D (_x select 0) <= (_x select 1 select 0)) then {
			_zone1 = 2;
		};
		if (_pos2 distance2D (_x select 0) <= (_x select 1 select 0)) then {
			_zone2 = 2;
		};
	} forEach _islandZone2;
	{
		if (_pos distance2D (_x select 0) <= (_x select 1 select 0)) then {
			_zone1 = 3;
		};
		if (_pos2 distance2D (_x select 0) <= (_x select 1 select 0)) then {
			_zone2 = 3;
		};
	} forEach _islandZone3;
	{
		if (_pos distance2D (_x select 0) <= (_x select 1 select 0)) then {
			_zone1 = 4;
		};
		if (_pos2 distance2D (_x select 0) <= (_x select 1 select 0)) then {
			_zone2 = 4;
		};
	} forEach _islandZone4;
};

//-----------------------------------

if (_zone1 isEqualTo _zone2) then {
	_return = true;
};

_return;

//-----------------------------------