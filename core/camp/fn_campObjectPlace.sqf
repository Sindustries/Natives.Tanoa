/*
    fn_campObjectPlace
    Author: Sinbane

    Description:
    Allows player to place a camp item
*/
private ["_time","_xyz","_obj","_class"];
params [
	["_item",""]
];

if (isNil "_item") exitWith {};
if (vehicle player != player) exitWith {};

NATcampObjPlaceChoice = 0;
NATaction = true;

//-----------------------------------
switch (_item) do {
	case "zk_tent": {
		_class = "Land_TentA_F";
		_xyz = [0,2.7,0];
	};
	case "sc_bedroll": {
		_class = "Land_Sleeping_bag_blue_F";
		_xyz = [0,2,0.04];
	};
	case "zk_wood": {
		 _class = "Land_Campfire_F";
		_xyz = [0,2,0.2];
	};
};
//-----------------------------------
private "_placed";
_placed = false;
while {!_placed} do {
	_obj = _class createVehicle (getPos player);
	_obj attachTo [player,_xyz];
	_action1 = player addAction ["PLACE", { {detach _x} forEach (attachedObjects player); NATcampObjPlaceChoice = 1 }];
	_action2 = player addAction ["CANCEL", { {detach _x; deleteVehicle _x} forEach (attachedObjects player) }];
	waitUntil {!(_obj in attachedObjects player)};
	if (NATcampObjPlaceChoice isEqualTo 1) then {
		if ((getPosATL player select 2) >= 0.1 || ((getPos _obj) isFlatEmpty [-1,-1,1,5] isEqualTo [])) then {
			systemChat "This can't be done here!";
			showChat true;
			detach _obj;
			waitUntil {!(_obj in attachedObjects player)};
			deleteVehicle _obj;
		} else {
			private "_time";
			_time = ((getNumber (configfile >> "CfgVehicles" >> (typeOf _obj) >> "mapSize"))*(2+floor(random 2)));
			_obj hideObjectGlobal true;

			while {_time > 0 && alive player && vehicle player isEqualTo player} do {
				player playMove "Acts_carFixingWheel";
				sleep 1;
				_time = _time - 1;
			};
			if (alive player && vehicle player isEqualTo player) then {
				_obj hideObjectGlobal false;
				player switchMove "AidlPercMstpSrasWrflDnon_G01";
				_obj setPos [(getPos _obj select 0),(getPos _obj select 1),0];
				_obj allowDamage false;
				_cut = createVehicle ["Land_ClutterCutter_medium_F",(getPos _obj),[], 0, "can_collide"];
				[_obj] call NAT_fnc_campAddAction;
				_placed = true;
			};
		};
	} else {
		[_item,1,true] call NAT_fnc_vInvAdjust;
	};
	player removeAction _action1;
	player removeAction _action2;
};

NATaction = false;
NATcampObjPlaceChoice = nil;

//-----------------------------------