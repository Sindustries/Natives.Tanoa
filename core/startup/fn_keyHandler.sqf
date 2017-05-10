/*
	fn_keyHandler
	Author: Sinbane
	Description:
	Handles all custom key controls
	https://resources.bisimulations.com/wiki/DIK_KeyCodes
*/
private ["_ID","_code","_shift","_ctrl","_alt","_handled"];
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
			//UNEQUIP
            if ((headgear player) in NATgasMasks || (goggles player) in NATgasMasks) then {
            	if ((headgear player) in NATgasMasks) then {
            		if (player canAdd (headgear player)) then {
            			player setVariable ["NATsavedHeadgear",(headgear player),false];
            			removeHeadgear player;
            			player addItem (player getVariable ["NATsavedHeadgear",""]);
            		} else {
            			systemChat "Not enough room to stow gas mask!";
            		};
            	};
            	if ((goggles player) in NATgasMasks) then {
            		if (player canAdd (goggles player)) then {
            			player setVariable ["NATsavedGoggles",(goggles player),false];
            			removeGoggles player;
            			player addItem (player getVariable ["NATsavedGoggles",""]);
            		} else {
            			systemChat "Not enough room to stow gas mask!";
            		};
            	};
            	_handled = true;
            };
            //RE-EQUIP
            if (_handled isEqualTo false) then {
	            if ((headgear player) isEqualTo "" || (goggles player) isEqualTo "") then {
	            	if ((player getVariable ["NATsavedHeadgear",""]) != "" && (player getVariable ["NATsavedHeadgear",""]) in (vestItems player + uniformItems player + backpackItems player)) then {
	            		player removeItem (player getVariable ["HVPsavedHeadgear",""]);
	            		player addHeadgear (player getVariable ["HVPsavedHeadgear",""]);
	            	};
	            	if ((player getVariable ["NATsavedGoggles",""]) != "" && (player getVariable ["NATsavedGoggles",""]) in (vestItems player + uniformItems player + backpackItems player)) then {
	            		player removeItem (player getVariable ["NATsavedGoggles",""]);
	            		player addGoggles (player getVariable ["NATsavedGoggles",""]);
	            	};
	            };
	            _handled = true;
	        };
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
        if (_shift && !_ctrl && !_alt) then {
            systemChat format["-- VIRTUAL INVENTORY"];
            systemChat format["-- First Aid Kits: %1 ",(player getVariable ["NATFAKcount",0])];
            systemChat format["-- "];
            systemChat format["-- "];
            systemChat format["-- "];
            showChat true;
            _handled = true;
        };
    };

};

_handled;

//-----------------------------------