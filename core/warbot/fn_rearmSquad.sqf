/*
	fn_rearmSquad
	Author: Sinbane
	Rearms the player's AI squadmates with more equipment
*/

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
		if (_FAK < 3) then {
			while {_FAK < 3 && _unit canAdd "FirstAidKit"} do {
				_unit addItem "FirstAidKit";
			};
		};
		if (!DebugMode) then {
			NATresScrap = NATresScrap - 1;
			publicVariable "NATresScrap";
		};
	};
} forEach (units group player);

systemChat "SQUAD REARMED"; showChat true;

//-----------------------------------