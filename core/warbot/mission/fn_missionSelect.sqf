/*
	fn_missionSelect
	Author: Sinbane
	Opens the strategic map and lets host chose a mission
*/


//-----------------------------------

start_mission01 =
{
[color="#FF0000"]	<here put the code to be executed when the player selects the first mission>[/color]
};

start_mission02 =
{
[color="#FF0000"]	<here put the code to be executed when the player selects the first mission>[/color]
};

_missionsData 	= [
	[[color="#FF0000"]<Position (array) of mission 01>[/color],start_mission01,"[color="#FF0000"]<Text to Display>[/color]","[color="#FF0000"]<Description>[/color]","","[color="#FF0000"]<image>[/color]",1,[]],
	[[color="#FF0000"]<Position (array) of mission 02>[/color],start_mission02,"[color="#FF0000"]<Text to Display>[/color]","[color="#FF0000"]<Description>[/color]","","[color="#FF0000"]<image>[/color]",1,[]]
];

disableserialization;

_parentDisplay 	= [] call bis_fnc_displayMission;
_mapCenter 	= [color="#FF0000"]<position (array) to  centre the strategic map on when first opened>[/color];
_ORBAT 		= [];
_markers 	= [];
_images 	= [];
_overcast 	= overcast;
_isNight 	= !((dayTime > 6) && (dayTime < 20));
_scale		= 0.3;
_simul		= true;

[
findDisplay 46,
_mapCenter,
_missionsData,
_ORBAT,
_markers,
_images,
_overcast,
_isNight,
_scale,
_simul
] call Bis_fnc_strategicMapOpen;

//-----------------------------------