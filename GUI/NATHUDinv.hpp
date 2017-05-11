class NAT_vInv
{
	idd = 3300;
	movingenable = true;
	enableSimulation = 1;
	onLoad = "uiNamespace setVariable ['NATinvHPpbar', (_this select 0) displayCtrl 2400]; uiNamespace setVariable ['NATinvHungerpbar', (_this select 0) displayCtrl 2401]; uiNamespace setVariable ['NATinvThirstpbar', (_this select 0) displayCtrl 2402]; uiNamespace setVariable ['NATinvSleeppbar', (_this select 0) displayCtrl 2403]; uiNamespace setVariable ['NATinvRadpbar', (_this select 0) displayCtrl 2404];";

class controls
{
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Jay, v1.063, #Cobegu)
////////////////////////////////////////////////////////

class NATinvBG: IGUIBack
{
	idc = 2200;
	x = 0.407187 * safezoneW + safezoneX;
	y = 0.28 * safezoneH + safezoneY;
	w = 0.268125 * safezoneW;
	h = 0.33 * safezoneH;
};
class NATinvSTATUSfrm: RscFrame
{
	idc = 1801;
	x = 0.407187 * safezoneW + safezoneX;
	y = 0.302 * safezoneH + safezoneY;
	w = 0.134062 * safezoneW;
	h = 0.308 * safezoneH;
};
class NATinvbgFRM: RscFrame
{
	idc = 1800;
	x = 0.54125 * safezoneW + safezoneX;
	y = 0.302 * safezoneH + safezoneY;
	w = 0.134062 * safezoneW;
	h = 0.308 * safezoneH;
};
class NATinvUSEbtn: RscButton
{
	idc = 1600;
	text = "USE"; //--- ToDo: Localize;
	font = "PuristaMedium";
	sizeEX = "0.016 / (getResolution select 5)";
	x = 0.546406 * safezoneW + safezoneX;
	y = 0.566 * safezoneH + safezoneY;
	w = 0.0360937 * safezoneW;
	h = 0.033 * safezoneH;
};
class NATinvHPfrm: RscFrame
{
	idc = 1802;
	x = 0.412344 * safezoneW + safezoneX;
	y = 0.313 * safezoneH + safezoneY;
	w = 0.0670312 * safezoneW;
	h = 0.033 * safezoneH;
};
class NATinvDROPbtn: RscButton
{
	idc = 1601;
	text = "DROP"; //--- ToDo: Localize;
	font = "PuristaMedium";
	sizeEX = "0.016 / (getResolution select 5)";
	x = 0.634062 * safezoneW + safezoneX;
	y = 0.566 * safezoneH + safezoneY;
	w = 0.0360937 * safezoneW;
	h = 0.033 * safezoneH;
};
class NAThudPLAYERselect: RscCombo
{
	idc = 2100;
	text = "Yourself"; //--- ToDo: Localize;
	font = "PuristaMedium";
	sizeEX = "0.016 / (getResolution select 5)";
	x = 0.546406 * safezoneW + safezoneX;
	y = 0.5396 * safezoneH + safezoneY;
	w = 0.12375 * safezoneW;
	h = 0.022 * safezoneH;
};
class NATinvITEMlist: RscListbox
{
	idc = 1500;
	text = "First Aid Kit: 66"; //--- ToDo: Localize;
	font = "PuristaMedium";
	sizeEX = "0.016 / (getResolution select 5)";
	x = 0.546406 * safezoneW + safezoneX;
	y = 0.313 * safezoneH + safezoneY;
	w = 0.12375 * safezoneW;
	h = 0.22 * safezoneH;
};
class NAThudHUNGERfrm: RscFrame
{
	idc = 1804;
	x = 0.412344 * safezoneW + safezoneX;
	y = 0.346 * safezoneH + safezoneY;
	w = 0.0670312 * safezoneW;
	h = 0.033 * safezoneH;
};
class HADinvTHIRSTfrm: RscFrame
{
	idc = 1805;
	x = 0.412344 * safezoneW + safezoneX;
	y = 0.379 * safezoneH + safezoneY;
	w = 0.0670312 * safezoneW;
	h = 0.033 * safezoneH;
};
class NAThudTOPBARbg: IGUIBack
{
	idc = 2201;
	x = 0.407187 * safezoneW + safezoneX;
	y = 0.28 * safezoneH + safezoneY;
	w = 0.268125 * safezoneW;
	h = 0.022 * safezoneH;
};
class NATinvGIVEbtn: RscButton
{
	idc = 1602;
	text = "GIVE"; //--- ToDo: Localize;
	font = "PuristaMedium";
	sizeEX = "0.016 / (getResolution select 5)";
	x = 0.59075 * safezoneW + safezoneX;
	y = 0.566 * safezoneH + safezoneY;
	w = 0.0360937 * safezoneW;
	h = 0.033 * safezoneH;
};
class NATinvTOPBARfrm: RscFrame
{
	idc = 1803;
	x = 0.407188 * safezoneW + safezoneX;
	y = 0.28 * safezoneH + safezoneY;
	w = 0.268125 * safezoneW;
	h = 0.022 * safezoneH;
};
class NATinvTOPBARtxt: RscText
{
	idc = 1000;
	text = "VIRTUAL INVENTORY"; //--- ToDo: Localize;
	font = "PuristaMedium";
	sizeEX = "0.016 / (getResolution select 5)";
	x = 0.564969 * safezoneW + safezoneX;
	y = 0.28 * safezoneH + safezoneY;
	w = 0.0773437 * safezoneW;
	h = 0.022 * safezoneH;
};
class NATinvSTATUStxt: RscText
{
	idc = 1004;
	text = "STATUS"; //--- ToDo: Localize;
	font = "PuristaMedium";
	sizeEX = "0.016 / (getResolution select 5)";
	x = 0.45875 * safezoneW + safezoneX;
	y = 0.28 * safezoneH + safezoneY;
	w = 0.0309375 * safezoneW;
	h = 0.022 * safezoneH;
};
class NATinvGASMASKfrm: RscFrame
{
	idc = 1806;
	x = 0.484531 * safezoneW + safezoneX;
	y = 0.313 * safezoneH + safezoneY;
	w = 0.0515625 * safezoneW;
	h = 0.165 * safezoneH;
};
class NATinvGASMASKicon: RscPicture
{
	idc = 1200;
	text = "#(argb,8,8,3)color(1,1,1,1)";
	x = 0.489687 * safezoneW + safezoneX;
	y = 0.3196 * safezoneH + safezoneY;
	w = 0.04125 * safezoneW;
	h = 0.088 * safezoneH;
};
class NATinvGASMASKbtn: RscButton
{
	idc = 1603;
	text = "RE/EQUIP"; //--- ToDo: Localize;
	font = "PuristaMedium";
	sizeEX = "0.016 / (getResolution select 5)";
	x = 0.489687 * safezoneW + safezoneX;
	y = 0.4164 * safezoneH + safezoneY;
	w = 0.04125 * safezoneW;
	h = 0.022 * safezoneH;
};
class NATinvHPicon: RscPicture
{
	idc = 1201;
	text = "GUI\img\health.paa";
	x = 0.416469 * safezoneW + safezoneX;
	y = 0.3174 * safezoneH + safezoneY;
	w = 0.0103125 * safezoneW;
	h = 0.022 * safezoneH;
};
class NATinvHUNGERicon: RscPicture
{
	idc = 1202;
	text = "GUI\img\meat.paa";
	x = 0.416469 * safezoneW + safezoneX;
	y = 0.3526 * safezoneH + safezoneY;
	w = 0.0103125 * safezoneW;
	h = 0.022 * safezoneH;
};
class NATinvTHIRSTicon: RscPicture
{
	idc = 1203;
	text = "GUI\img\water.paa";
	x = 0.416469 * safezoneW + safezoneX;
	y = 0.3834 * safezoneH + safezoneY;
	w = 0.0103125 * safezoneW;
	h = 0.022 * safezoneH;
};
class NATinvSLEEPicon: RscPicture
{
	idc = 1204;
	text = "GUI\img\sleep.paa";
	x = 0.416469 * safezoneW + safezoneX;
	y = 0.4164 * safezoneH + safezoneY;
	w = 0.0103125 * safezoneW;
	h = 0.022 * safezoneH;
};
class HPbarbackground: ProgressBaseTextHUD
{
	idc = 9400;
	x = 0.429875 * safezoneW + safezoneX;
	y = 0.3174 * safezoneH + safezoneY;
	w = 0.0464063 * safezoneW;
	h = 0.022 * safezoneH;
	colorBackground[] = {1,0,0,1};
};
class HPbarProgress: RscProgressBar
{
	idc = 2400;
	text = ""; //--- ToDo: Localize;
	font = "PuristaMedium";
	sizeEX = "0.016 / (getResolution select 5)";
	x = 0.429875 * safezoneW + safezoneX;
	y = 0.3174 * safezoneH + safezoneY;
	w = 0.0464063 * safezoneW;
	h = 0.022 * safezoneH;
};
class NATinvSLEEPfrm: RscFrame
{
	idc = 1807;
	x = 0.412344 * safezoneW + safezoneX;
	y = 0.412 * safezoneH + safezoneY;
	w = 0.0670312 * safezoneW;
	h = 0.033 * safezoneH;
};
class Hungerbarbackground: ProgressBaseTextHUD
{
	idc = 9401;
	x = 0.429874 * safezoneW + safezoneX;
	y = 0.3526 * safezoneH + safezoneY;
	w = 0.0464063 * safezoneW;
	h = 0.022 * safezoneH;
	colorBackground[] = {1,0,0,1};
};
class HungerbarProgress: RscProgressBar
{
	idc = 2401;
	text = ""; //--- ToDo: Localize;
	font = "PuristaMedium";
	sizeEX = "0.016 / (getResolution select 5)";
	x = 0.429874 * safezoneW + safezoneX;
	y = 0.3526 * safezoneH + safezoneY;
	w = 0.0464063 * safezoneW;
	h = 0.022 * safezoneH;
};
class Thirstbarbackground: ProgressBaseTextHUD
{
	idc = 9402;
	x = 0.429876 * safezoneW + safezoneX;
	y = 0.3834 * safezoneH + safezoneY;
	w = 0.0464063 * safezoneW;
	h = 0.022 * safezoneH;
	colorBackground[] = {1,0,0,1};
};
class ThirstbarProgress: RscProgressBar
{
	idc = 2402;
	text = ""; //--- ToDo: Localize;
	font = "PuristaMedium";
	sizeEX = "0.016 / (getResolution select 5)";
	x = 0.429876 * safezoneW + safezoneX;
	y = 0.3834 * safezoneH + safezoneY;
	w = 0.0464063 * safezoneW;
	h = 0.022 * safezoneH;
};
class Sleepbarbackground: ProgressBaseTextHUD
{
	idc = 9450;
	x = 0.429876 * safezoneW + safezoneX;
	y = 0.4164 * safezoneH + safezoneY;
	w = 0.0464063 * safezoneW;
	h = 0.022 * safezoneH;
	colorBackground[] = {1,0,0,1};
};
class SleepbarProgress: RscProgressBar
{
	idc = 2403;
	text = ""; //--- ToDo: Localize;
	font = "PuristaMedium";
	sizeEX = "0.016 / (getResolution select 5)";
	x = 0.429876 * safezoneW + safezoneX;
	y = 0.4164 * safezoneH + safezoneY;
	w = 0.0464063 * safezoneW;
	h = 0.022 * safezoneH;
};
class NATinvRADfrm: RscFrame
{
	idc = 1808;
	x = 0.412344 * safezoneW + safezoneX;
	y = 0.445 * safezoneH + safezoneY;
	w = 0.0670312 * safezoneW;
	h = 0.033 * safezoneH;
};
class NATinvRADicon: RscPicture
{
	idc = 1205;
	text = "GUI\img\radiation.paa";
	x = 0.416469 * safezoneW + safezoneX;
	y = 0.4494 * safezoneH + safezoneY;
	w = 0.0103125 * safezoneW;
	h = 0.022 * safezoneH;
};
class Radbarbackground: ProgressBaseTextHUD
{
	idc = 9430;
	x = 0.429876 * safezoneW + safezoneX;
	y = 0.4494 * safezoneH + safezoneY;
	w = 0.0464063 * safezoneW;
	h = 0.022 * safezoneH;
	colorBackground[] = {1,0,0,1};
};
class RadbarProgress: RscProgressBar
{
	idc = 2404;
	text = ""; //--- ToDo: Localize;
	font = "PuristaMedium";
	sizeEX = "0.016 / (getResolution select 5)";
	x = 0.429876 * safezoneW + safezoneX;
	y = 0.4494 * safezoneH + safezoneY;
	w = 0.0464063 * safezoneW;
	h = 0.022 * safezoneH;
};
class NATinvGASMASKbtn2: RscButton
{
	idc = 1604;
	text = "CLEAR"; //--- ToDo: Localize;
	font = "PuristaMedium";
	sizeEX = "0.016 / (getResolution select 5)";
	x = 0.489687 * safezoneW + safezoneX;
	y = 0.445 * safezoneH + safezoneY;
	w = 0.04125 * safezoneW;
	h = 0.022 * safezoneH;
};
class NATmodifierFRM: RscFrame
{
	idc = 1809;
	x = 0.412344 * safezoneW + safezoneX;
	y = 0.489 * safezoneH + safezoneY;
	w = 0.12375 * safezoneW;
	h = 0.099 * safezoneH;
};
class NATmodifierBG: IGUIBack
{
	idc = 2202;
	x = 0.412344 * safezoneW + safezoneX;
	y = 0.489 * safezoneH + safezoneY;
	w = 0.12375 * safezoneW;
	h = 0.022 * safezoneH;
};
class NATinvMODIFIERtopfrm: RscFrame
{
	idc = 1810;
	x = 0.412344 * safezoneW + safezoneX;
	y = 0.489 * safezoneH + safezoneY;
	w = 0.12375 * safezoneW;
	h = 0.022 * safezoneH;
};
class NATinvMODIFIERtxt: RscText
{
	idc = 1001;
	text = "MODIFIERS"; //--- ToDo: Localize;
	font = "PuristaMedium";
	sizeEX = "0.016 / (getResolution select 5)";
	x = 0.451531 * safezoneW + safezoneX;
	y = 0.489 * safezoneH + safezoneY;
	w = 0.0464063 * safezoneW;
	h = 0.022 * safezoneH;
};
class NATinvMODIFIERicon1: RscPicture
{
	idc = 1206;
	text = "#(argb,8,8,3)color(1,1,1,1)";
	x = 0.4175 * safezoneW + safezoneX;
	y = 0.522 * safezoneH + safezoneY;
	w = 0.0103125 * safezoneW;
	h = 0.022 * safezoneH;
};
class NATinvMODIFIERicon2: RscPicture
{
	idc = 1207;
	text = "#(argb,8,8,3)color(1,1,1,1)";
	x = 0.438125 * safezoneW + safezoneX;
	y = 0.522 * safezoneH + safezoneY;
	w = 0.0103125 * safezoneW;
	h = 0.022 * safezoneH;
};
class NATinvMODIFIERicon7: RscPicture
{
	idc = 1208;
	text = "#(argb,8,8,3)color(1,1,1,1)";
	x = 0.4175 * safezoneW + safezoneX;
	y = 0.555 * safezoneH + safezoneY;
	w = 0.0103125 * safezoneW;
	h = 0.022 * safezoneH;
};
class NATinvMODIFIERicon8: RscPicture
{
	idc = 1209;
	text = "#(argb,8,8,3)color(1,1,1,1)";
	x = 0.438125 * safezoneW + safezoneX;
	y = 0.555 * safezoneH + safezoneY;
	w = 0.0103125 * safezoneW;
	h = 0.022 * safezoneH;
};
class NATinvMODIFIERicon3: RscPicture
{
	idc = 1210;
	text = "#(argb,8,8,3)color(1,1,1,1)";
	x = 0.45875 * safezoneW + safezoneX;
	y = 0.522 * safezoneH + safezoneY;
	w = 0.0103125 * safezoneW;
	h = 0.022 * safezoneH;
};
class NATinvMODIFIERicon4: RscPicture
{
	idc = 1212;
	text = "#(argb,8,8,3)color(1,1,1,1)";
	x = 0.479375 * safezoneW + safezoneX;
	y = 0.522 * safezoneH + safezoneY;
	w = 0.0103125 * safezoneW;
	h = 0.022 * safezoneH;
};
class NATinvMODIFIERicon5: RscPicture
{
	idc = 1213;
	text = "#(argb,8,8,3)color(1,1,1,1)";
	x = 0.5 * safezoneW + safezoneX;
	y = 0.522 * safezoneH + safezoneY;
	w = 0.0103125 * safezoneW;
	h = 0.022 * safezoneH;
};
class NATinvMODIFIERicon6: RscPicture
{
	idc = 1215;
	text = "#(argb,8,8,3)color(1,1,1,1)";
	x = 0.520625 * safezoneW + safezoneX;
	y = 0.522 * safezoneH + safezoneY;
	w = 0.0103125 * safezoneW;
	h = 0.022 * safezoneH;
};
class NATinvMODIFIERicon9: RscPicture
{
	idc = 1211;
	text = "#(argb,8,8,3)color(1,1,1,1)";
	x = 0.45875 * safezoneW + safezoneX;
	y = 0.555 * safezoneH + safezoneY;
	w = 0.0103125 * safezoneW;
	h = 0.022 * safezoneH;
};
class NATinvMODIFIERicon10: RscPicture
{
	idc = 1214;
	text = "#(argb,8,8,3)color(1,1,1,1)";
	x = 0.479375 * safezoneW + safezoneX;
	y = 0.555 * safezoneH + safezoneY;
	w = 0.0103125 * safezoneW;
	h = 0.022 * safezoneH;
};
class NATinvMODIFIERicon11: RscPicture
{
	idc = 1216;
	text = "#(argb,8,8,3)color(1,1,1,1)";
	x = 0.5 * safezoneW + safezoneX;
	y = 0.555 * safezoneH + safezoneY;
	w = 0.0103125 * safezoneW;
	h = 0.022 * safezoneH;
};
class NATinvMODIFIERicon12: RscPicture
{
	idc = 1217;
	text = "#(argb,8,8,3)color(1,1,1,1)";
	x = 0.520625 * safezoneW + safezoneX;
	y = 0.555 * safezoneH + safezoneY;
	w = 0.0103125 * safezoneW;
	h = 0.022 * safezoneH;
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////
};
};