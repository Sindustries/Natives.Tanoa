/*
    fn_vInv_adjustInv
    Author: Sinbane

    Description:
   	Adds or removes selected item from vInventory
*/
private "_vInv";
params [
	["_item",""],
	["_count",1],
	["_add",false]
];

if (_item isEqualTo "" || _count isEqualTo 0) exitWith {};
_vInv = player getVariable ["NAT_vInv",[]];
_itemWeight = [_item] call NAT_fnc_vInvWeight;
//-----------------------------------
if (_add) then {
	if (count _vInv > 0) then {
		private "_found";
	    _found = false;
	    {
	        if (_item isEqualTo (_x select 0)) then {
	            _found = true;
	            _vInv set [_forEachIndex,[(_x select 0),((_x select 1)+_count)]];
	        };
	    } forEach _vInv;
	    if (_found isEqualTo false) then {
	        _vInv pushBack [_item,_count];
	    };
	} else {
	    _vInv pushBack [_item,_count];
	};
	player setVariable ["NAT_vInvWeight",((player getVariable ["NAT_vInvWeight",0])+(_itemWeight*_count))];
} else {
	{
		if ((_x select 0) isEqualTo _item) then {
			if ((_x select 1) > 1) then {
				_vInv set [_forEachIndex,[(_x select 0),((_x select 1)-_count)]];
			} else {
				_vInv deleteAt _forEachIndex;
			};
		};
	} forEach _vInv;
	player setVariable ["NAT_vInvWeight",((player getVariable ["NAT_vInvWeight",0])-(_itemWeight*_count))];
};
 //CHECK WEIGHT
if ((loadAbs player + (player getVariable ["NAT_vInvWeight",0])) >= NAT_maxWeight) then {
	player forceWalk true;
} else {
	player forceWalk false;
};
//-----------------------------------
player setVariable ["NAT_vInv",_vInv,true];
//-----------------------------------