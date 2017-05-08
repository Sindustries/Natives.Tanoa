class NATHUDpBar
{
	name = "NATHUDpBar";
	idd = 37200;
	fadein=1;
	duration = 1e+1000;
	fadeout=3;
	movingEnable = 0;
	onLoad = "uiNamespace setVariable ['PBarProgress', (_this select 0) displayCtrl 103];";

	class controls
	{
		class background: ProgressBaseTextHUD
		{
			idc = 37201;

			x = 0.43297 * safezoneW + safezoneX;
			y = 0.0479 * safezoneH + safezoneY;
			w = 0.134062 * safezoneW;
			h = 0.0055 * safezoneH;
			colorBackground[] = {1,0,0,0.4};
		};
		class Progress: RscProgressBar
		{
			idc = 103;
			text = ""; //--- ToDo: Localize;
			x = 0.43297 * safezoneW + safezoneX;
			y = 0.0479 * safezoneH + safezoneY;
			w = 0.134062 * safezoneW;
			h = 0.0055 * safezoneH;
		};
	};
};

class NATHUDcamoTimer
{
	idd = 60;
	fadeout=1;
	fadein=3;
	duration = 1e+1000;
	onLoad = "uiNameSpace setVariable ['NATHUDcamoTimer', (_this select 0) displayCtrl 3537];";

	class controls
	{
		class HVPHUDcamoBG: IGUIBack
		{
			idc = 3273;
			x = 0.288594 * safezoneW + safezoneX;
			y = -0.00599999 * safezoneH + safezoneY;
			w = 0.0360937 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class HVPHUDcamoFRM: RscFrame
		{
			idc = 3274;
			x = 0.288594 * safezoneW + safezoneX;
			y = -0.00599999 * safezoneH + safezoneY;
			w = 0.0360937 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class HVPHUDcamoTXT: RscText
		{
			idc = 3676;
			type = 0;
			style = 2;
			text = "Z-CAMO"; //--- ToDo: Localize;
			x = 0.292719 * safezoneW + safezoneX;
			y = 0.00279997 * safezoneH + safezoneY;
			w = 0.0257812 * safezoneW;
			h = 0.011 * safezoneH;
			font = "PuristaMedium";
			sizeEX = "0.016 / (getResolution select 5)";
			colorBackground[] = {0,0,0,0};
            colorText[] = {1,1,1,1};
		};
		class HVPHUDcamoTXT2: RscText
		{
			idc = 3537;
			type = 0;
			style = 2;
			text = "12:34"; //--- ToDo: Localize;
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.0204 * safezoneH + safezoneY;
			w = 0.0257812 * safezoneW;
			h = 0.011 * safezoneH;
			font = "PuristaMedium";
			sizeEX = "0.016 / (getResolution select 5)";
			colorBackground[] = {0,0,0,0};
            colorText[] = {1,1,1,1};
		};

	};
};