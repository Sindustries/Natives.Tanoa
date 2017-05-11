/*
    fn_needsInit
    Author: Sinbane

    Description:
    Init's the player for the needs system
*/
private [];

_hungerTime = (18*60*60/timeMultiplier/3600);
_thirstTime = (12*60*60/timeMultiplier/3600);

_hungerVar = (1/3600);
_thirstVar = (1/3600);

//-----------------------------------
player setVariable ["NATneedsSick",0];
player setVariable ["NATneedsHunger",0];
player setVariable ["NATneedsThirst",0];
player setVariable ["NATneedsHungerMult",1];
player setVariable ["NATneedsThirstMult",1];
//-----------------------------------
NATneedsFoodRaw = ["rb_Meat","rb_RiceBox"];
NATneedsFoodCooked = ["rb_MeatC","rb_TacticalBacon","rb_BakedBeans","rb_cereal"];
NATneedsDrinkClean = ["rb_bottleclean","rb_Spirit","rb_franta","rb_redgull","rb_canteen"];
NATneedsDrinkDirty = ["rb_bottledirty","rb_canteen_dirty"];
NATneedsDrinkSalty = ["rb_bottlesalt","rb_canteen_salt"];
NATneedsMedication = ["FirstAidKit","rb_antibiotic"];
//-----------------------------------
[_hungerTime,_hungerVar] spawn NAT_fnc_needsHunger;
[_thirstTime,_thirstVar] spawn NAT_fnc_needsThirst;
//[] spawn NAT_fnc_needsSickness;
//-----------------------------------