/*
    fn_needsHunger
    Author: Sinbane

    Description:
    Monitors the player hunger level
*/
while {alive player} do {
//-----------------------------------

	if ((player getVariable ["NATneedsHunger",0]) >= 1) then {
		player setDamage 1;
	};

	sleep (((21600/timeMultiplier)/1440)*(player getVariable ["NATneedsHungerMult",1]));
	player setVariable ["NATneedsHunger",((player getVariable ["NATneedsHunger",0])+(1/1440))];

	if ((player getVariable ["NATneedsHungerMult",1]) < 1 || (player getVariable ["NATneedsHungerMult",1]) > 1) then {
		if ((player getVariable ["NATneedsHungerMult",1]) < 1) then {
			player setVariable ["NATneedsHungerMult",((player getVariable ["NATneedsHungerMult",1])+0.01)];
		};
		if ((player getVariable ["NATneedsHungerMult",1]) > 1) then {
			player setVariable ["NATneedsHungerMult",((player getVariable ["NATneedsHungerMult",1])-0.01)];
		};
	};
};

//-----------------------------------