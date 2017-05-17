/*
    fn_vInv
    Author: Sinbane

    Description:
    Displays the players virtual inventory
*/
//-----------------------------------
params [["_UI",""]];
if (!alive player || lifeState player in ["DEAD","DEAD-RESPAWN","DEAD-SWITCHING","INCAPACITATED"]) exitWith {};
if (_UI isEqualTo "") exitWith {};
disableSerialization;

switch (_UI) do {
	case "vInv": {
		createDialog "NAT_vInv";
		waitUntil {dialog};
		[] spawn NAT_fnc_vInvUpdate;
	};
	case "interact_land": {
		createDialog "NAT_interact";
		waitUntil {dialog};
		[cursorObject,"land"] spawn NAT_fnc_interact;
	};
};
//-----------------------------------