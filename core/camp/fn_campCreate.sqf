/*
    fn_campCreate
    Author: Sinbane

    Description:
    Creates a AI camp
*/
private ["_time"];
params [
	["_obj",objNull],
	["_unit",objNull],
	["_id",-1],
	["_arguments",[]]
];

if (isNull "_obj" || isNull "_unit") exitWith {};
if (_unit != player) exitWith {};

//-----------------------------------
