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
                [player] call ace_hearing_fnc_removeEarplugs;
                //waitUntil {("ACE_earplugs" in (vestItems player + uniformItems player + backpackItems player))};
                player removeItems "ACE_earplugs";
                player setVariable ["NATearPlugs",false,false];
            } else {
                _handled = true;
                [player] call ace_hearing_fnc_putInEarplugs;
                player setVariable ["NATearPlugs",true,false];
            };
        };
    };

    //I - Virtual INV
    case 23: {
        if (_shift && !_ctrl && !_alt && !dialog) then {
            [] spawn NAT_fnc_vInvOpen;
            _handled = true;
        };
    };

};

_handled;

//-----------------------------------