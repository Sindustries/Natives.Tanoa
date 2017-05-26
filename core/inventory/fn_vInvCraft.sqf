/*
    fn_vInvCraft
    Author: Sinbane

    Description:
   	Opens and updates the crafting menu
*/
private ["_vInv"];
disableSerialization;

if {!dialog} then {
	createDialog "NAT_crafting";
    waitUntil {dialog};
};

_display = findDisplay 8910;

_craftBtn = _display displayCtrl 1600;
_category = _display displayCtrl  2100;
_icon = _display displayCtrl  1200;
_itemList = _display displayCtrl  1500;
_closeBtn = _display displayCtrl  1601;
_ingredients = _display displayCtrl  1100;

_vInv = (player getVariable ["NAT_vInv",[]]);
_vInvWeight = (player getVariable ["NAT_vInvWeight",0]);

//-----------------------------------
//-HANDLERS
_itemList removeAllEventHandlers "LBSelChanged";
_category removeAllEventHandlers "LBSelChanged";
_itemList ctrlSetEventHandler ["LBSelChanged", {[] call NAT_fnc_cvInvCraft}];
_category ctrlSetEventHandler ["LBSelChanged", {[] call NAT_fnc_cvInvCraft}];
//-----------------------------------
//-CATEGORIES
lbClear _category;
_cookingIndex = _playerSelect lbAdd "Cooking";
_medicalIndex = _playerSelect lbAdd "Medical";
if (lbCurSel _category >= 0) then {
	_category lbSetCurSel lbCurSel _category;
} else {
	_category lbSetCurSel 0;
};
//-----------------------------------
//-COOKING
NAME,CLASS,REQUIRED,ICONPATH,TTB
lbClear _itemList;
if (lbCurSel _category isEqualTo _cookingIndex) then {
	{
		_itemList lbAdd (_x select 0);
	} forEach NATcraftCooking;

	if (lbCurSel _itemList >= 0) then {
		_itemList lbSetCurSel lbCurSel _itemList;
	} else {
		_itemList lbSetCurSel 0;
	};

	_icon ctrlSetText (NATcraftCooking select lbCurSel _itemList select 3);

	_reqItems = (NATcraftCooking select lbCurSel _itemList select 2);
	_arr = [];
	{
		_entry = parseText format["%1 x%2",(_x select 0),(_x select 1)];
		_arr pushBack _entry;
	} forEach _reqItems;
	_ingredients ctrlSetStructuredText parseText format [
		"<t size='0.9' font='PuristaMedium'><t align='center'>== INGEDIENTS ==</br></t></t>,
		<t align='left'>%1x %2</t>"
	];
};
//-----------------------------------
//-HANDLERS
_entry = format["%1 x%2",_name,_count];
_index = _itemList lbAdd _entry;
_itemList lbSetPicture [_index, _iconPath];
_itemList lbSetData [_index, (_x select 0)];
//-----------------------------------
//-HANDLERS

//-----------------------------------
//-HANDLERS

//-----------------------------------
//-HANDLERS

