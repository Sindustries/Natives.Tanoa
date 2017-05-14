/*
    fn_vInv_useItem
    Author: Sinbane

    Description:
   	Uses selected vItem
*/
private "_return";
params [
	["_item",""],
	["_count",1]
];
if (_item isEqualTo "") exitWith {};
_return = false;
//-----------------------------------
//-FIND ITEM
private "_vInv";
_vInv = (player getVariable ["NAT_vInv",[]]);
if (count _vInv < 1) then {_return = false} else {
	{
		if ((_x select 0) isEqualTo _item && (_x select 1) >= _count) then {
			_return = true;
		};
	} forEach _vInv;
};
_return;
//-----------------------------------