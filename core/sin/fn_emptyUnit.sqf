/*
	fn_emptyVeh
	Author: Sinbane
	Clears a vehicles inventory
*/
//-----------------------------------
params [
	["_unit",objNull]
];
if (isNull _unit) exitWith {};
//-----------------------------------
removeAllWeapons _unit;
removeAllItems _unit;
removeAllAssignedItems _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;
removeGoggles _unit;
//-----------------------------------