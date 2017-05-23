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

	if (player getVariable "NATneedsHealthy" isEqualTo true) then {
		if (damage player > 0) then {
			player setDamage ((damage player)-_value);
		};
	};
	_math = ((1-(damage player))*100);
	NATneedsHealthPerc = [_math,0] call BIS_fnc_cutDecimals;

	if ((player getVariable ["NATneedsDamageModif",1]) < 1) then {
		player setVariable ["NATneedsDamageModif",((player getVariable ["NATneedsDamageModif",1])+(random 0.001))];
	};
	if ((player getVariable ["NATneedsDamageModif",1]) > 1) then {
		player setVariable ["NATneedsDamageModif",0];
	};
	sleep _time;
};
//-----------------------------------