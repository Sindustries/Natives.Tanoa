/*
	fn_refuelAction
	Author: Sinbane
	Description:
	Handles the refuelling process for vehicles and fuel cans
*/
private [];
params [
	["_type",0],
	["_veh",objNull]
];

if ((player getVariable ["NAT_pumpingFuel",false]) isEqualTo true || _type isEqualTo 0) exitWith {};

_pump = cursorObject;

//-----------------------------------
player setVariable ["NAT_pumpingFuel",true];
//-----------------------------------
switch (_type) do {
	//REFUEL VEHICLE
	case 1: {
		if (isNull _veh) exitWith {};
		private ["_fuel"];
		_fuel = fuel _veh;
		while {_fuel < 1 && player distance _pump < 3.5 && vehicle player isEqualTo player} do {
			player playMove "Acts_carFixingWheel";
			player setDir ([_pump, _veh] call BIS_fnc_dirTo);

			_refuel = (_fuel + (random 0.025));
			[_veh,_refuel] remoteExec ["setFuel", 0];
			_fuel = fuel _veh;
			_msg = format ["REFUELING: %1%2",([(_fuel*100),2] call BIS_fnc_cutDecimals),"%"];
			titleText [_msg, "PLAIN", 0.5];
			sleep 0.1;
		};
	};
	//FILL EMPTY FUEL CANS
	case 2: {
		private ["_fuel","_cans"];
		_cans = true;
		while {_cans && player distance _pump < 3.5 && vehicle player isEqualTo player} do {
			if (["zk_e_fuelcan"] call NAT_fnc_vInvCheck) then {
				_fuel = 0;
				while {_fuel < 10} do {
					player playMove "Acts_carFixingWheel";
					player setDir ([player, _pump] call BIS_fnc_dirTo);

					_refuel = (_fuel + (random 0.025));
					_fuel = _fuel + _refuel;
					_msg = format ["FILLING FUEL CAN"];
					titleText [_msg, "PLAIN", 0.5];
					sleep 0.1;
				};
				["sc_fuelcan",1,true] call NAT_fnc_vInvAdjust;
				["zk_e_fuelcan",1,false] call NAT_fnc_vInvAdjust;
			} else {
				_cans = false;
			};
		};
	};
};

titleText ["", "PLAIN", 0.5];
player switchMove "AidlPercMstpSrasWrflDnon_G01";
player setVariable ["NAT_pumpingFuel",false];
//-----------------------------------