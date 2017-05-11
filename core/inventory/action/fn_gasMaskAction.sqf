/*
    fn_vInv
    Author: Sinbane

    Description:
    Displays the players virtual inventory
*/
//-----------------------------------

NATaction = true;
_handled = false;

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
    	if ((headgear player) isEqualTo "" && (player getVariable ["NATsavedHeadgear",""]) != "" && (player getVariable ["NATsavedHeadgear",""]) in (vestItems player + uniformItems player + backpackItems player)) then {
    		player removeItem (player getVariable ["NATsavedHeadgear",""]);
    		player addHeadgear (player getVariable ["NATsavedHeadgear",""]);
    	};
    	if ((goggles player) isEqualTo "" && (player getVariable ["NATsavedGoggles",""]) != "" && (player getVariable ["NATsavedGoggles",""]) in (vestItems player + uniformItems player + backpackItems player)) then {
    		player removeItem (player getVariable ["NATsavedGoggles",""]);
    		player addGoggles (player getVariable ["NATsavedGoggles",""]);
    	};
    };
};

NATaction = false;

//-----------------------------------