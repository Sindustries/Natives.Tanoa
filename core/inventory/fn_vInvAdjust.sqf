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
_vInv = (player getVariable ["NAT_vInv",[]]);
if (DebugMode) then {systemChat str _item};
//-----------------------------------
if (_add) then {
	if (count _vInv > 0) then {
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
	    _vInv pushBack [_item,1];
	};
	if (DebugMode) then {systemChat "ADDING"};
} else {
	{
		if ((_x select 0) isEqualTo _item) then {
			if ((_x select 1) > 1) then {
				_vInv set [_forEachIndex,[(_x select 0),((_x select 1)-_count)]];
				if (DebugMode) then {systemChat "REMOVING > 1"};
			} else {
				_vInv deleteAt _forEachIndex;
				if (DebugMode) then {systemChat "REMOVING < 1"};
			};
		};
	} forEach _vInv;
};
//-----------------------------------
player setVariable ["NAT_vInv",_vInv,true];
if (DebugMode) then {systemChat str (player getVariable ["NAT_vInv",[]]); showChat true};
//-----------------------------------