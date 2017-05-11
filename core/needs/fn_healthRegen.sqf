/*
	fn_healthRegen
	Author: Sinbane
	Description:
	Slowly regens health
*/
while {alive player} do {
//-----------------------------------

	sleep (24*60*60/timeMultiplier/3600);
	if (player getVariable "NATneedsHealthy" isEqualTo true) then {
		if (damage player > 0) then {
			player setDamage ((damage player)-(1/3600));
		};
	};
};
//-----------------------------------