/*
	fn_keyHandler
	Author: Sinbane
	Description:
	Handles all custom key controls
	https://resources.bisimulations.com/wiki/DIK_KeyCodes
*/
private ["_ID","_code","_shift","_ctrl","_alt","_handled"];
if (!alive player) exitWith {};
//-----------------------------------
_ID = _this select 0;
_code = _this select 1;
_shift = _this select 2;
_ctrl = _this select 3;
_alt = _this select 4;
_handled = false;
//-----------------------------------
private ["_bases"];
_bases = [];
if (count NATmilitaryCamps > 0) then {
    {_bases pushBack (_x select 1)} forEach NATmilitaryCamps;
};
//-----------------------------------
switch (_code) do {
	//H - GasMask toggle
	case 35: {
        if (_shift && !_ctrl && !_alt) then {
			[] call NAT_fnc_gasMaskAction;
            _handled = true;
        };
    };

	//O - Earplugs
    case 24: {
        if (_shift && !_ctrl && !_alt) then {
            if ((player getVariable ["NATearPlugs",false]) isEqualTo true) then {
                _handled = true;
                3 fadeSound 0.25;
                //waitUntil {("ACE_earplugs" in (vestItems player + uniformItems player + backpackItems player))};
                //player removeItems "ACE_earplugs";
                player setVariable ["NATearPlugs",false,false];
            } else {
                _handled = true;
                //[player] call ace_hearing_fnc_putInEarplugs;
                2 fadeSound 1;
                player setVariable ["NATearPlugs",true,false];
            };
        };
    };

    //F1 - Virtual INV
    case 59: {
        if (!_shift && !_ctrl && !_alt && !dialog) then {
            ["vInv"] spawn NAT_fnc_vInvOpen;
            _handled = true;
        };
    };
    //F2 - Interaction Menu
    case 60: {
        if (!_shift && !_ctrl && !_alt && !dialog) then {
            if (!alive player || lifeState player in ["DEAD","DEAD-RESPAWN","DEAD-SWITCHING","INCAPACITATED"]) exitWith {};
            //-BASE?
            if (cursorObject in _bases && player distance cursorObject < 10) then {
                disableSerialization;
                createDialog "NAT_baseMenu";
                waitUntil {dialog};
                [] call NAT_fnc_baseMenu;
            };
            //-CAR?
            if (((typeOf cursorObject) isKindOf ["Land", configFile >> "CfgVehicles"]) && (damage cursorObject) < 1 && player distance cursorObject < 4 && !((locked cursorObject) in [2,3])) then {
                ["interact_land"] spawn NAT_fnc_vInvOpen;
            };
            _handled = true;
        };
    };
};

_handled;

//-----------------------------------