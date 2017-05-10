/*
	fn_healthRegen
	Author: Sinbane
	Description:
	Slowly regens health
*/
while {alive player} do {
//-----------------------------------

	sleep ((86400/timeMultiplier)/1440);
	if (damage player > 0) then {
		player setDamage ((damage player)-(1/1440));
	};
};
//-----------------------------------