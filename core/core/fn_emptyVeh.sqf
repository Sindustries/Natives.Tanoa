/*
	fn_emptyVeh.sqf
	Author: Sinbane
	Description:
	Strips a vehicles of everything it has
*/
//-----------------------------------
params [
	["_veh",objNull,[ObjNull]]
];
if (isNull _veh) exitWith {};
//-----------------------------------
clearMagazineCargoGlobal _veh;
clearWeaponCargoGlobal _veh;
clearItemCargoGlobal _veh;
clearBackpackCargoGlobal _veh;
_veh setVehicleAmmo 0;
//-----------------------------------