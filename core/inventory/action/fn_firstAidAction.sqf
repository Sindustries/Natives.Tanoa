/*
   	fn_firstAidAction
    Author: Sinbane

    Description:
   	Performs first aid
*/
private ["_damage","_heal"];
params [
	["_item",""],
	["_heal",0]
];
if (_item isEqualTo "" || _heal <= 0) exitWith {};
//-----------------------------------
_heal = 0;
switch (_item) do {
	case "FirstAidKit": {
		_heal = 0.2;
	};
	case "rb_bandage": {
		_heal = 0.05;
	};
};

player action ["heal", player];
sleep 5;
player setDamage ((damage player)-_heal);
NATaction = false;

//-----------------------------------