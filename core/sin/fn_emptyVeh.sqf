/*
	fn_emptyVeh
	Author: Sinbane
	Clears a vehicles inventory
*/
//-----------------------------------
params [
	["_veh",objNull],
	["_inv",false],
	["_wep",false],
	["_fuel",false]
];
if (isNull _veh) exitWith {};
//-----------------------------------
if (_inv) then {
	clearMagazineCargoGlobal _veh;
	clearWeaponCargoGlobal _veh;
	clearItemCargoGlobal _veh;
	clearBackpackCargoGlobal _veh;
};
if (_wep) then {
	_veh setVehicleAmmo 0;
};
if (_fuel) then {
	_veh setFuelCargo 0;
};
//-----------------------------------