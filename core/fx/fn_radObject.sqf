/*
	Radioactive Object Script
	By Sinbane
	Checks if the player is inside the radius of a radiation zone
*/
private [];
//-----------------------------------
//-VARIABLES

//-----------------------------------
while {alive player} do {
//-----------------------------------

	{
		if ((_x select 0) distance player < ((_x select 1)/2)) then {

			while {(_x select 0) distance player < ((_x select 1)/2)} do {
				playsound "geiger";
				if ((headgear player) in NATgasMasks || (goggles player) in NATgasMasks) then {sleep 4} else {
					_noise_rad = ppEffectCreate ["FilmGrain", 2000];
					_noise_rad ppEffectEnable true;
					_noise_rad ppEffectAdjust[0.1,0.1,0.5,0.3,0.3,true];
					_noise_rad ppEffectCommit 0;
					enableCamShake true;
					addCamShake [1, 3, 17];
					player setDamage ((damage player)+0.005);
					[player,["cough",10]] remoteExec ["say3D", 0];
					sleep 4;
					_noise_rad ppEffectEnable false;
				};
			};
		};
	} forEach NATRadioActiveObjects;

	sleep 1;

//-----------------------------------
};