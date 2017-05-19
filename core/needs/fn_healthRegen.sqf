/*
	fn_healthRegen
	Author: Sinbane
	Description:
	Slowly regens health
*/

params [
	["_time",0],
	["_value",0]
];

if (_time <= 0 || _value <= 0) exitWith {};

while {alive player} do {
//-----------------------------------

	sleep _time;
	if (player getVariable "NATneedsHealthy" isEqualTo true) then {
		if (damage player > 0) then {
			player setDamage ((damage player)-_value);
		};
	};
	if ((player getVariable ["NATneedsDamageModif",1]) < 1) then {
		player setVariable ["NATneedsDamageModif",((player getVariable ["NATneedsDamageModif",1])+(random 0.001))];
	};
	if ((player getVariable ["NATneedsDamageModif",1]) > 1) then {
		player setVariable ["NATneedsDamageModif",0];
	};
};
//-----------------------------------