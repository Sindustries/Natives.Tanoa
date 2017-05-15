class NAT_baseMenu
{
	idd = 4040;
	movingenable = false;
	enableSimulation = 1;

class controls
{
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Jay, v1.063, #Taxyfo)
////////////////////////////////////////////////////////

class NATbaseBG: IGUIBack
{
	idc = 2200;
	x = 0.355624 * safezoneW + safezoneX;
	y = 0.291 * safezoneH + safezoneY;
	w = 0.309375 * safezoneW;
	h = 0.374 * safezoneH;
};
class NATbaseTopBg: IGUIBack
{
	idc = 2201;
	x = 0.355624 * safezoneW + safezoneX;
	y = 0.291 * safezoneH + safezoneY;
	w = 0.309375 * safezoneW;
	h = 0.022 * safezoneH;
};
class NATbaseMAINfrm: RscFrame
{
	idc = 1800;
	x = 0.355625 * safezoneW + safezoneX;
	y = 0.291 * safezoneH + safezoneY;
	w = 0.309375 * safezoneW;
	h = 0.374 * safezoneH;
};
class NATbaseTOPfrm: RscFrame
{
	idc = 1801;
	x = 0.355625 * safezoneW + safezoneX;
	y = 0.291 * safezoneH + safezoneY;
	w = 0.309375 * safezoneW;
	h = 0.022 * safezoneH;
};
class NATbaseUNITrqFrm: RscFrame
{
	idc = 1802;
	x = 0.365937 * safezoneW + safezoneX;
	y = 0.401 * safezoneH + safezoneY;
	w = 0.0928125 * safezoneW;
	h = 0.198 * safezoneH;
};
class NATbaseREQUNITbtn: RscButton
{
	idc = 1600;
	text = "REQUEST UNIT"; //--- ToDo: Localize;
	x = 0.371094 * safezoneW + safezoneX;
	y = 0.61 * safezoneH + safezoneY;
	w = 0.0825 * safezoneW;
	h = 0.033 * safezoneH;
};
class NATbaseUNITSlist: RscListbox
{
	idc = 1500;
	x = 0.371094 * safezoneW + safezoneX;
	y = 0.412 * safezoneH + safezoneY;
	w = 0.0825 * safezoneW;
	h = 0.176 * safezoneH;
};
class NAThudSTATSfrm: RscFrame
{
	idc = 1803;
	x = 0.37625 * safezoneW + safezoneX;
	y = 0.324 * safezoneH + safezoneY;
	w = 0.278437 * safezoneW;
	h = 0.066 * safezoneH;
};
class NATbaseVEHfrm: RscFrame
{
	idc = 1804;
	x = 0.463906 * safezoneW + safezoneX;
	y = 0.401 * safezoneH + safezoneY;
	w = 0.0928125 * safezoneW;
	h = 0.198 * safezoneH;
};
class NATbasVEHlist: RscListbox
{
	idc = 1501;
	x = 0.469062 * safezoneW + safezoneX;
	y = 0.412 * safezoneH + safezoneY;
	w = 0.0825 * safezoneW;
	h = 0.176 * safezoneH;
};
class NATbaseREQvehBtn: RscButton
{
	idc = 1601;
	text = "REQUEST VEHICLE"; //--- ToDo: Localize;
	x = 0.469062 * safezoneW + safezoneX;
	y = 0.61 * safezoneH + safezoneY;
	w = 0.0825 * safezoneW;
	h = 0.033 * safezoneH;
};
class NATbaseSideBarFRM: RscFrame
{
	idc = 1805;
	x = 0.561875 * safezoneW + safezoneX;
	y = 0.401 * safezoneH + safezoneY;
	w = 0.0928125 * safezoneW;
	h = 0.242 * safezoneH;
};
class NATbaseSideBtn1: RscButton
{
	idc = 1602;
	text = "SIDEBAR 1"; //--- ToDo: Localize;
	x = 0.567031 * safezoneW + safezoneX;
	y = 0.412 * safezoneH + safezoneY;
	w = 0.0825 * safezoneW;
	h = 0.022 * safezoneH;
};
class NATbaseSideBtn2: RscButton
{
	idc = 1603;
	text = "SIDEBAR 2"; //--- ToDo: Localize;
	x = 0.567031 * safezoneW + safezoneX;
	y = 0.445 * safezoneH + safezoneY;
	w = 0.0825 * safezoneW;
	h = 0.022 * safezoneH;
};
class NATbaseSideBtn3: RscButton
{
	idc = 1604;
	text = "SIDEBAR 3"; //--- ToDo: Localize;
	x = 0.567031 * safezoneW + safezoneX;
	y = 0.478 * safezoneH + safezoneY;
	w = 0.0825 * safezoneW;
	h = 0.022 * safezoneH;
};
class NATbaseSideBtn4: RscButton
{
	idc = 1605;
	text = "SIDEBAR 4"; //--- ToDo: Localize;
	x = 0.567031 * safezoneW + safezoneX;
	y = 0.511 * safezoneH + safezoneY;
	w = 0.0825 * safezoneW;
	h = 0.022 * safezoneH;
};
class NATbaseSideBtn5: RscButton
{
	idc = 1606;
	text = "SIDEBAR 5"; //--- ToDo: Localize;
	x = 0.567031 * safezoneW + safezoneX;
	y = 0.544 * safezoneH + safezoneY;
	w = 0.0825 * safezoneW;
	h = 0.022 * safezoneH;
};
class NATbaseSideBtn6: RscButton
{
	idc = 1607;
	text = "SIDEBAR 6"; //--- ToDo: Localize;
	x = 0.567031 * safezoneW + safezoneX;
	y = 0.577 * safezoneH + safezoneY;
	w = 0.0825 * safezoneW;
	h = 0.022 * safezoneH;
};
class NATbaseSideBtn7: RscButton
{
	idc = 1608;
	text = "SIDEBAR 7"; //--- ToDo: Localize;
	x = 0.567031 * safezoneW + safezoneX;
	y = 0.61 * safezoneH + safezoneY;
	w = 0.0825 * safezoneW;
	h = 0.022 * safezoneH;
};
class NATbaseRESicon1: RscPicture
{
	idc = 1200;
	text = "#(argb,8,8,3)color(1,1,1,0)";
	x = 0.381406 * safezoneW + safezoneX;
	y = 0.335 * safezoneH + safezoneY;
	w = 0.020625 * safezoneW;
	h = 0.044 * safezoneH;
};
class NATbaseRESicon2: RscPicture
{
	idc = 1201;
	text = "#(argb,8,8,3)color(1,1,1,0)";
	x = 0.432969 * safezoneW + safezoneX;
	y = 0.335 * safezoneH + safezoneY;
	w = 0.020625 * safezoneW;
	h = 0.044 * safezoneH;
};
class NATbaseRESicon3: RscPicture
{
	idc = 1202;
	text = "#(argb,8,8,3)color(1,1,1,0)";
	x = 0.484531 * safezoneW + safezoneX;
	y = 0.335 * safezoneH + safezoneY;
	w = 0.020625 * safezoneW;
	h = 0.044 * safezoneH;
};
class NATsidebartopFrm: RscFrame
{
	idc = 1806;
	x = 0.536094 * safezoneW + safezoneX;
	y = 0.324 * safezoneH + safezoneY;
	w = 0.118594 * safezoneW;
	h = 0.066 * safezoneH;
};
class NATbaseRES1txt: RscText
{
	idc = 1000;
	text = "9999"; //--- ToDo: Localize;
	x = 0.402031 * safezoneW + safezoneX;
	y = 0.346 * safezoneH + safezoneY;
	w = 0.0257812 * safezoneW;
	h = 0.022 * safezoneH;
};
class NATbaseRES2txt: RscText
{
	idc = 1001;
	text = "9999"; //--- ToDo: Localize;
	x = 0.453594 * safezoneW + safezoneX;
	y = 0.346 * safezoneH + safezoneY;
	w = 0.0257812 * safezoneW;
	h = 0.022 * safezoneH;
};
class NATbaseRES13txt: RscText
{
	idc = 1002;
	text = "9999"; //--- ToDo: Localize;
	x = 0.505156 * safezoneW + safezoneX;
	y = 0.346 * safezoneH + safezoneY;
	w = 0.0257812 * safezoneW;
	h = 0.022 * safezoneH;
};
class NATbaseSIDEBARFPtxt: RscText
{
	idc = 1003;
	text = "FORCE POWER:"; //--- ToDo: Localize;
	x = 0.54125 * safezoneW + safezoneX;
	y = 0.335 * safezoneH + safezoneY;
	w = 0.0670312 * safezoneW;
	h = 0.022 * safezoneH;
};
class NATbaseSidebarTEXT2: RscText
{
	idc = 1005;
	text = "No idea yet..."; //--- ToDo: Localize;
	x = 0.54125 * safezoneW + safezoneX;
	y = 0.357 * safezoneH + safezoneY;
	w = 0.0515625 * safezoneW;
	h = 0.022 * safezoneH;
};
class NATbaseSidebarFORCEnmb: RscText
{
	idc = 1004;
	text = "9999"; //--- ToDo: Localize;
	x = 0.613437 * safezoneW + safezoneX;
	y = 0.335 * safezoneH + safezoneY;
	w = 0.0257812 * safezoneW;
	h = 0.022 * safezoneH;
};
class NATbaseSidebarNumber2: RscText
{
	idc = 1006;
	text = "9999"; //--- ToDo: Localize;
	x = 0.613437 * safezoneW + safezoneX;
	y = 0.357 * safezoneH + safezoneY;
	w = 0.0257812 * safezoneW;
	h = 0.022 * safezoneH;
};
class NATbaseTOPBRtxt: RscText
{
	idc = 1007;
	text = "REQUESTER"; //--- ToDo: Localize;
	x = 0.484531 * safezoneW + safezoneX;
	y = 0.291 * safezoneH + safezoneY;
	w = 0.0567187 * safezoneW;
	h = 0.022 * safezoneH;
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////

};
};