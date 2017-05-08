/*
	fn_fuelStation
	Author: Sinbane
	Description:
	Removes fuel from fuel stations and forces player to step out of vehicle to refuel
*/
private [];
//-----------------------------------
//-Remove fuel from pumps
{
	_x setFuelCargo 0;
} forEach nearestObjects [(getArray(configFile >> "CfgWorlds" >> worldName >> "centerPosition")), [
	//Altis, Stratis
	"Land_FuelStation_Feed_F", "Land_fs_feed_F",
	//Tanoa
	"Land_FuelStation_01_pump_F", "Land_FuelStation_02_pump_F"
], worldSize];
//-----------------------------------

