/*
	fn_baseMenu
	Author: Sinbane
	Opens the base menu
*/
params [
	["_type","land"]
];
disableSerialization;
_display = findDisplay 4040;

_topTXT = _display displayCtrl 1100;
_forceTXT = _display displayCtrl 1104;
_scrapTXT = _display displayCtrl 1103;
_waterTXT = _display displayCtrl 1102;
_foodTXT = _display displayCtrl 1101;

_scrapIcon = _display displayCtrl 1202;
_waterIcon = _display displayCtrl 1201;
_foodIcon = _display displayCtrl 1200;

_vehList = _display displayCtrl 1501;
_vehReqBtn = _display displayCtrl 1601;

_unitsList = _display displayCtrl 1500;
_unitReqBtn = _display displayCtrl 1600;

_sideBarBtn1 = _display displayCtrl 1604;
_sideBarBtn2 = _display displayCtrl 1605;
_sideBarBtn3 = _display displayCtrl 1606;
_sideBarBtn4 = _display displayCtrl 1607;
_sideBarBtn5 = _display displayCtrl 1608;
_sideBarBtn6 = _display displayCtrl 1609;
_sideBarBtn7 = _display displayCtrl 1610;
_closeBtn = _display displayCtrl 1602;

_topTXT ctrlSetStructuredText parseText format["<t align='center' size='0.9' font='PuristaMedium'>BASE REQUESTER</t>"];
//-----------------------------------
private ["_grpPlayers"];
_grpPlayers = {!isPlayer _x && alive _x} count (units group player);
//-----------------------------------
/* UNIT & VEHICLE LIST */
lbClear _unitsList;
lbClear _vehList;
if (count NATbaseUnitRequest > 0) then {
	for "_i" from 0 to ((count NATbaseUnitRequest)-1) do {
		_entry = (NATbaseUnitRequest select _i);
		_name = (_entry select 0);
		_classes = (_entry select 1);
		_foodCost = (_entry select 2);
		_waterCost = (_entry select 3);
		_format = format["[%1 Food | %2 Water] %3",_foodCost,_waterCost,_name];
		_index = _unitsList lbAdd _format;
		//_vehList lbSetPicture [_index, _iconPath];
	};
};
if (count NATbaseVehicleRequest > 0) then {
	for "_i" from 0 to ((count NATbaseVehicleRequest)-1) do {
		_entry = (NATbaseVehicleRequest select _i);
		_name = (_entry select 0);
		_classes = (_entry select 1);
		_cost = (_entry select 2);
		_format = format["[%1 Scrap] %2",_cost,_name];
		_index = _vehList lbAdd _format;
		_vehList lbSetData [_index,"land"];
		//_vehList lbSetPicture [_index, _iconPath];
	};
};
if (_type isEqualTo "shore" && count NATbaseBoatRequest > 0) then {
	for "_i" from 0 to ((count NATbaseBoatRequest)-1) do {
		_entry = (NATbaseBoatRequest select _i);
		_name = (_entry select 0);
		_classes = (_entry select 1);
		_cost = (_entry select 2);
		_format = format["[%1 Scrap] %2",_cost,_name];
		_index = _vehList lbAdd _format;
		_vehList lbSetData [_index,"sea"];
		//_vehList lbSetPicture [_index, _iconPath];
	};
};
//-----------------------------------
_unitReqBtn ctrlSetText "RECRUIT UNIT";
_unitReqBtn ctrlSetTooltip "Request selected unit from list above (RECRUITING CAN TAKE UP TO 1 MINUTE)";
_unitReqBtn buttonSetAction "[1] call NAT_fnc_baseRequest";
//-----------------------------------
_vehReqBtn ctrlSetText "BUILD VEHICLE";
_vehReqBtn buttonSetAction "[2] call NAT_fnc_baseRequest";
_vehReqBtn ctrlSetTooltip "Build selected vehicle from list above (BUILD TIME IS SCRAP COST DIVIDED BY 3)";
//-----------------------------------
/* RESOURCES */
_foodIcon ctrlSetText "GUI\img\meat.paa";
_waterIcon ctrlSetText "GUI\img\water.paa";
_scrapIcon ctrlSetText "\scorch_invitems\images\scrap.paa";
//_forceTXT  ctrlSetText "\A3\ui_f\data\igui\cfg\simpleTasks\types\attack_ca.paa";		Centered Text
_foodTXT ctrlSetStructuredText parseText format["<t align='center' size='0.9' font='PuristaMedium'>%1</t>",NATresFood];
_waterTXT ctrlSetStructuredText parseText format["<t align='center' size='0.9' font='PuristaMedium'>%1</t>",NATresWater];
_scrapTXT ctrlSetStructuredText parseText format["<t align='center' size='0.9' font='PuristaMedium'>%1</t>",NATresScrap];
_forceTXT ctrlSetStructuredText parseText format["<t align='center' size='0.9' font='PuristaMedium'>FORCE POWER: %1</t>",NATmilitaryForcePower];
//-----------------------------------
/* SAVE GAME BUTTON */
_sideBarBtn1 ctrlSetText "SAVE GAME";
if (isServer) then {
	_sideBarBtn1 buttonSetAction "closeDialog 0; [] call NAT_fnc_saveGame";
} else {
	_sideBarBtn1 ctrlEnable false;
	_sideBarBtn1 ctrlSetTooltip "HOST ONLY";
};
//-----------------------------------
/* MISSIONS BUTTON */
_sideBarBtn2 ctrlSetText "MISSIONS";
if (isServer) then {
	if (!NATmission) then {
		_sideBarBtn2 ctrlSetTooltip "Find a mission";
		_sideBarBtn2 buttonSetAction "closeDialog 0; [] call NAT_fnc_missionSelect;";
	} else {
		_sideBarBtn2 ctrlEnable false;
		_sideBarBtn2 ctrlSetTooltip "There is already a mission in progress";
	};
} else {
	_sideBarBtn2 ctrlEnable false;
	_sideBarBtn2 ctrlSetTooltip "HOST ONLY";
};
//-----------------------------------
/* ARSENAL BUTTON */
_sideBarBtn3 ctrlSetText "ARSENAL";
_sideBarBtn3 ctrlSetTooltip "Opens the virtual inventory";
_sideBarBtn3 buttonSetAction "closeDialog 0; [] spawn BIS_fnc_arsenal";
//-----------------------------------
/* REARM SQUAD BUTTON */
_sideBarBtn4 ctrlSetText "REARM SQUAD";
_sideBarBtn4 ctrlSetTooltip "Re-equips your AI squadmates with more ammo (1 SCRAP PER UNIT)";
_sideBarBtn4 buttonSetAction "[] call NAT_fnc_rearmSquad";
//-----------------------------------
/* REARM BASE BUTTON */
_sideBarBtn5 ctrlSetText "REARM BASE";
_sideBarBtn5 ctrlSetTooltip "Re-equips base defences with more ammo and replaces dead units with new recruits (5 SCRAP PER DEFENCE, 1 SCRAP PER UNIT, 1F/1W PER NEW RECRUIT)";
_sideBarBtn5 buttonSetAction "[1] call NAT_fnc_rearmBase";
//-----------------------------------
/* CLOSE BUTTON */
_closeBtn ctrlSetText "CLOSE";
_closeBtn buttonSetAction "closeDialog 0";
//-----------------------------------
{_x ctrlShow false} forEach [_sideBarBtn6,_sideBarBtn7];
//-----------------------------------