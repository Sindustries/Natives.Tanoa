/*
	fn_fuelStation
	Author: Sinbane
	Description:
	Handles the refuelling process
*/
if ((player getVariable ["NAT_pumpingFuel",false]) isEqualTo true) exitWith {};
private ["_pump","_veh","_cost","_totalCost"];

_veh = nearestObject [(getPos player), "car"];
_pump = cursorObject;

//-----------------------------------
player setVariable ["NAT_pumpingFuel",true];
//-----------------------------------
//-Refuel
private ["_counter","_fuel"];
_fuel = fuel _veh;
_counter = (1-_fuel);
while {_fuel < 1 && player distance _pump < 3.5 && vehicle player isEqualTo player} do {
	player playMove "Acts_carFixingWheel";
	player setDir ([_pump, _veh] call BIS_fnc_dirTo);

	_refuel = (_fuel + (random 0.025));
	[_veh,_refuel] remoteExec ["setFuel", 0];
	_fuel = fuel _veh;
	_msg = format ["REFUELING: %1%2",([(_fuel*100),2] call BIS_fnc_cutDecimals),"%"];
	sleep 0.1;
	titleText [_msg, "PLAIN", 0.5];

	sleep 0.1;
};
//-----------------------------------
titleText ["", "PLAIN", 0.5];
player switchMove "AidlPercMstpSrasWrflDnon_G01";
player setVariable ["NAT_pumpingFuel",false];
//-----------------------------------