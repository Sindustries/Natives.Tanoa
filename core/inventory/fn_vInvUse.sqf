/*
    fn_vInv_useItem
    Author: Sinbane

    Description:
   	Uses selected vItem
*/

_display = findDisplay 3300;
_itemList = _display displayCtrl 3310;
_index = lbCurSel 3310;
_item = lbData [3310, _index];

//-----------------------------------
//-USE ITEM
switch (_item) do {
	//MEDICAL
	case "FirstAidKit": {
		[_item,(0.15+(random 0.05))] spawn NAT_fnc_firstAidAction;
		NATaction = true;
	};
	case "rb_bandage": {
		[_item,(0.04+(random 0.02))] spawn NAT_fnc_firstAidAction;
		NATaction = true;
	};
	//FOOD (RAW)
	case "rb_Meat": {
		[1,2,0.2] call NAT_fnc_needsUpdate;
		[2,0,0.7] call NAT_fnc_needsUpdate;
		[4,1,0.3] call NAT_fnc_needsUpdate;
	};
	case "rb_RiceBox": {
		[1,2,0.3] call NAT_fnc_needsUpdate;
		[2,0,0.8] call NAT_fnc_needsUpdate;
		[4,1,0.5] call NAT_fnc_needsUpdate;
	};
	case "rb_cereal": {
		[1,2,0.1] call NAT_fnc_needsUpdate;
		[2,0,1] call NAT_fnc_needsUpdate;
		[4,1,0.4] call NAT_fnc_needsUpdate;
	};
	//FOOD (COOKED)
	case "rb_MeatC": {
		[1,2,0.6] call NAT_fnc_needsUpdate;
		[2,0,0.6] call NAT_fnc_needsUpdate;
	};
	case "rb_TacticalBacon": {
		[1,2,0.5] call NAT_fnc_needsUpdate;
		[2,0,0.8] call NAT_fnc_needsUpdate;
	};
	case "rb_BakedBeans": {
		[1,2,0.4] call NAT_fnc_needsUpdate;
		[2,0,0.9] call NAT_fnc_needsUpdate;
	};
	//DRINK (SALTY)
	case "rb_bottlesalt": {
		[3,2,0.15] call NAT_fnc_needsUpdate;
		[4,1,1] call NAT_fnc_needsUpdate;
	};
	case "rb_canteen_salt": {
		[3,2,0.15] call NAT_fnc_needsUpdate;
		[4,1,1] call NAT_fnc_needsUpdate;
	};
	//DRINK (DIRTY)
	case "rb_bottledirty": {
		[3,2,0.25] call NAT_fnc_needsUpdate;
		[4,2,0.2] call NAT_fnc_needsUpdate;
	};
	case "rb_canteen_dirty": {
		[3,2,0.15] call NAT_fnc_needsUpdate;
		[4,2,0.3] call NAT_fnc_needsUpdate;
	};
	//DRINK (CLEAN)
	case "rb_bottleclean": {
		[3,2,0.33] call NAT_fnc_needsUpdate;
		[4,2,0.5] call NAT_fnc_needsUpdate;
	};
	case "rb_canteen": {
		[3,2,0.5] call NAT_fnc_needsUpdate;
		[4,2,0.9] call NAT_fnc_needsUpdate;
	};
	//DRINK (ENERGY)
	case "rb_Spirit": {
		[3,2,0.15] call NAT_fnc_needsUpdate;
		[4,1,0.1] call NAT_fnc_needsUpdate;
	};
	case "rb_franta": {
		[3,2,0.15] call NAT_fnc_needsUpdate;
		[4,1,0.1] call NAT_fnc_needsUpdate;
	};
	case "rb_redgull": {
		[3,2,0.25] call NAT_fnc_needsUpdate;
		[4,1,0.2] call NAT_fnc_needsUpdate;
	};
};
//-----------------------------------
//-REMOVE ITEM
[_item,1,false] call NAT_fnc_vInvAdjust;
//-----------------------------------
//-CLOSE OR UPDATE
if (NATaction) then {
	closeDialog 0;
} else {
	[] call NAT_fnc_vInvUpdate;
};
//-----------------------------------