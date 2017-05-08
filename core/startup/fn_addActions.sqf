/*
	fn_addActions.sqf
	Author: Sinbane
	Description:
	Handles all player actions
*/
//-----------------------------------
NAT_FUELaction = [player addAction["Refuel",NAT_fnc_fuelPump,"",0,false,false,"",'
!isNull cursorObject && player distance cursorObject < 3.5 && typeOf cursorObject in WLD_fuelPumps && vehicle player isEqualTo player']];
//-----------------------------------