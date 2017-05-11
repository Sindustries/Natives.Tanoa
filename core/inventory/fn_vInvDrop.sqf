/*
    fn_vInv_dropItem
    Author: Sinbane

    Description:
   	Drops selected vItem
*/

_display = findDisplay 3300;
_itemList = _display displayCtrl 3310;

//-----------------------------------

_index = lbCurSel 3310;
_item = lbData [3310, _index];

if (DebugMode) then {systemChat str _item};

//-----------------------------------
//-DROP ITEM
_holder = createVehicle ["GroundWeaponHolder", [(getPos player select 0),(getPos player select 1),0], [], 0, "CAN_COLLIDE"];
_holder addItemCargoGlobal [_item, 1];
//-----------------------------------
//-REMOVE ITEM
[_item,1,false] call NAT_fnc_vInvAdjust;
//-----------------------------------
[] call NAT_fnc_vInvUpdate;
//-----------------------------------