class NAT_HUD
{
	idd = 2200;
	fadeout=0;
	fadein=0;
	duration = 1e+1000;
	onload = "uiNamespace setVariable ['HUNGERBAR', (_this select 0) displayCtrl 1600]; uiNamespace setVariable ['THIRSTBAR', (_this select 0) displayCtrl 1601]; uiNamespace setVariable ['SLEEPBAR', (_this select 0) displayCtrl 1603]; uiNamespace setVariable ['RADIATIONBAR', (_this select 0) displayCtrl 1602];";

class controls
{
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Jay, v1.063, #Dyjoso)
////////////////////////////////////////////////////////
class NAThudRSChungerICO: RscPicture
{
	idc = 1200;
	text = "GUI\img\meat.paa";
	x = 0.984687 * safezoneW + safezoneX;
	y = 0.654 * safezoneH + safezoneY;
	w = 0.0103125 * safezoneW;
	h = 0.022 * safezoneH;
};
class NATrscHungerbarBG: ProgressBaseTextHUD
{
	idc = 9402;
	x = 0.922813 * safezoneW + safezoneX;
	y = 0.6606 * safezoneH + safezoneY;
	w = 0.061875 * safezoneW;
	h = 0.011 * safezoneH;
	colorBackground[] = {0.5,0.5,0.5,0.5};
};
class NATrscHungerbar: RscProgressBar
{
	idc = 1600;
	text = ""; //--- ToDo: Localize;
	x = 0.922813 * safezoneW + safezoneX;
	y = 0.6606 * safezoneH + safezoneY;
	w = 0.061875 * safezoneW;
	h = 0.011 * safezoneH;
};
class NAThudrscThirstIco: RscPicture
{
	idc = 1201;
	text = "GUI\img\water.paa";
	x = 0.984687 * safezoneW + safezoneX;
	y = 0.676 * safezoneH + safezoneY;
	w = 0.0103125 * safezoneW;
	h = 0.022 * safezoneH;
};
class NATrscThirstbarBG: ProgressBaseTextHUD
{
	idc = -1;
	x = 0.922813 * safezoneW + safezoneX;
	y = 0.6826 * safezoneH + safezoneY;
	w = 0.061875 * safezoneW;
	h = 0.011 * safezoneH;
	colorBackground[] = {0.5,0.5,0.5,0.5};
};
class NAThudrscThirstBar: RscProgressBar
{
	idc = 1601;
	text = ""; //--- ToDo: Localize;
	x = 0.922813 * safezoneW + safezoneX;
	y = 0.6826 * safezoneH + safezoneY;
	w = 0.061875 * safezoneW;
	h = 0.011 * safezoneH;
};
class NAThudRSCsleepICO: RscPicture
{
	idc = 1202;
	text = "GUI\img\sleep.paa";
	x = 0.984687 * safezoneW + safezoneX;
	y = 0.698 * safezoneH + safezoneY;
	w = 0.0103125 * safezoneW;
	h = 0.022 * safezoneH;
};
class NATrscSleepbarBG: ProgressBaseTextHUD
{
	idc = 9402;
	x = 0.922813 * safezoneW + safezoneX;
	y = 0.7024 * safezoneH + safezoneY;
	w = 0.061875 * safezoneW;
	h = 0.011 * safezoneH;
	colorBackground[] = {0.5,0.5,0.5,0.5};
};
class NAThudrscSleepBar: RscProgressBar
{
	idc = 1603;
	text = ""; //--- ToDo: Localize;
	x = 0.922813 * safezoneW + safezoneX;
	y = 0.7024 * safezoneH + safezoneY;
	w = 0.061875 * safezoneW;
	h = 0.011 * safezoneH;
};
class NAThudRSCradICO: RscPicture
{
	idc = 1203;
	text = "GUI\img\radiation.paa";
	x = 0.984687 * safezoneW + safezoneX;
	y = 0.72 * safezoneH + safezoneY;
	w = 0.0103125 * safezoneW;
	h = 0.022 * safezoneH;
};
class NATrscradbarBG: ProgressBaseTextHUD
{
	idc = 9402;
	x = 0.922813 * safezoneW + safezoneX;
	y = 0.7244 * safezoneH + safezoneY;
	w = 0.061875 * safezoneW;
	h = 0.011 * safezoneH;
	colorBackground[] = {0.5,0.5,0.5,0.5};
};
class NAThudRSCradBAR: RscProgressBar
{
	idc = 1602;
	text = ""; //--- ToDo: Localize;
	x = 0.922813 * safezoneW + safezoneX;
	y = 0.7244 * safezoneH + safezoneY;
	w = 0.061875 * safezoneW;
	h = 0.011 * safezoneH;
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////
};
};

class NAT_Mute
{
	idd = 2890;
	fadeout=0;
	fadein=0;
	duration = 1e+1000;
	onload = "uiNamespace setVariable ['MUTEICON', (_this select 0) displayCtrl 1204];"
class controls
{
class NATHUDMUTE: RscPicture
{
	idc = 1204;
	text = "GUI\img\mute.paa";
	x = 0.974375 * safezoneW + safezoneX;
	y = 0.6078 * safezoneH + safezoneY;
	w = 0.020625 * safezoneW;
	h = 0.044 * safezoneH;
};
};
};

class NAT_Version
{
	idd = 2891;
	fadeout=0;
	fadein=0;
	duration = 1e+1000;
	onload = "uiNamespace setVariable ['VERSIONTEXT', (_this select 0) displayCtrl 1000];"
class controls
{
class NAThudVERSION: RscText
{
	idc = 1000;
	text = "NATIVES | VERSION: 0.0.1alpha | By Sinbane"; //--- ToDo: Localize;
	x = 0.0375 * safezoneW + safezoneX;
	y = 0.98 * safezoneH + safezoneY;
	w = 0.3125 * safezoneW;
	h = 0.02 * safezoneH;
};
};
};