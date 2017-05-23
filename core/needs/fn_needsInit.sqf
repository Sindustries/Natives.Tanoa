/*
    fn_needsInit
    Author: Sinbane

    Description:
    Init's the player for the needs system
*/
private [];

NATHUD = false;

NATneedsHealthTime = ((["NATneedsHealthTime"] call NAT_fnc_getSetting)*60*60);
NATneedsHungerTime = ((["NATneedsHungerTime"] call NAT_fnc_getSetting)*60*60);
NATneedsThirstTime = ((["NATneedsThirstTime"] call NAT_fnc_getSetting)*60*60);
NATneedsSleepTime = ((["NATneedsSleepTime"] call NAT_fnc_getSetting)*60*60);
NATneedsRadiationTime = ((["NATneedsRadiationTime"] call NAT_fnc_getSetting)*60*60);

_healthTime = (NATneedsHealthTime*0.01/60);
_healthVar = (0.01*timeMultiplier/_healthTime);
_hungerTime = (NATneedsHungerTime*0.01/60);
_hungerVar = (0.01*timeMultiplier/_hungerTime);
_thirstTime = (NATneedsThirstTime*0.01/60);
_thirstVar = (0.01*timeMultiplier/_thirstTime);
_sleepTime = (NATneedsSleepTime*0.01/60);
_sleepVar = (0.01*timeMultiplier/_sleepTime);
_radTime = (NATneedsRadiationTime*0.01/60);
_radVar = (0.01*timeMultiplier/_radTime);

//-----------------------------------
player setVariable ["NATneedsDamageModif",1];
player setVariable ["NATneedsHunger",0];
player setVariable ["NATneedsThirst",0];
player setVariable ["NATneedsSleep",0];
player setVariable ["NATneedsRadiation",0];
player setVariable ["NATneedsHungerMult",1];
player setVariable ["NATneedsThirstMult",1];
player setVariable ["NATneedsSleepMult",1];
player setVariable ["NATneedsRadiationMult",1];
NATneedsHealthPerc = 0;
NATneedsHungerPerc = 0;
NATneedsThirstPerc = 0;
NATneedsSleepPerc = 0;
NATneedsRadiationPerc = 0;
//-----------------------------------
//-MODIFIERS
player setVariable ["NATneedsHealthy",false];
player setVariable ["NATneedsEnergised",false];
player setVariable ["NATneedsSteady",false];
player setVariable ["NATneedsHungry",false];
player setVariable ["NATneedsThirsty",false];
player setVariable ["NATneedsSleepLevel",0];
player setVariable ["NATneedsRadiationLevel",0];
//-----------------------------------
[_healthTime,_healthVar] spawn NAT_fnc_healthRegen;
[_hungerTime,_hungerVar] spawn NAT_fnc_needsHunger;
[_thirstTime,_thirstVar] spawn NAT_fnc_needsThirst;
[_sleepTime,_sleepVar] spawn NAT_fnc_needsSleep;
[_radTime,_radVar] spawn NAT_fnc_needsRadiation;
[] spawn {
	waitUntil {(player getVariable "NATspawned") isEqualTo true};
	[] spawn NAT_fnc_needsHUD;
};
//-----------------------------------