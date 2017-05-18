/*
	Radioactive Object Script
	By Sinbane
	Checks if the player is inside the radius of a radiation zone
*/
private [];
//-----------------------------------
//-VARIABLES

_cough = ["ryanzombiescough1","ryanzombiescough2","ryanzombiescough3","ryanzombiescough4","ryanzombiescough5","ryanzombiescough6","ryanzombiescough7","ryanzombiescough8","ryanzombiescough9","ryanzombiescough10","ryanzombiescough11","ryanzombiescough12","ryanzombiescough13","ryanzombiescough14"];

//-----------------------------------
while {alive player} do {
//-----------------------------------

	{
		if ((_x select 0) distance player < ((_x select 1)/2)) then {

			while {(_x select 0) distance player < ((_x select 1)/2)} do {
				if (["zk_multiMeter"] call NAT_fnc_vInvCheck) then {
					playsound "geiger";
				};
				if ((headgear player) in NATgasMasks || (goggles player) in NATgasMasks) then {sleep 4} else {
					[player,[(selectRandom _cough),20]] remoteExec ["say3D", 0];
					[7,1,(random 0.005)] call NAT_fnc_needsUpdate;
					sleep 4;
				};
			};
		};
	} forEach NATRadioActiveObjects;

	sleep 1;

//-----------------------------------
};