/*
    fn_vInv_dropItem
    Author: Sinbane

    Description:
   	Drops selected vItem
*/

_display = findDisplay 3300;
_itemList = _display displayCtrl 1500;
_index = lbCurSel 1500;
_item = lbData [1500, _index];

//-----------------------------------
//-DROP ITEM
if (vehicle player isEqualTo player) then {
	_holder = createVehicle ["GroundWeaponHolder", [(getPos player select 0),(getPos player select 1),0], [], 0, "CAN_COLLIDE"];
	_holder addItemCargoGlobal [_item, 1];
} else {
	if (vehicle player canAdd _item) then {
		vehicle player addItemCargoGlobal [_item, 1];
	};
};
//-----------------------------------
//-REMOVE ITEM
[_item,1,false] call NAT_fnc_vInvAdjust;
//-----------------------------------
[] call NAT_fnc_vInvUpdate;
//-----------------------------------