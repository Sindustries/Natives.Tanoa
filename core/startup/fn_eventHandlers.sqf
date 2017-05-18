/*
	fn_eventHandlers
	Author: Sinbane
	Description:
	Handles all custom event handlers
*/
private [];
//-----------------------------------
//-REAL ITEM TO vITEM CONVERSION

NATvItemTakeEH = player addEventHandler ["Take", {
    private ["_unit","_container","_item","_vInv","_assigned"];
    _unit = _this select 0;
    _container = _this select 1;
    _item = _this select 2;
    _assigned = assignedItems player;
    _vInv = (player getVariable ["NAT_vInv",[]]);

    if (_item in NATvInvItemsOnly) then {
        if (_item isKindOf ["CA_Magazine", configFile >> "CfgMagazines"]) then {
            player removeMagazines _item;
        } else {
            player unassignItem _item;
            player removeItems _item;
            if ("itemWatch" in _assigned) then {
                player linkItem "itemWatch";
            };
        };
         [_item,1,true] call NAT_fnc_vInvAdjust;
    };
}];

{
    player removeAllEventHandlers _x;
    player addEventHandler [_x, {
        private ["_vInv","_assigned"];
        _assigned = assignedItems player;
        _vInv = (player getVariable ["NAT_vInv",[]]);
        {
            if (_x in NATvInvItemsOnly) then {
                if (_x isKindOf ["CA_Magazine", configFile >> "CfgMagazines"]) then {
                    player removeMagazines _x;
                } else {
                    player unassignItem _x;
                    player removeItems _x;
                    if ("itemWatch" in _assigned) then {
                        player linkItem "itemWatch";
                    };
                };
                 [_x,1,true] call NAT_fnc_vInvAdjust;
            };
        } forEach (uniformItems player+vestItems player+backpackItems player+assignedItems player);
    }];
} forEach ["InventoryOpened","InventoryClosed"];

//-----------------------------------