/*
    fn_campDestroy;
    Author: Sinbane

    Description:
    Destroys the selected camping object
*/
private ["_time"];
params [
	["_obj",objNull],
	["_unit",objNull]
];

if (isNull _obj || isNull _unit) exitWith {};
if (_unit != player) exitWith {};
if (NATaction) exitWith {};

NATaction = true;

//-----------------------------------

_time = ((getNumber (configfile >> "CfgVehicles" >> (typeOf _obj) >> "mapSize"))*(5+floor(random 5)));

while {_time > 0 && alive player && vehicle player isEqualTo player} do {
	player playMove "Acts_carFixingWheel";
	sleep 1;
	_time = _time - 1;
};

if (alive player && vehicle player isEqualTo player) then {
	player switchMove "AidlPercMstpSrasWrflDnon_G01";
	_obj removeAction (_obj getVariable "NATcampAction");
	deleteVehicle _obj;
};

NATaction = false;

//-----------------------------------
//-ADD TO vINV
private "_item";
switch (typeOf _obj) do {
	case "Land_TentA_F": {
		_item = "zk_tent";
	};
	case "Land_Sleeping_bag_blue_F": {
		_item = "sc_bedroll";
	};
	case "Land_Campfire_F": {
		_item = "";
	};
};

if (_item != "") then {
	[_item,1,true] call NAT_fnc_vInvAdjust;
};

//-----------------------------------