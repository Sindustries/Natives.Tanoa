/*
    fn_vInv_adjustInv
    Author: Sinbane

    Description:
   	Adds or removes selected item from vInventory
*/
private ["_itemList","_vInv"];
disableSerialization;

_display = findDisplay 3300;
_useBtn = _display displayCtrl 1600;
_giveBtn = _display displayCtrl 1602;
_dropBtn = _display displayCtrl 1601;
_gasMaskEquipBtn = _display displayCtrl 1603;
_gasMaskClearBtn = _display displayCtrl 1604;

_playerSelect = _display displayCtrl 2100;
_itemList = _display displayCtrl 1500;

_gasMaskIcon = _display displayCtrl 1200;
_hpIcon = _display displayCtrl 1201;
_hungerIcon = _display displayCtrl 1202;
_thirstIcon = _display displayCtrl 1203;
_sleepIcon = _display displayCtrl 1204;
_radIcon = _display displayCtrl 1205;

_hpBar = _display displayCtrl 2400;
_hungerBar = _display displayCtrl 2401;
_thirstBar = _display displayCtrl 2402;
_sleepBar = _display displayCtrl 2403;
_radBar = _display displayCtrl 2404;

_modifier1 = _display displayCtrl 1206;
_modifier2 = _display displayCtrl 1207;
_modifier3 = _display displayCtrl 1210;
_modifier4 = _display displayCtrl 1212;
_modifier5 = _display displayCtrl 1213;
_modifier6 = _display displayCtrl 1215;
_modifier7 = _display displayCtrl 1208;
_modifier8 = _display displayCtrl 1209;
_modifier9 = _display displayCtrl 1211;
_modifier10 = _display displayCtrl 1214;
_modifier11 = _display displayCtrl 1216;
_modifier12 = _display displayCtrl 1217;

_vInv = (player getVariable ["NAT_vInv",[]]);

//-----------------------------------
//-STATUS BARS
_hpBar progressSetPosition (1-(damage player));
_hungerBar progressSetPosition (1-(player getVariable ["NATneedsHunger",0]));
_thirstBar progressSetPosition (1-(player getVariable ["NATneedsThirst",0]));
_sleepBar progressSetPosition (1-(player getVariable ["NATneedsSleep",0]));
_radBar progressSetPosition (1-(player getVariable ["NATneedsRadiation",0]));
//-----------------------------------
//-PLAYER LIST
lbClear _playerSelect;
_index = _playerSelect lbAdd (name player);
_playerSelect lbSetCurSel _index;
{
	if (_x != player && isPlayer _x && alive _x && _x distance player < 6) then {
		_index = _playerSelect lbAdd (name _x);
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
if (lbSize _itemList < 1) then {
	{
		_x ctrlEnable false;
	} forEach [_useBtn,_giveBtn,_dropBtn];
} else {
	{
		_x ctrlEnable true;
	} forEach [_useBtn,_giveBtn,_dropBtn];
};
//-----------------------------------
//-GAS MASK DISPLAY
private "_iconPath";
_iconPath = "GUI\img\gas_mask.paa";
if ((player getVariable ["NATsavedGoggles",""]) != "") then {
	_iconPath = (getText (configFile >> "CfgGlasses" >> (player getVariable ["NATsavedGoggles",""]) >> "picture"));
};
if ((player getVariable ["NATsavedHeadgear",""]) != "") then {
	systemChat "helmet found";
	_iconPath = (getText (configFile >> "CfgWeapons" >> (player getVariable ["NATsavedHeadgear",""]) >> "picture"));
	systemchat _iconpath;
};
systemChat format["DEBUG :: H: %1, G: %2, P: %3",(player getVariable ["NATsavedHeadgear",""]),(player getVariable ["NATsavedGoggles",""]),_iconPath];
_gasMaskIcon ctrlSetText _iconPath;
//-----------------------------------
//-BUTTONS
_useBtn buttonSetAction "[] call NAT_fnc_vInvUse;";
_dropBtn buttonSetAction "[] call NAT_fnc_vInvDrop;";
//_giveBtn buttonSetAction "[] call NAT_fnc_vInvGive;";
_gasMaskEquipBtn buttonSetAction "[] call NAT_fnc_gasMaskAction;";
_gasMaskClearBtn buttonSetAction "player setVariable ['NATsavedGoggles','']; player setVariable ['NATsavedHeadgear',''];";
//-----------------------------------
//-MODIFIERS
{
	_x ctrlShow false;
} forEach [_modifier1,_modifier2,_modifier3,_modifier4,_modifier5,_modifier6,_modifier7,_modifier8,_modifier9,_modifier10,_modifier11,_modifier12];
//-----------------------------------
//-DISABLE IF ACTION
if (NATaction) then {
	{
		_x ctrlEnable false;
	} forEach [_useBtn,_giveBtn,_dropBtn,_gasMaskEquipBtn];
};
//-----------------------------------