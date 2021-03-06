/*
    fn_vInv_adjustInv
    Author: Sinbane

    Description:
   	Adds or removes selected item from vInventory
*/
private ["_itemList","_vInv"];
disableSerialization;

_display = findDisplay 3300;
_useBtn = _display displayCtrl 1600;
_giveBtn = _display displayCtrl 1602;
_dropBtn = _display displayCtrl 1601;
_gasMaskEquipBtn = _display displayCtrl 1603;
_gasMaskClearBtn = _display displayCtrl 1604;

_playerSelect = _display displayCtrl 2100;
_itemList = _display displayCtrl 1500;
_totalWeight = _display displayCtrl 1100;

_gasMaskIcon = _display displayCtrl 1200;
_hpIcon = _display displayCtrl 1201;
_hungerIcon = _display displayCtrl 1202;
_thirstIcon = _display displayCtrl 1203;
_sleepIcon = _display displayCtrl 1204;
_radIcon = _display displayCtrl 1205;

_hpBar = _display displayCtrl 2400;
_hungerBar = _display displayCtrl 2401;
_thirstBar = _display displayCtrl 2402;
_sleepBar = _display displayCtrl 2403;
_radBar = _display displayCtrl 2404;

_modifier1 = _display displayCtrl 1206;
_modifier2 = _display displayCtrl 1207;
_modifier3 = _display displayCtrl 1210;
_modifier4 = _display displayCtrl 1212;
_modifier5 = _display displayCtrl 1213;
_modifier6 = _display displayCtrl 1215;
_modifier7 = _display displayCtrl 1208;
_modifier8 = _display displayCtrl 1209;
_modifier9 = _display displayCtrl 1211;
_modifier10 = _display displayCtrl 1214;
_modifier11 = _display displayCtrl 1216;
_modifier12 = _display displayCtrl 1217;

_vInv = (player getVariable ["NAT_vInv",[]]);
_vInvWeight = (player getVariable ["NAT_vInvWeight",0]);

