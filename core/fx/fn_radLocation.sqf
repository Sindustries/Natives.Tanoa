/*
	Radioactive Location Script
	By Sinbane
	Checks if the player is inside the radius of a radiation zone
*/
private ["_pos","_size","_priority", "_effect", "_handle"];
//-----------------------------------
//-VARIABLES

_priority = 1000;
_radEffect = [0.4, 0.4, 0,-0.2, 0, 0.2, -0.2,5, 2, 1.5, 2,-1.1, -0.05, 0.5, 0];
_defEffect = [1, 1, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0.299, 0.587, 0.114, 0];

//-----------------------------------
while {alive player} do {
//-----------------------------------

	waitUntil {sleep 3; !(isNil "NATnativeZones") && count NATnativeZones > 0};

	{
		if ((_x select 1) distance2D player < (_x select 2 select 0)) then {
			while {
				_handle = ppEffectCreate ["ColorCorrections", _priority];
				_handle < 0;
			} do {
				_priority = _priority + 1;
			};
			_handle ppEffectEnable true;
			_handle ppEffectAdjust _radEffect;
			_handle ppEffectCommit 8+(random 4);
			_ambient = [] spawn {
				sleep 120+(random 120);
				while {true} do {
					[[random 10,random 10,-1],[1.0, 0.9, 0.8],0.02+random 0.2] spawn NAT_fnc_radFXdust;
					playSound selectRandom ["ambient_com","ambient_fantoma","ambient_fundal","ambient_hall","ambient_industrial","ambient_jet","ambient_spike","ambient_steps","ambient_tehnic","ambient_vuumm","ambient_wind"];
					sleep 120+(random 120);
				};
			};
			waitUntil {ppEffectCommitted _handle};
			waitUntil {sleep 3; (_x select 1) distance2D player > (_x select 2 select 0) || !(_x in NATnativeZones)};
			_handle ppEffectAdjust _defEffect;
			_handle ppeffectcommit 8+(random 4);
			waitUntil {ppEffectCommitted _handle};
			_handle ppEffectEnable false;
			ppEffectDestroy _handle;
			terminate _ambient;
		};
		sleep 0.01;
	} forEach NATnativeZones;

	sleep 3;

//-----------------------------------
};