/*
	fn_handleDamage
	Author: Sinbane
	Description:
	Intercepts incoming damage
*/
//-----------------------------------

	player addEventHandler ["HandleDamage", {
		_unit = _this select 0;
		_selectionName = _this select 1;
		_damage = _this select 2;
		_source = _this select 3;
		_projectile = _this select 4;

		if (DebugMode) then {systemChat format["DEBUG :: handleDamage :: PRE: %1",_damage]};
		_damage = (_damage/4);

		if (DebugMode) then {systemChat format["DEBUG :: handleDamage :: POST: %1",_damage]; _damage = 0};
		_damage;
	}];

//-----------------------------------