class NAT_crafting
{
	idd = 8910;
	movingenable = true;
	enableSimulation = 1;

class controls
{
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Jay, v1.063, #Nepoty)
////////////////////////////////////////////////////////
class NATcraftBG: IGUIBack
{
	idc = 2200;
	x = 0.324688 * safezoneW + safezoneX;
	y = 0.247 * safezoneH + safezoneY;
	w = 0.350625 * safezoneW;
	h = 0.462 * safezoneH;
};
class NATcraftFRM: RscFrame
{
	idc = 1800;
	x = 0.324687 * safezoneW + safezoneX;
	y = 0.247 * safezoneH + safezoneY;
	w = 0.350625 * safezoneW;
	h = 0.462 * safezoneH;
};
class NATcraftCATEGORYselect: RscCombo
{
	idc = 2100;
	x = 0.335 * safezoneW + safezoneX;
	y = 0.258 * safezoneH + safezoneY;
	w = 0.134062 * safezoneW;
	h = 0.022 * safezoneH;
};
class NATcraftICON: RscPicture
{
	idc = 1200;
	text = "#(argb,8,8,3)color(1,1,1,0)";
	x = 0.335 * safezoneW + safezoneX;
	y = 0.412 * safezoneH + safezoneY;
	w = 0.134062 * safezoneW;
	h = 0.286 * safezoneH;
};
class NATcraftITEMselect: RscListbox
{
	idc = 1500;
	text = "FIRE PLACE"; //--- ToDo: Localize;
	x = 0.335 * safezoneW + safezoneX;
	y = 0.291 * safezoneH + safezoneY;
	w = 0.134062 * safezoneW;
	h = 0.11 * safezoneH;
};
class NATcraftCRAFTbtn: RscButton
{
	idc = 1600;
	text = "CRAFT"; //--- ToDo: Localize;
	x = 0.479375 * safezoneW + safezoneX;
	y = 0.258 * safezoneH + safezoneY;
	w = 0.108281 * safezoneW;
	h = 0.022 * safezoneH;
};
class NATcraftCLOSEbtn: RscButton
{
	idc = 1601;
	text = "CLOSE"; //--- ToDo: Localize;
	x = 0.592813 * safezoneW + safezoneX;
	y = 0.258 * safezoneH + safezoneY;
	w = 0.0721875 * safezoneW;
	h = 0.022 * safezoneH;
};
class NATcraftINGREDIENTS: RscStructuredText
{
	idc = 1100;
	text = "2 parts Rum,  3 parts coke, 1 part baileys"; //--- ToDo: Localize;
	x = 0.479375 * safezoneW + safezoneX;
	y = 0.291 * safezoneH + safezoneY;
	w = 0.185625 * safezoneW;
	h = 0.407 * safezoneH;
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////
};
};