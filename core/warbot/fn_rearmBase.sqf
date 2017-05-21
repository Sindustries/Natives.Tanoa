/*
	fn_rearmBase
	Author: Sinbane
	Rearms the base defences and units and recruits new units to place dead ones
*/
private ["_baseArray"];
//-----------------------------------
//-GET THE BASE MAIN OBJECT, DEFENCES AND DEFENDER GROUP

_basePos = [(getPos player),"military"] call NAT_fnc_findNearestBase;
{
	if ((_x select 0) isEqualTo _basePos) exitWith {
		_baseArray = _x;
	};
} forEach NATmilitaryCamps;

if (isNil "_baseArray") exitWith {};

_campPos = (_baseArray select 0);
_base = (_baseArray select 1);
_group = (_baseArray select 2);

//-----------------------------------
//-REFILL TURRETS

_turrets = _base getVariable "NATcampDefences";
if (count _turrets > 0) then {
	{
		if (NATresScrap >= 5) then {
			_x setVehicleAmmo 1;
			_x setDamage 0;
			if (!DebugMode) then {
				NATresScrap = NATresScrap - 5;
				publicVariable "NATresScrap";
			};
		};
	} forEach _turrets;
};

//-----------------------------------
//-REFILL ALIVE UNIT AMMO

{
	if (alive _x && NATresScrap >= 1) then {
		_unit = _x;
		_pWep = primaryWeapon _unit;
		_sWep = handgunWeapon _unit;
		_mags = magazinesAmmoFull _unit;
		_FAK = {_x isEqualTo "FirstAidKit"} count (items _unit);
		{
			if ((_x select 0) in (getArray (configFile >> "CfgWeapons" >> _pWep >> "magazines"))) then {
				_unit removeMagazines (_x select 0);
				_unit addMagazines [(_x select 0),9];
			};
			if ((_x select 0) in (getArray (configFile >> "CfgWeapons" >> _sWep >> "magazines"))) then {
				_unit removeMagazines (_x select 0);
				_unit addMagazines [(_x select 0),5];
			};
		} forEach _mags;
		if (_FAK < 3 && _unit canAdd "FirstAidKit") then {
			while {_FAK < 3} do {
				_unit addItem "FirstAidKit";
			};
		};
		if (!DebugMode) then {
			NATresScrap = NATresScrap - 1;
			publicVariable "NATresScrap";
		};
	};
} forEach (units _group);

//-----------------------------------
//-REPLACE DEAD/MISSING UNITS

//if (count units _group < 3) then {
	while {count units _group < 3} do {
		if (NATresFood < 1 || NATresWater < 1) exitWith {};
		if (NATresFood >= 1 && NATresWater >= 1) then {
			_spawnPos = [_campPos,0,30,1] call SIN_fnc_findPos;
			_unit = _group createUnit ["B_Survivor_F", _spawnPos, [], 0, "NONE"];
			[_unit,"military",true] call NAT_fnc_equip;
			{_unit setSkill [(_x select 0),(_x select 1)]} forEach NATmilitarySkills;
			if (!DebugMode) then {
				NATresFood = NATresFood - 1;
				NATresWater = NATresWater - 1;
				publicVariable "NATresFood";
				publicVariable "NATresWater";
			};
		};
	};
//};

systemChat "BASE REARMED"; showChat true;

//-----------------------------------