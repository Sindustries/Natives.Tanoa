class NAT_baseMenu
{
	idd = 4040;
	movingenable = false;
	enableSimulation = 1;

class controls
{
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Jay, v1.063, #Qutuji)
////////////////////////////////////////////////////////

class NATbaseBGmain: IGUIBack
{
	idc = 2200;
	x = 0.2625 * safezoneW + safezoneX;
	y = 0.3 * safezoneH + safezoneY;
	w = 0.475 * safezoneW;
	h = 0.46 * safezoneH;
};
class NATbaseFRMmain: RscFrame
{
	idc = 1800;
	x = 0.2625 * safezoneW + safezoneX;
	y = 0.3 * safezoneH + safezoneY;
	w = 0.475 * safezoneW;
	h = 0.46 * safezoneH;
};
class NATbaseTOPfrm: RscFrame
{
	idc = 1801;
	x = 0.2625 * safezoneW + safezoneX;
	y = 0.3 * safezoneH + safezoneY;
	w = 0.475 * safezoneW;
	h = 0.02 * safezoneH;
};
class NATbaseRESfrm: RscFrame
{
	idc = 1802;
	text = "RESOURCES"; //--- ToDo: Localize;
	x = 0.6 * safezoneW + safezoneX;
	y = 0.34 * safezoneH + safezoneY;
	w = 0.125 * safezoneW;
	h = 0.1 * safezoneH;
};
class NATbaseUNITfrm: RscFrame
{
	idc = 1803;
	text = "RECRUITMENT"; //--- ToDo: Localize;
	x = 0.275 * safezoneW + safezoneX;
	y = 0.34 * safezoneH + safezoneY;
	w = 0.1625 * safezoneW;
	h = 0.36 * safezoneH;
};
class NATbaseVEHfrm: RscFrame
{
	idc = 1804;
	text = "VEHICLE BUILDING"; //--- ToDo: Localize;
	x = 0.4375 * safezoneW + safezoneX;
	y = 0.34 * safezoneH + safezoneY;
	w = 0.1625 * safezoneW;
	h = 0.36 * safezoneH;
};
class NATbaseSIDEBARfrm: RscFrame
{
	idc = 1805;
	x = 0.6 * safezoneW + safezoneX;
	y = 0.46 * safezoneH + safezoneY;
	w = 0.125 * safezoneW;
	h = 0.24 * safezoneH;
};
class NATforceFRM: RscFrame
{
	idc = 1806;
	x = 0.6 * safezoneW + safezoneX;
	y = 0.44 * safezoneH + safezoneY;
	w = 0.125 * safezoneW;
	h = 0.02 * safezoneH;
};
class NATsidebarBtn1: RscButton
{
	idc = 1604;
	text = "SIDEBAR"; //--- ToDo: Localize;
	x = 0.6125 * safezoneW + safezoneX;
	y = 0.472 * safezoneH + safezoneY;
	w = 0.1 * safezoneW;
	h = 0.02 * safezoneH;
};
class NATsidebarBtn2: RscButton
{
	idc = 1605;
	text = "SIDEBAR"; //--- ToDo: Localize;
	x = 0.6125 * safezoneW + safezoneX;
	y = 0.504 * safezoneH + safezoneY;
	w = 0.1 * safezoneW;
	h = 0.02 * safezoneH;
};
class NATsidebarBtn3: RscButton
{
	idc = 1606;
	text = "SIDEBAR"; //--- ToDo: Localize;
	x = 0.6125 * safezoneW + safezoneX;
	y = 0.536 * safezoneH + safezoneY;
	w = 0.1 * safezoneW;
	h = 0.02 * safezoneH;
};
class NATsidebarBtn4: RscButton
{
	idc = 1607;
	text = "SIDEBAR"; //--- ToDo: Localize;
	x = 0.6125 * safezoneW + safezoneX;
	y = 0.568 * safezoneH + safezoneY;
	w = 0.1 * safezoneW;
	h = 0.02 * safezoneH;
};
class NATsidebarBtn5: RscButton
{
	idc = 1608;
	text = "SIDEBAR"; //--- ToDo: Localize;
	x = 0.6125 * safezoneW + safezoneX;
	y = 0.6 * safezoneH + safezoneY;
	w = 0.1 * safezoneW;
	h = 0.02 * safezoneH;
};
class NATsidebarBtn6: RscButton
{
	idc = 1609;
	text = "SIDEBAR"; //--- ToDo: Localize;
	x = 0.6125 * safezoneW + safezoneX;
	y = 0.632 * safezoneH + safezoneY;
	w = 0.1 * safezoneW;
	h = 0.02 * safezoneH;
};
class NATsidebarBtn7: RscButton
{
	idc = 1610;
	text = "SIDEBAR"; //--- ToDo: Localize;
	x = 0.6125 * safezoneW + safezoneX;
	y = 0.664 * safezoneH + safezoneY;
	w = 0.1 * safezoneW;
	h = 0.02 * safezoneH;
};
class NATbaseCLOSEbtn: RscButton
{
	idc = 1602;
	text = "CLOSE"; //--- ToDo: Localize;
	x = 0.6125 * safezoneW + safezoneX;
	y = 0.708 * safezoneH + safezoneY;
	w = 0.1 * safezoneW;
	h = 0.04 * safezoneH;
};
class NATunitLIST: RscListbox
{
	idc = 1500;
	x = 0.28125 * safezoneW + safezoneX;
	y = 0.36 * safezoneH + safezoneY;
	w = 0.15 * safezoneW;
	h = 0.32 * safezoneH;
};
class NATbaseBUILDvehBTN: RscButton
{
	idc = 1601;
	text = "BUILD VEHICLE"; //--- ToDo: Localize;
	x = 0.45 * safezoneW + safezoneX;
	y = 0.708 * safezoneH + safezoneY;
	w = 0.1375 * safezoneW;
	h = 0.04 * safezoneH;
};
class NATbaseRECRUITbutton: RscButton
{
	idc = 1600;
	text = "RECRUIT UNIT"; //--- ToDo: Localize;
	x = 0.2875 * safezoneW + safezoneX;
	y = 0.708 * safezoneH + safezoneY;
	w = 0.1375 * safezoneW;
	h = 0.04 * safezoneH;
};
class NATvehicleLIST: RscListbox
{
	idc = 1501;
	x = 0.445 * safezoneW + safezoneX;
	y = 0.36 * safezoneH + safezoneY;
	w = 0.15 * safezoneW;
	h = 0.32 * safezoneH;
};
class NAThungerICON: RscPicture
{
	idc = 1200;
	text = "#(argb,8,8,3)color(1,1,1,1)";
	x = 0.6125 * safezoneW + safezoneX;
	y = 0.36 * safezoneH + safezoneY;
	w = 0.025 * safezoneW;
	h = 0.04 * safezoneH;
};
class NATwaterICON: RscPicture
{
	idc = 1201;
	text = "#(argb,8,8,3)color(1,1,1,1)";
	x = 0.65 * safezoneW + safezoneX;
	y = 0.36 * safezoneH + safezoneY;
	w = 0.025 * safezoneW;
	h = 0.04 * safezoneH;
};
class NATscrapICON: RscPicture
{
	idc = 1202;
	text = "#(argb,8,8,3)color(1,1,1,1)";
	x = 0.6875 * safezoneW + safezoneX;
	y = 0.36 * safezoneH + safezoneY;
	w = 0.025 * safezoneW;
	h = 0.04 * safezoneH;
};
class NATfoodTXT: RscStructuredText
{
	idc = 1101;
	text = "999"; //--- ToDo: Localize;
	x = 0.6125 * safezoneW + safezoneX;
	y = 0.408 * safezoneH + safezoneY;
	w = 0.025 * safezoneW;
	h = 0.02 * safezoneH;
};
class NATwaterTXT: RscStructuredText
{
	idc = 1102;
	text = "999"; //--- ToDo: Localize;
	x = 0.65 * safezoneW + safezoneX;
	y = 0.408 * safezoneH + safezoneY;
	w = 0.025 * safezoneW;
	h = 0.02 * safezoneH;
};
class NATscrapTEXT: RscStructuredText
{
	idc = 1103;
	text = "999"; //--- ToDo: Localize;
	x = 0.6875 * safezoneW + safezoneX;
	y = 0.408 * safezoneH + safezoneY;
	w = 0.025 * safezoneW;
	h = 0.02 * safezoneH;
};
class NATFORCETXT: RscStructuredText
{
	idc = 1104;
	text = "FORCE POWER: 100"; //--- ToDo: Localize;
	x = 0.6 * safezoneW + safezoneX;
	y = 0.44 * safezoneH + safezoneY;
	w = 0.125 * safezoneW;
	h = 0.02 * safezoneH;
};
class NATtopTXT: RscStructuredText
{
	idc = 1100;
	text = "BASE REQUESTER"; //--- ToDo: Localize;
	x = 0.2625 * safezoneW + safezoneX;
	y = 0.3 * safezoneH + safezoneY;
	w = 0.475 * safezoneW;
	h = 0.02 * safezoneH;
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////
};
};