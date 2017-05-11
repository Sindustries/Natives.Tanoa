class NAT_vInv
{
	idd = 3300;
	movingenable = true;
	enableSimulation = 1;

class controls
{

////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Jay, v1.063, #Pifola)
////////////////////////////////////////////////////////

class NATinvBG: IGUIBack
{
	idc = 3301;
	x = 0.530937 * safezoneW + safezoneX;
	y = 0.28 * safezoneH + safezoneY;
	w = 0.144375 * safezoneW;
	h = 0.341 * safezoneH;
};
class NATinvbgFRM: RscFrame
{
	idc = 3302;
	x = 0.530937 * safezoneW + safezoneX;
	y = 0.28 * safezoneH + safezoneY;
	w = 0.144375 * safezoneW;
	h = 0.341 * safezoneH;
};
class NATinvUSEbtn: RscButton
{
	idc = 3305;
	text = "USE"; //--- ToDo: Localize;
	font = "PuristaMedium";
	sizeEX = "0.016 / (getResolution select 5)";
	x = 0.546406 * safezoneW + safezoneX;
	y = 0.577 * safezoneH + safezoneY;
	w = 0.0515625 * safezoneW;
	h = 0.033 * safezoneH;
};
class NATinvHPfrm: RscFrame
{
	idc = 3306;
	text = "HP"; //--- ToDo: Localize;
	font = "PuristaMedium";
	sizeEX = "0.016 / (getResolution select 5)";
	x = 0.551562 * safezoneW + safezoneX;
	y = 0.291 * safezoneH + safezoneY;
	w = 0.0309375 * safezoneW;
	h = 0.044 * safezoneH;
};
class NATinvHPtxt: RscText
{
	idc = 3307;
	text = "67%"; //--- ToDo: Localize;
	font = "PuristaMedium";
	sizeEX = "0.016 / (getResolution select 5)";
	x = 0.554657 * safezoneW + safezoneX;
	y = 0.3086 * safezoneH + safezoneY;
	w = 0.020625 * safezoneW;
	h = 0.022 * safezoneH;
};
class NATinvDROPbtn: RscButton
{
	idc = 3308;
	text = "DROP"; //--- ToDo: Localize;
	font = "PuristaMedium";
	sizeEX = "0.016 / (getResolution select 5)";
	x = 0.608281 * safezoneW + safezoneX;
	y = 0.577 * safezoneH + safezoneY;
	w = 0.0515625 * safezoneW;
	h = 0.033 * safezoneH;
};
class NAThudPLAYERselect: RscCombo
{
	idc = 3309;
	text = "Yourself"; //--- ToDo: Localize;
	font = "PuristaMedium";
	sizeEX = "0.016 / (getResolution select 5)";
	x = 0.541249 * safezoneW + safezoneX;
	y = 0.544 * safezoneH + safezoneY;
	w = 0.12375 * safezoneW;
	h = 0.022 * safezoneH;
};
class NATinvITEMlist: RscListbox
{
	idc = 3310;
	text = "First Aid Kit: 66"; //--- ToDo: Localize;
	font = "PuristaMedium";
	sizeEX = "0.016 / (getResolution select 5)";
	x = 0.54125 * safezoneW + safezoneX;
	y = 0.346 * safezoneH + safezoneY;
	w = 0.12375 * safezoneW;
	h = 0.187 * safezoneH;
};
class NAThudHUNGERfrm: RscFrame
{
	idc = 1804;
	text = "HGR"; //--- ToDo: Localize;
	font = "PuristaMedium";
	sizeEX = "0.016 / (getResolution select 5)";
	x = 0.587656 * safezoneW + safezoneX;
	y = 0.291 * safezoneH + safezoneY;
	w = 0.0309375 * safezoneW;
	h = 0.044 * safezoneH;
};
class HADinvTHIRSTfrm: RscFrame
{
	idc = 1805;
	text = "THR"; //--- ToDo: Localize;
	font = "PuristaMedium";
	sizeEX = "0.016 / (getResolution select 5)";
	x = 0.62375 * safezoneW + safezoneX;
	y = 0.291 * safezoneH + safezoneY;
	w = 0.0309375 * safezoneW;
	h = 0.044 * safezoneH;
};
class NAThudHGRtxt: RscText
{
	idc = 3233;
	text = "12%"; //--- ToDo: Localize;
	font = "PuristaMedium";
	sizeEX = "0.016 / (getResolution select 5)";
	x = 0.59075 * safezoneW + safezoneX;
	y = 0.3086 * safezoneH + safezoneY;
	w = 0.020625 * safezoneW;
	h = 0.022 * safezoneH;
};
class NAThudTHIRSTtxt: RscText
{
	idc = 3234;
	text = "45%"; //--- ToDo: Localize;
	font = "PuristaMedium";
	sizeEX = "0.016 / (getResolution select 5)";
	x = 0.626844 * safezoneW + safezoneX;
	y = 0.3086 * safezoneH + safezoneY;
	w = 0.020625 * safezoneW;
	h = 0.022 * safezoneH;
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////


};
};