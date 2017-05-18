/*
    fn_interact
    Author: Sinbane

    Description:
    Opens the interact menu
*/
//-----------------------------------
private [];
params [
	["_obj",objNull],
	["_type",""]
];
if (!alive player || lifeState player in ["DEAD","DEAD-RESPAWN","DEAD-SWITCHING","INCAPACITATED"]) exitWith {};
if (isNull _obj || _type isEqualTo "") exitWith {};
disableSerialization;
//-----------------------------------
_display = findDisplay 1650;
_Btn1 = _display displayCtrl 1600;
_Btn2 = _display displayCtrl 1601;
_Btn3 = _display displayCtrl 1602;
_Btn4 = _display displayCtrl 1603;
_Btn5 = _display displayCtrl 1604;
_Btn6 = _display displayCtrl 1605;
_Btn7 = _display displayCtrl 1606;
_Btn8 = _display displayCtrl 1607;
_Btn9 = _display displayCtrl 1608;
_Btn10 = _display displayCtrl 1609;
_Btn11 = _display displayCtrl 1610;
_Btn12 = _display displayCtrl 1611;
_wheelList = _display displayCtrl 1500;
//-----------------------------------
{_x ctrlShow false} forEach [_Btn1,_Btn2,_Btn3,_Btn4,_Btn5,_Btn6,_Btn7,_Btn8,_Btn9,_Btn10,_Btn11,_Btn12];
//-----------------------------------
switch (_type) do {
//-----------------------------------
//VEHICLE INTERACTION
case "land": {
	selectedVeh = _obj;
	//REFUEL
	_Btn1 ctrlShow true;
	_Btn1 ctrlSetText "REFUEL";
	if (["sc_fuelcan"] call NAT_fnc_vInvCheck) then {
		_Btn1 buttonSetAction "";
	} else {
		_Btn1 ctrlEnable false;
		_Btn1 ctrlSetTooltip "Required item(s): Full Fuel Can";
	};

	//REPAIR ENGINE
	private ["_engineDamage"];
	{
		_hit = selectedVeh getHit _x;
		if (!(isNil "_hit")) then {
			_engineDamage = _hit;
		};
	} forEach ["motor","engine_hit","Engine_hitpoint","engine"];
	/*
		ENGINE DAMAGE INFO
		>= 0.33 - YELLOW INDICATOR
		>= 0.66 - RED INDICATOR
		> 0.9 - DIES
	*/
	_Btn2 ctrlShow true;
	_Btn2 ctrlSetText "REPAIR ENGINE";
	if (_engineDamage >= 0.33) then {
		if (["sc_carbattery"] call NAT_fnc_vInvCheck && ["sc_wires"] call NAT_fnc_vInvCheck) then {
			if (["zk_wrench"] call NAT_fnc_vInvCheck || ["zk_pliers"] call NAT_fnc_vInvCheck) then {
				if (!NATaction) then {
					_Btn2 buttonSetAction "[selectedVeh,1] spawn NAT_fnc_repairAction";
				} else {
					_Btn2 ctrlEnable false;
				};
			} else {
				_Btn2 ctrlEnable false;
				_Btn2 ctrlSetTooltip "Required item(s): Wrench or Pliers";
			};
		} else {
			_Btn2 ctrlEnable false;
			_Btn2 ctrlSetTooltip "Required item(s): Car Battery and Wires";
		};
	} else {
		_Btn2 ctrlEnable false;
		_Btn2 ctrlSetTooltip "Engine doesn't require repairs";
	};

	//REPAIR WHEELS
	private ["_index"];
	lbClear _wheelList;
	{
		_hit = selectedVeh getHit _x;
		if (!(isNil "_hit")) then {
			_index = _wheelList lbAdd format ["WHEEL %1",(lbSize _wheelList+1)];
			_wheelList lbSetData [_index,_x];
			if (_hit <= 0.2) then {
				_wheelList lbSetColor [_index, [0,1,0,1]];
			};
			if (_hit > 0.2 && _hit <= 0.65) then {
				_wheelList lbSetColor [_index, [1,0.6,0,1]];
			};
			if (_hit > 0.65) then {
				_wheelList lbSetColor [_index, [1,0,0,1]];
			};
		};
	} forEach ["wheel_1_1_steering","wheel_1_4_steering","wheel_1_3_steering","wheel_1_2_steering","wheel_2_1_steering","wheel_2_4_steering","wheel_2_3_steering","wheel_2_2_steering","track_l_hit","track_r_hit"];
	/*
		WHEEL DAMAGE INFO
		> 0.2 = FLAT, WIGGLY MOVEMENT
		> 0.65 = INDICATER TURNS YELLOW
		1 = DESTROYED
	*/
	_Btn3 ctrlShow true;
	_Btn3 ctrlSetText "REPAIR WHEEL";
	if (lbSize _wheelList > 0) then {
		if (["sc_tire"] call NAT_fnc_vInvCheck && ["sc_tire_iron"] call NAT_fnc_vInvCheck) then {
			_Btn3 buttonSetAction "[selectedVeh,2,(lbData [1500, (lbCurSel 1500)])] spawn NAT_fnc_repairAction";
			if (!NATaction) then {
				_Btn3 ctrlEnable true;
			} else {
				_Btn3 ctrlEnable false;
			};
		} else {
			_Btn3 ctrlEnable false;
			_Btn3 ctrlSetTooltip "Required item(s): Tire Iron & Tire";
		};
	} else {
		_Btn3 ctrlEnable false;
		_Btn3 ctrlSetTooltip "No wheels found";
	};

	//FLIP
	_Btn4 ctrlShow true;
	_Btn4 ctrlSetText "UN-FLIP";
	_Btn4 buttonSetAction "selectedVeh setPos [(getPos selectedVeh select 0),(getPos selectedVeh select 1),1]";
};
//-----------------------------------
	case "pump": {
		selectedVeh = nearestObject [(getPos player), "car"];
		_pump = _obj;

		//REFUEL VEHICLE
		_Btn1 ctrlShow true;
		_Btn1 ctrlSetText "REFUEL VEHICLE";
		if (player distance selectedVeh > 3.5 || player distance _pump > 3.5) then {
			_Btn1 ctrlEnable false;
			_Btn1 ctrlSetTooltip "TOO FAR FROM VEHICLE";
		} else {
			_Btn1 buttonSetAction "closeDialog 0; [1,selectedVeh] spawn NAT_fnc_refuelAction"
		};

		//REFILL FUEL CAN
		_Btn6 ctrlShow true;
		_Btn6 ctrlSetText "FILL FUEL CAN";
		if (["zk_e_fuelcan"] call NAT_fnc_vInvCheck) then {
			if (player distance _pump > 3.5) then {
				_Btn6 ctrlEnable false;
				_Btn6 ctrlSetTooltip "TOO FAR FROM FUEL PUMP";
			} else {
				_Btn6 buttonSetAction "closeDialog 0; [2] spawn NAT_fnc_refuelAction"
			};
		} else {
			_Btn6 ctrlEnable false;
			_Btn6 ctrlSetTooltip "Required Item(s): Empty Fuel Can"
		};
	};
//-----------------------------------
};