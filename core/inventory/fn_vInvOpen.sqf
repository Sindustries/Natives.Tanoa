/*
    fn_vInv
    Author: Sinbane

    Description:
    Displays the players virtual inventory
*/
//-----------------------------------
if (!alive player || lifeState player in ["DEAD","DEAD-RESPAWN","DEAD-SWITCHING","INCAPACITATED"]) exitWith {};
disableSerialization;
createDialog "NAT_vInv";
waitUntil {dialog};
[] call NAT_fnc_vInvUpdate;
//-----------------------------------