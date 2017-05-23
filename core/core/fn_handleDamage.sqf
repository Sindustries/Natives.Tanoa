/*
	fn_handleDamage
	Author: Sinbane
	Description:
	Intercepts incoming damage
*/
//-----------------------------------

player removeAllEventHandlers "handleDamage";

player addEventHandler ["handleDamage",{
	private ["_return","_passedDamage"];
	_unit = _this select 0;
	_selection = _this select 1;
	_passedDamage = _this select 2;
	_source = _this select 3;
	_projectile = _this select 4;
	_selections = ["head","body","arms","legs"];

	if (!(_selection in _selections)) then {
		_return = 0;
	} else {
		_return = ((_passedDamage/4)*(player getVariable ["NATneedsDamageModif",1]));
		if (DebugMode) then {
			systemChat format["handleDamage :: HIT: %1 | RAW: %2 | MODIFIER: %3",_selection,_passedDamage,_return];
		};
	};

	if (DebugMode) then {
		_return = 0;
	};

	_return;
}];

//-----------------------------------