/*
	fn_gaskMask
	Author: Sinbane
	Displays an overlay and plays sounds while player is wearing a gas mask
*/
while {alive player} do {
//-----------------------------------

	waitUntil {(headgear player) in NATgasMasks || (goggles player) in NATgasMasks};
	[player,["echipare",14]] remoteExec ["say3D", 0];
	"HVPGasMaskLayer" cutRsc ["equipment_prot","PLAIN",-1,false];
	sleep 2.5;

	[] spawn {
		while {(headgear player) in NATgasMasks || (goggles player) in NATgasMasks && alive player} do {
			_int_b = linearConversion [0, 1,(getFatigue player), 5, 0, true];
			[player,["breath",10]] remoteExec ["say3D", 0];
			sleep (2 + _int_b);
		};
	};

	waitUntil {!((headgear player) in NATgasMasks) && !((goggles player) in NATgasMasks) || !alive player};
	[player,["dezechipare",14]] remoteExec ["say3D", 0];
	 "HVPGasMaskLayer" cutfadeout 0;

	sleep 0.1;

//-----------------------------------
};