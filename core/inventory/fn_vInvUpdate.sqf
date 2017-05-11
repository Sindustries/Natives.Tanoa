/*
    fn_vInv_adjustInv
    Author: Sinbane

    Description:
   	Adds or removes selected item from vInventory
*/
private ["_itemList","_vInv"];
disableSerialization;

#define NATinvHPdisplay 3307
#define NATinvHGRdisplay 3233
#define NATinvTHRdisplay 3234
#define NATinvTarget 3309
#define NATinvItemList 3310
#define Btn1 3305
#define Btn2 3308

_display = findDisplay 3300;
_hpLevel = _display displayCtrl NATinvHPdisplay;
_hgrLevel = _display displayCtrl NATinvHGRdisplay;
_thrLevel = _display displayCtrl NATinvTHRdisplay;
_useTarget = _display displayCtrl NATinvTarget;
_itemList = _display displayCtrl NATinvItemList;
_Btn1 = _display displayCtrl Btn1;
_Btn2 = _display displayCtrl Btn2;
_vInv = (player getVariable ["NAT_vInv",[]]);

//-----------------------------------
//-TARGET BOX
lbClear _useTarget;
_index = _useTarget lbAdd (name player);
_useTarget lbSetCurSel _index;
{
	if (_x != player && isPlayer _x && alive _x && _x distance player < 6) then {
		_index = _useTarget lbAdd (name _x);
	};
} forEach playableUnits;
//-----------------------------------
//-INVENTORY
lbClear _itemList;
if (count (_vInv) > 0) then {
	{
		private ["_name","_iconPath"];
		for "_i" from 0 to (count (NATvInvItems)-1) do {
			if ((_x select 0) isEqualTo ((NATvInvItems select _i) select 1)) then {
				_name = ((NATvInvItems select _i) select 0);
				_iconPath = ((NATvInvItems select _i) select 2);
			};
		};
		_count = (_x select 1);
		_entry = format["%1x %2",_count,_name];
		_index = _itemList lbAdd _entry;
		_itemList lbSetPicture [_index, _iconPath];
		_itemList lbSetData [_index, (_x select 0)];
	} forEach _vInv;
	lbSort _itemList;
};
//-----------------------------------
//-HEALTH LEVEL
_math = ((1-(damage player))*100);
_math = [_math,0] call BIS_fnc_cutDecimals;
_hpLevel ctrlSetText format ["%1%2",_math,"%"];
//-----------------------------------
//-HUNGER LEVEL
_math = ((1-(player getVariable ["NATneedsHunger",0]))*100);
_math = [_math,0] call BIS_fnc_cutDecimals;
_hgrLevel ctrlSetText format ["%1%2",_math,"%"];
//-----------------------------------
//-THIRST LEVEL
_math = ((1-(player getVariable ["NATneedsThirst",0]))*100);
_math = [_math,0] call BIS_fnc_cutDecimals;
_thrLevel ctrlSetText format ["%1%2",_math,"%"];
//-----------------------------------
_Btn1 buttonSetAction "[] call NAT_fnc_vInvUse;";
_Btn2 buttonSetAction "[] call NAT_fnc_vInvDrop;";
//-----------------------------------
//-CONTROLS ENABLER
if (lbSize _itemList < 1 || NATaction) then {
	{
		_x ctrlEnable false;
	} forEach [_Btn1,_Btn2,_useTarget,_itemList];
} else {
	{
		_x ctrlEnable true;
	} forEach [_Btn1,_Btn2,_useTarget,_itemList];
};
//-----------------------------------