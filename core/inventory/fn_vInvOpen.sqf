/*
    fn_vInv
    Author: Sinbane

    Description:
    Displays the players virtual inventory
*/
//-----------------------------------
if (!alive player || lifeState player in ["DEAD","DEAD-RESPAWN","DEAD-SWITCHING","INCAPACITATED"] || stance player isEqualTo "UNDEFINED") exitWith {};
private "_anim";
switch (stance player) do {
	case "STAND": {
		_anim = "AinvPercMstpSrasWrflDnon";
	};
	case "CROUCH": {
		_anim = "AinvPknlMstpSrasWrflDnon";
	};
	case "PRONE": {
		_anim = "AinvPpneMstpSrasWrflDnon";
	};
};
player playMove _anim;
waitUntil {animationState player isEqualTo _anim};
disableSerialization;
createDialog "NAT_vInv";
waitUntil {dialog};
[] call NAT_fnc_vInvUpdate;
//-----------------------------------