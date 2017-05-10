/*
	fn_gaskMask
	Author: Sinbane
	Displays an overlay and plays sounds while the unit is wearing a gas mask
*/
params [
	["_unit",objNull]
];
if (isNull _unit) exitWith {};

if (_unit isEqualTo player) then {
	waitUntil {(headgear _unit) in NATgasMasks || (goggles _unit) in NATgasMasks};
	["NATnotification",["HINT","USE SHIFT+H TO TOGGLE GAS MASK"]] call bis_fnc_showNotification;
};

while {alive _unit} do {
//-----------------------------------

	waitUntil {(headgear _unit) in NATgasMasks || (goggles _unit) in NATgasMasks};
	[_unit,["echipare",14]] remoteExec ["say3D", 0];
	if (_unit isEqualTo player) then {
		"HVPGasMaskLayer" cutRsc ["equipment_prot","PLAIN",-1,false];
	};
	sleep 2.5;

	[_unit] spawn {
		_unit = _this select 0;
		while {(headgear _unit) in NATgasMasks || (goggles _unit) in NATgasMasks && alive _unit} do {
			_int_b = linearConversion [0, 1,(getFatigue _unit), 5, 0, true];
			[_unit,["breath",10]] remoteExec ["say3D", 0];
			sleep (2 + _int_b);
		};
	};

	waitUntil {!((headgear _unit) in NATgasMasks) && !((goggles _unit) in NATgasMasks) || !alive _unit};
	[_unit,["dezechipare",14]] remoteExec ["say3D", 0];
	if (_unit isEqualTo player) then {
	 	"HVPGasMaskLayer" cutfadeout 0;
	};

	sleep 0.1;

//-----------------------------------
};