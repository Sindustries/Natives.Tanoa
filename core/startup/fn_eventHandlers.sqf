/*
	fn_eventHandlers
	Author: Sinbane
	Description:
	Handles all custom event handlers
*/
private [];
//-----------------------------------
//-REMOVAL OF FIRST AID KITS
NATFAKEH = player addEventHandler ["Take", {
    private ["_unit","_container"];
    _unit = _this select 0;
    _container = _this select 1;
    _item = _this select 2;
    if (_item isEqualTo "FirstAidKit") then {
        _num = {_x isEqualTo "FirstAidKit"} count (items player);
        player setVariable ["NATFAKcount",((player getVariable ["NATFAKcount",0])+_num),true];
        player removeItems "FirstAidKit";
    };
}];
//-----------------------------------