/*
    fn_vInv_useItem
    Author: Sinbane

    Description:
   	Uses selected vItem
*/
private ["_use"];

_display = findDisplay 3300;
_itemList = _display displayCtrl 1500;
_index = lbCurSel 1500;
_item = lbData [1500, _index];

_use = false;

//-----------------------------------
//-FIND USE FOR ITEM
if (_item in NATvInvMedicalItems) then {
	_use = [_item] call NAT_fnc_firstAidAction;
};
if (_item in NATvInvFoodItems) then {
	_use = [_item] call NAT_fnc_eatAction;
};
if (_item in NATvInvDrinkItems) then {
	_use = [_item] call NAT_fnc_drinkAction;
};
if (_item in NATvInvCampItems) then {
	_use = [_item] call NAT_fnc_campAction;
};
//-----------------------------------
//-REMOVE ITEM
if (_use) then {
	[_item,1,false] call NAT_fnc_vInvAdjust;
};
//-----------------------------------
//-CLOSE OR UPDATE
[] call NAT_fnc_vInvUpdate;
//-----------------------------------