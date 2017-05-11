/*
    fn_needsInit
    Author: Sinbane

    Description:
    Init's the player for the needs system
*/
private [];

_hungerTime = (18*60*60/timeMultiplier/3600);
_hungerVar = (1/3600);

_thirstTime = (12*60*60/timeMultiplier/3600);
_thirstVar = (1/3600);

_sleepTime = (16*60*60/timeMultiplier/3600);
_sleepVar = (1/3600);

_radTime = (24*60*60/timeMultiplier/3600);
_radVar = (1/3600);

//-----------------------------------
player setVariable ["NATneedsHunger",0];
player setVariable ["NATneedsThirst",0];
player setVariable ["NATneedsSleep",0];
player setVariable ["NATneedsRadiation",0];
player setVariable ["NATneedsHungerMult",1];
player setVariable ["NATneedsThirstMult",1];
player setVariable ["NATneedsSleepMult",1];
player setVariable ["NATneedsRadiationMult",1];
//-----------------------------------
//-MODIFIERS
player setVariable ["NATneedsHealthy",true];
player setVariable ["NATneedsEnergised",true];
player setVariable ["NATneedsHungry",false];
player setVariable ["NATneedsThirsty",false];
player setVariable ["NATneedsTired",false];
//-----------------------------------
[_hungerTime,_hungerVar] spawn NAT_fnc_needsHunger;
[_thirstTime,_thirstVar] spawn NAT_fnc_needsThirst;
[_sleepTime,_sleepVar] spawn NAT_fnc_needsSleep;
[_radTime,_radVar] spawn NAT_fnc_needsRadiation;
//[] spawn NAT_fnc_needsSickness;
//-----------------------------------