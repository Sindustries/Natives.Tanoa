/*
    fn_needsInit
    Author: Sinbane

    Description:
    Init's the player for the needs system
*/
private [];

NATneedsHealthTime = (["NATneedsHealthTime"] call NAT_fnc_getSetting);
NATneedsHungerTime = (["NATneedsHungerTime"] call NAT_fnc_getSetting);
NATneedsThirstTime = (["NATneedsThirstTime"] call NAT_fnc_getSetting);
NATneedsSleepTime = (["NATneedsSleepTime"] call NAT_fnc_getSetting);
NATneedsRadiationTime = (["NATneedsRadiationTime"] call NAT_fnc_getSetting);

_hungerTime = (NATneedsHungerTime*60*60/timeMultiplier/3600);
_hungerVar = (1/3600);

_thirstTime = (NATneedsThirstTime*60*60/timeMultiplier/3600);
_thirstVar = (1/3600);

_sleepTime = (NATneedsSleepTime*60*60/timeMultiplier/3600);
_sleepVar = (1/3600);

_radTime = (NATneedsRadiationTime*60*60/timeMultiplier/3600);
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
player setVariable ["NATneedsHealthy",false];
player setVariable ["NATneedsEnergised",false];
player setVariable ["NATneedsHungry",false];
player setVariable ["NATneedsThirsty",false];
player setVariable ["NATneedsTired",false];
player setVariable ["NATneedsRadiationLevel",0];
//-----------------------------------
[_hungerTime,_hungerVar] spawn NAT_fnc_needsHunger;
[_thirstTime,_thirstVar] spawn NAT_fnc_needsThirst;
[_sleepTime,_sleepVar] spawn NAT_fnc_needsSleep;
[_radTime,_radVar] spawn NAT_fnc_needsRadiation;
//[] spawn NAT_fnc_needsSickness;
//-----------------------------------