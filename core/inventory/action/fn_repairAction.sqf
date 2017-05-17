/*
   	fn_repairAction
    Author: Sinbane

    Description:
   	Repairs vehicle part
*/
private ["_wheel","_use","_items"];
params [
	["_veh",objNull],
	["_type",0],
	["_wheel",""]
];
if (isNull _veh || _type isEqualTo 0) exitWith {};
_use = false;
_items = [];
NATaction = true;
closeDialog 0;
//-----------------------------------
switch (_type) do {
	case 1: {
		_use = true;
		_items = ["sc_carbattery","sc_wires"];
		_time = (20+(random 20));
		while {_time > 0 && alive player && vehicle player isEqualTo player} do {
			player playMove "Acts_carFixingWheel";
			player setDir ([player, _veh] call BIS_fnc_dirTo);
			_hit = (1-(1/_time));
			if (_hit < 0.9) then {
				{_veh setHit [_x,_hit]} forEach ["motor","engine_hit","Engine_hitpoint","engine","palivo","Fuel_hitpoint"];
			} else {
				{_veh setHit [_x,0.9]} forEach ["motor","engine_hit","Engine_hitpoint","engine","palivo","Fuel_hitpoint"];
			};
			sleep 1;
			_time = _time - 1;
		};
		{_veh setHit [_x,0]} forEach ["motor","engine_hit","Engine_hitpoint","engine","palivo","Fuel_hitpoint"];
		player switchMove "AidlPercMstpSrasWrflDnon_G01";
		systemChat "ENGINE REPAIRS SUCCESSFUL";
		showChat true;
	};
	case 2: {
		_use = true;
		_items = ["sc_tire"];
		_time = (10+(random 10));
		while {_time > 0 && alive player && vehicle player isEqualTo player} do {
			player playMove "Acts_carFixingWheel";
			player setDir ([player, _veh] call BIS_fnc_dirTo);
			_hit = (1-(1/_time));
			_veh setHit [_wheel,_hit];
			sleep 1;
			_time = _time - 1;
		};
		_veh setHit [_wheel,0];
		player switchMove "AidlPercMstpSrasWrflDnon_G01";
		systemChat "WHEEL REPAIR SUCCESSFUL";
		showChat true;
	};
};
//-----------------------------------
if (_use) then {
	{[_x,1,false] call NAT_fnc_vInvAdjust} forEach _items;
};
NATaction = false;
//-----------------------------------