//-----------------------------------
//-STATUS BARS
_hpBar progressSetPosition (1-(damage player));
_hungerBar progressSetPosition (1-(player getVariable ["NATneedsHunger",0]));
_thirstBar progressSetPosition (1-(player getVariable ["NATneedsThirst",0]));
_sleepBar progressSetPosition (1-(player getVariable ["NATneedsSleep",0]));
_radBar progressSetPosition (1-(player getVariable ["NATneedsRadiation",0]));
//-----------------------------------
//-HEALTH
_hpBar ctrlSetTooltip format ["%1%2",NATneedsHealthPerc,"%"];
_hpIcon ctrlSetTooltip "HEALTH";
//-----------------------------------
//-HUNGER
_hungerBar ctrlSetTooltip format ["%1%2",NATneedsHungerPerc,"%"];
_hungerIcon ctrlSetTooltip "HUNGER";
//-----------------------------------
//-THIRST
_thirstBar ctrlSetTooltip format ["%1%2",NATneedsThirstPerc,"%"];
_thirstIcon ctrlSetTooltip "THIRST";
//-----------------------------------
//-SLEEP
_sleepBar ctrlSetTooltip format ["%1%2",NATneedsSleepPerc,"%"];
_sleepIcon ctrlSetTooltip "SLEEP";
//-----------------------------------
//-RADIATION
_radBar ctrlSetTooltip format ["%1%2",NATneedsRadiationPerc,"%"];
_radIcon ctrlSetTooltip "RADIATION";
//-----------------------------------
//-GIVE LIST
lbClear _playerSelect;
{
	if (_x != player && isPlayer _x && alive _x && _x distance player < 6) then {
		_index = _playerSelect lbAdd (name _x);
	};
} forEach playableUnits;
if (count NATmilitaryCamps > 0) then {
	{
		if ((damage (_x select 1)) < 0.97 && (_x select 1) distance player < 10) then {
			_index = _playerSelect lbAdd "BASE STORAGE";
		};
	} forEach NATmilitaryCamps;
};
_playerSelect lbSetCurSel 0;
_playerSelect ctrlSetTooltip "Select a player or base to give item to";
//-----------------------------------
//-INVENTORY
lbClear _itemList;
if (count (_vInv) > 0) then {
	{
		private ["_name","_iconPath"];
		for "_i" from 0 to (count (NATvInvItems)-1) do {
			if ((_x select 0) isEqualTo ((NATvInvItems select _i) select 1)) then {
				_name = ((NATvInvItems select _i) select 0);
				_iconPath = ((NATvInvItems select _i) select 2);
			};
		};
		_count = (_x select 1);
		_entry = format["%1 x%2",_name,_count];
		_index = _itemList lbAdd _entry;
		_itemList lbSetPicture [_index, _iconPath];
		_itemList lbSetData [_index, (_x select 0)];
	} forEach _vInv;
	lbSort _itemList;
};
if (lbSize _itemList < 1) then {
	{
		_x ctrlEnable false;
	} forEach [_useBtn,_giveBtn,_dropBtn];
} else {
	{
		_x ctrlEnable true;
	} forEach [_useBtn,_giveBtn,_dropBtn];
};
_math = (100-(((NAT_maxWeight-(_vInvWeight+loadAbs player))/NAT_maxWeight)*100));
_totalWeight ctrlSetStructuredText parseText format ["<t align='center' size='0.9' font='PuristaMedium'>TOTAL LOAD: %1%2</t>",([_math,0] call BIS_fnc_cutDecimals),"%"];
//-----------------------------------
//-GAS MASK DISPLAY
private "_iconPath";
if ((player getVariable ["NATsavedGoggles",""]) != "" || (player getVariable ["NATsavedHeadgear",""]) != "") then {
	if ((player getVariable ["NATsavedGoggles",""]) != "") then {
		_iconPath = (getText (configFile >> "CfgGlasses" >> (player getVariable ["NATsavedGoggles",""]) >> "picture"));
		_gasMaskIcon ctrlSetTooltip (getText (configFile >> "CfgGlasses" >> (player getVariable ["NATsavedGoggles",""]) >> "displayName"));
	};
	if ((player getVariable ["NATsavedHeadgear",""]) != "") then {
		_iconPath = (getText (configFile >> "CfgWeapons" >> (player getVariable ["NATsavedHeadgear",""]) >> "picture"));
		_gasMaskIcon ctrlSetTooltip (getText (configFile >> "CfgWeapons" >> (player getVariable ["NATsavedHeadgear",""]) >> "displayName"));
	};
	if ((goggles player) isEqualTo (player getVariable ["NATsavedGoggles",""]) || (headgear player) isEqualTo (player getVariable ["NATsavedHeadgear",""])) then {
		_gasMaskEquipBtn ctrlSetText "REMOVE";
	} else {
		_gasMaskEquipBtn ctrlSetText "EQUIP";
	};
	_gasMaskEquipBtn ctrlEnable true;
	_gasMaskClearBtn ctrlEnable true;
} else {
	_iconPath = "GUI\img\gas_mask.paa";
	_gasMaskIcon ctrlSetTooltip "None";
	_gasMaskEquipBtn ctrlSetText "EQUIP";
	_gasMaskEquipBtn ctrlEnable false;
	_gasMaskClearBtn ctrlEnable false;
};
_gasMaskIcon ctrlSetText _iconPath;
//-----------------------------------
//-BUTTONS
_useBtn buttonSetAction "[] call NAT_fnc_vInvUse;";
_dropBtn buttonSetAction "[] call NAT_fnc_vInvDrop;";
//_giveBtn buttonSetAction "[] call NAT_fnc_vInvGive;";
_gasMaskEquipBtn buttonSetAction "[] call NAT_fnc_gasMaskAction; [] call NAT_fnc_vInvUpdate;";
_gasMaskClearBtn buttonSetAction "player setVariable ['NATsavedGoggles','']; player setVariable ['NATsavedHeadgear','']; [] call NAT_fnc_vInvUpdate;";
//-----------------------------------
//-MODIFIERS
/* HEALTHY */
if ((player getVariable "NATneedsHealthy") isEqualTo true) then {
	_modifier1 ctrlSetText "GUI\img\healthy.paa";
	_modifier1 ctrlSetTooltip "HEALTHY: Health regenerating naturally";
} else {
	_modifier1 ctrlSetText "GUI\img\sick.paa";
	_modifier1 ctrlSetTooltip "SICK: No health regeneration";
};
/* DAMAGE REDUCTION */
if (player getVariable "NATneedsDamageModif" < 1) then {
	_math = ((1-(player getVariable "NATneedsDamageModif"))*100);
	//_modif = [player getVariable ["NATneedsDamageModif",1],0] call BIS_fnc_cutDecimals;
	_modifier2 ctrlSetText "\A3\ui_f\data\igui\cfg\simpleTasks\types\defend_ca.paa";
	_modifier2 ctrlSetTooltip format["DAMAGE REDUCTION: You are taking %1%2 less damage",[_math,0] call BIS_fnc_cutDecimals,"%"];
} else {
	_modifier2 ctrlShow false;
};
/* STEADY */
if ((player getVariable "NATneedsSteady") isEqualTo true) then {
	_modifier8 ctrlSetText "\A3\ui_f\data\igui\cfg\simpleTasks\types\rifle_ca.paa";		//"GUI\img\steady.paa";
	_modifier8 ctrlSetTooltip "STEADY: Weapon control increased";
} else {
	_modifier9 ctrlShow false;
};

/* ENERGIZED */
if ((player getVariable "NATneedsEnergised") isEqualTo true) then {
	_modifier9 ctrlSetText "\A3\ui_f\data\igui\cfg\simpleTasks\types\run_ca.paa";	//"GUI\img\energised.paa";
	_modifier9 ctrlSetTooltip "ENERGISED: Movement speed increased";
} else {
	_modifier9 ctrlShow false;
};
/* IRRADIATED */
if (player getVariable ["NATneedsRadiationLevel",0] > 0) then {
	_modifier4 ctrlSetText "GUI\img\radiation.paa";
	if (player getVariable ["NATneedsRadiationLevel",0] isEqualTo 1) then {
		_modifier4 ctrlSetTooltip "RADIATION LEVEL: MINOR: No health regeneration";
	};
	if (player getVariable ["NATneedsRadiationLevel",0] isEqualTo 2) then {
		_modifier4 ctrlSetTooltip "RADIATION LEVEL: HIGH: No health regeneration, increased weapon sway";
	};
	if (player getVariable ["NATneedsRadiationLevel",0] isEqualTo 3) then {
		_modifier4 ctrlSetTooltip "RADIATION LEVEL: SEVERE: Slowly dying, increased weapon sway";
	};
} else {
	_modifier4 ctrlShow false;
};
//-----------------------------------
{
	_x ctrlShow false;
} forEach [];
//-----------------------------------
//-DISABLE IF ACTION
if (NATaction) then {
	{
		_x ctrlEnable false;
	} forEach [_useBtn,_giveBtn,_dropBtn,_gasMaskEquipBtn];
};
//-----------------------------------