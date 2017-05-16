/*
	fn_emptyVeh.sqf
	Author: Sinbane
	Description:
	Strips a vehicles of everything it has
*/
//-----------------------------------
params [
	["_veh",objNull],
	["_wep",true]
];
if (isNull _veh) exitWith {};
//-----------------------------------
clearMagazineCargoGlobal _veh;
clearWeaponCargoGlobal _veh;
clearItemCargoGlobal _veh;
clearBackpackCargoGlobal _veh;
if (_wep) then {
	_veh setVehicleAmmo 0;
};
//-----------------------------------