/*
	fn_handleDamage
	Author: Sinbane
	Description:
	Intercepts incoming damage
*/
//-----------------------------------

	player addEventHandler ["HandleDamage", {
		_hdl = [(_this select 0),(_this select 1),(_this select 2),(_this select 3),(_this select 4)] spawn {
			private ["_unit","_selectionName","_damage","_source","_projectile"];
			_unit = _this select 0;
			_selectionName = _this select 1;
			_damage = _this select 2;
			_source = _this select 3;
			_projectile = _this select 4;

			_damage = (_damage/4);
			systemChat format["PREDICTED: %1",((damage player)-_damage)];
			[] spawn {
				_dmg = (damage player);
				waitUntil {(damage player) != _dmg};
				systemChat format["ACTUAL: %1",(damage player)];
			};
			_damage;
		};
	}];

//-----------------------------------

