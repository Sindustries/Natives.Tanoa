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

	systemChat format["handleDamage :: RAW: %1",_passedDamage];

	_return = ((_passedDamage/4)*(player getVariable ["NATneedsDamageModif",1]));

	systemChat format["handleDamage :: WITH MODIFIER: %1",_return];

	if (DebugMode) then {
		_return = 0;
	};
	if (!(_selection in _selections)) then {
		_return = 0;
	};

	_return;
}];

//-----------------------------------