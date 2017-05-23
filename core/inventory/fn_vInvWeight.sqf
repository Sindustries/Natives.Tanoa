/*
    fn_vInvWeight
    Author: Sinbane

    Description:
   	Returns vItem weight
*/
private "_return";
params [
	["_item",""]
];
if (_item isEqualTo "") exitWith {};
_return = 0;
//-----------------------------------
//-FIND ITEM
{
	if (_item isEqualTo _x select 1) exitWith {
		_return = _x select 3;
	};
} forEach NATvInvItems;
_return;
//-----------------------------------