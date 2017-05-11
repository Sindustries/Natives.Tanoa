/*
    fn_vInv
    Author: Sinbane

    Description:
    Displays the players virtual inventory
*/
//-----------------------------------
#define NATinvGasMaskText 3304
#define NATinvHPdisplay 3307
#define NATinvHGRdisplay 3233
#define NATinvTHRdisplay 3234
#define NATinvTarget 3309
#define NATinvItemList 3310
#define Btn1 3305
#define Btn2 3308

private[];
disableSerialization;

//-----------------------------------
if (!dialog) then {
    createDialog "NAT_vInv";
	waitUntil {dialog};
};

_display = findDisplay 3300;
_gasMask = _display displayCtrl NATinvGasMaskText;
_hpLevel = _display displayCtrl NATinvHPdisplay;
_hgrLevel = _display displayCtrl NATinvHGRdisplay;
_thrLevel = _display displayCtrl NATinvTHRdisplay;
_useTarget = _display displayCtrl NATinvTarget;
_itemList = _display displayCtrl NATinvItemList;
_Btn1 = _display displayCtrl Btn1;
_Btn2 = _display displayCtrl Btn2;
_vInv = (player getVariable ["NAT_vInv",[]]);

//-----------------------------------
_Btn1 buttonSetAction "[] call NAT_fnc_vInvUse;";
_Btn2 buttonSetAction "[] call NAT_fnc_vInvDrop;";
//-----------------------------------
//-GAS MASK DISPLAY
private "_GMname";
if ((player getVariable ["NATsavedGoggles",""]) != "" || (player getVariable ["NATsavedGoggles",""]) != "") then {
	if ((player getVariable ["NATsavedGoggles",""]) != "") then {
		_GMname = (getText (configFile >> "CfgGlasses" >> (player getVariable ["NATsavedGoggles",""]) >> "displayName"));
	};
	if ((player getVariable ["NATsavedHeadgear",""]) != "") then {
		_GMname = (getText (configFile >> "CfgWeapons" >> (player getVariable ["NATsavedHeadgear",""]) >> "displayName"));
	};
} else {
	_GMname = "None";
};
_gasMask ctrlSetText _GMname;
//-----------------------------------
//-ITEM LIST
[] call NAT_fnc_vInvUpdate;
//-----------------------------------
//-TARGET BOX
_index = _useTarget lbAdd (name player);
_useTarget lbSetSelected [_index, true];
{
	if (_x != player && isPlayer _x && alive _x && _x distance player < 6) then {
		_index = _useTarget lbAdd (name _x);
	};
} forEach playableUnits;
//-----------------------------------
//-HEALTH LEVEL
_math = ((1-(damage player))*100);
_math = [_math,0] call BIS_fnc_cutDecimals;
_hpLevel ctrlSetText format ["%1%2",_math,"%"];
//-----------------------------------
//-HUNGER LEVEL
_math = ((1-(player getVariable ["NATneedsHunger",0]))*100);
_math = [_math,0] call BIS_fnc_cutDecimals;
_hgrLevel ctrlSetText format ["%1%2",_math,"%"];
//-----------------------------------
//-THIRST LEVEL
_math = ((1-(player getVariable ["NATneedsThirst",0]))*100);
_math = [_math,0] call BIS_fnc_cutDecimals;
_thrLevel ctrlSetText format ["%1%2",_math,"%"];
//-----------------------------------
//-CONTROLS ENABLER
if (lbSize _itemList < 1) then {
	{
		_x ctrlEnable false;
	} forEach [_Btn1,_Btn2,_useTarget,_itemList];
} else {
	{
		_x ctrlEnable true;
	} forEach [_Btn1,_Btn2,_useTarget,_itemList];
};
//-----------------------------------