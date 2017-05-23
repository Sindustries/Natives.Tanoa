/*
	fn_gaskMask
	Author: Sinbane
	Displays an overlay and plays sounds while the unit is wearing a gas mask
*/
params [
	["_unit",objNull]
];
if (isNull _unit) exitWith {};
if (_unit != player && !((headgear _unit) in NATgasMasks) && !((goggles _unit) in NATgasMasks)) exitWith {};

if (_unit isEqualTo player) then {
	waitUntil {(player getVariable "NATspawned") isEqualTo true};
	waitUntil {sleep 1; (headgear _unit) in NATgasMasks || (goggles _unit) in NATgasMasks};
	["NATnotification",["HINT","USE SHIFT+H TO TOGGLE GAS MASK","i"]] call bis_fnc_showNotification;
};
if ((_unit getVariable "NATgasMask") isEqualTo true) exitWith {};

_unit setVariable ["NATgasMask",true];

while {alive _unit} do {
//-----------------------------------

	waitUntil {sleep 1; (headgear _unit) in NATgasMasks || (goggles _unit) in NATgasMasks || _unit distance player > 100};
	if (_unit distance player > 100) exitWith {_unit setVariable ["NATgasMask",false]};
	if ((headgear player) in NATgasMasks) then {
		player setVariable ["NATsavedHeadgear",(headgear player),false];
	};
	if ((goggles player) in NATgasMasks) then {
		player setVariable ["NATsavedGoggles",(goggles player),false];
	};

	_unit say3D ["echipare",14];
	if (_unit isEqualTo player) then {
		("HVPGasMaskLayer" call BIS_fnc_rscLayer) cutRsc ["equipment_prot","PLAIN",-1,false];
	};
	sleep 2.5;

	[_unit] spawn {
		_unit = _this select 0;
		while {(headgear _unit) in NATgasMasks || (goggles _unit) in NATgasMasks && alive _unit} do {
			if (_unit distance player > 100) exitWith {_unit setVariable ["NATgasMask",false]};
			_int_b = linearConversion [0, 1,(getFatigue _unit), 5, 0, true];
			_unit say3D ["breath",10];
			sleep (2 + _int_b);
		};
	};

	waitUntil {sleep 1; !((headgear _unit) in NATgasMasks) && !((goggles _unit) in NATgasMasks) || !alive _unit || _unit distance player > 100};
	if (_unit distance player > 100) exitWith {_unit setVariable ["NATgasMask",false]};
	_unit say3D ["dezechipare",14];
	if (_unit isEqualTo player) then {
	 	("HVPGasMaskLayer" call BIS_fnc_rscLayer) cutfadeout 0;
	};

	sleep 0.1;

//-----------------------------------
};