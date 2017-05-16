/*
	fn_baseMenu
	Author: Sinbane
	Opens the base menu
*/
/*
if (!alive player || lifeState player in ["DEAD","DEAD-RESPAWN","DEAD-SWITCHING","INCAPACITATED"]) exitWith {};
disableSerialization;
createDialog "NAT_baseMenu";
waitUntil {dialog};
*/
disableSerialization;
_display = findDisplay 4040;

_unitReqBtn = _display displayCtrl 1600;
_unitsList = _display displayCtrl 1500;
_vehList = _display displayCtrl 1501;
_vehReqBtn = _display displayCtrl 1601;

_foodIcon = _display displayCtrl 1200;
_waterIcon = _display displayCtrl 1201;
_scrapIcon = _display displayCtrl 1202;
_foodTXT = _display displayCtrl 1000;
_waterTXT = _display displayCtrl 1001;
_scrapTXT = _display displayCtrl 1002;

_sideBarBtn1 = _display displayCtrl 1602;
_sideBarBtn2 = _display displayCtrl 1603;
_sideBarBtn3 = _display displayCtrl 1604;
_sideBarBtn4 = _display displayCtrl 1605;
_sideBarBtn5 = _display displayCtrl 1606;
_sideBarBtn6 = _display displayCtrl 1607;
_sideBarBtn7 = _display displayCtrl 1608;

_forceTXT = _display displayCtrl 1003;
_forceNUM = _display displayCtrl 1004;
_sidebarTXT2 = _display displayCtrl 1005;
_sidebarNUM2 = _display displayCtrl 1006;

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
		_format = format["[f%1 w%2] %3",_foodCost,_waterCost,_name];
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
		_format = format["[%1] %2",_cost,_name];
		_index = _vehList lbAdd _format;
		//_vehList lbSetPicture [_index, _iconPath];
	};
};
//-----------------------------------
_unitReqBtn ctrlSetText "RECRUIT UNIT";
_unitReqBtn ctrlSetTooltip "Request selected unit from list above (RECRUITING CAN TAKE UP TO 1 MINUTE)";
_unitReqBtn buttonSetAction "[1] call NAT_fnc_baseRequest";
//-----------------------------------
_vehReqBtn ctrlSetText "BUILD VEHICLE";
_vehReqBtn ctrlSetTooltip "Build selected vehicle from list above (BUILD TIME IS SCRAP COST DIVIDED BY 3)";
_vehReqBtn buttonSetAction "[2] call NAT_fnc_baseRequest";
//-----------------------------------
/* RESOURCES */
_foodIcon ctrlSetText "GUI\img\meat.paa";
_waterIcon ctrlSetText "GUI\img\water.paa";
_scrapIcon ctrlSetText "\scorch_invitems\images\scrap.paa";
_foodTXT ctrlSetText format["%1",NATresFood];
_waterTXT ctrlSetText format["%1",NATresWater];
_scrapTXT ctrlSetText format["%1",NATresScrap];
//-----------------------------------
/* MISSIONS BUTTON */
_sideBarBtn1 ctrlSetText "MISSIONS";
if (isServer) then {
	_sideBarBtn1 ctrlSetTooltip "Find a mission";
	//_sideBarBtn1 buttonSetAction "[2] call NAT_fnc_baseRequest";
} else {
	_sideBarBtn1 ctrlEnable false;
	_sideBarBtn1 ctrlSetTooltip "Find a mission - HOST ONLY";
};
//-----------------------------------
/* BASE STORAGE BUTTON */
_sideBarBtn2 ctrlSetText "OPEN STORAGE";
_sideBarBtn2 ctrlSetTooltip "Opens the base storage";
_sideBarBtn2 buttonSetAction "";
//-----------------------------------
/* REARM SQUAD BUTTON */
_sideBarBtn3 ctrlSetText "REARM SQUAD";
_sideBarBtn3 ctrlSetTooltip "Re-equips your AI squadmates with more ammo (1 SCRAP PER UNIT)";
_sideBarBtn3 buttonSetAction "";
//-----------------------------------
/* REARM BASE BUTTON */
_sideBarBtn4 ctrlSetText "REARM BASE";
_sideBarBtn4 ctrlSetTooltip "Re-equips base defences with more ammo (5 SCRAP PER DEFENCE, 1 SCRAP PER UNIT)";
_sideBarBtn4 buttonSetAction "";
//-----------------------------------
{_x ctrlShow false} forEach [_sideBarBtn5,_sideBarBtn6,_sideBarBtn7];
//-----------------------------------