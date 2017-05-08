class WLD_statusSML
{
	idd = 1367;
	fadeout=3;
	fadein=1;
	duration = 1e+1000;
	movingenable = false;
	onLoad = "uiNameSpace setVariable ['WLD_HUD_statusSML', (_this select 0) displayCtrl 1100];";

	class controls
	{
		class WLDstatusBG: IGUIBack
		{
			idc = 2200;
			x = 0.799062 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.185625 * safezoneW;
			h = 0.077 * safezoneH;
		};
		class WLDstatusFRM: RscFrame
		{
			idc = 1800;
			x = 0.799062 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.185625 * safezoneW;
			h = 0.077 * safezoneH;
		};
		class WLDstatusTXT: RscStructuredText
		{
			idc = 1100;
			type = 0;
			style = 2;
			x = 0.804219 * safezoneW + safezoneX;
			y = 0.236 * safezoneH + safezoneY;
			w = 0.175313 * safezoneW;
			h = 0.055 * safezoneH;
			font = "PuristaMedium";
			sizeEX = "0.016 / (getResolution select 5)";
			colorBackground[] = {0,0,0,0};
            colorText[] = {1,1,1,1};
			text = "";
		};
	};
};

class WLD_statusBIG
{
	idd = 1448;
	fadeout=3;
	fadein=1;
	duration = 1e+1000;
	movingenable = false;
	onLoad = "uiNameSpace setVariable ['WLD_HUD_statusBIG', (_this select 0) displayCtrl 1101];";

	class controls
	{
		class WLDstatusbugBG: IGUIBack
		{
			idc = 2201;
			x = 0.799062 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.185625 * safezoneW;
			h = 0.187 * safezoneH;
		};
		class WLDstatusbigFRM: RscFrame
		{
			idc = 1801;
			x = 0.799062 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.185625 * safezoneW;
			h = 0.187 * safezoneH;
		};
		class WLDstatusbigTXT: RscStructuredText
		{
			idc = 1101;
			type = 0;
			style = 2;
			x = 0.804219 * safezoneW + safezoneX;
			y = 0.324 * safezoneH + safezoneY;
			w = 0.175313 * safezoneW;
			h = 0.165 * safezoneH;
			font = "PuristaMedium";
			sizeEX = "0.016 / (getResolution select 5)";
			colorBackground[] = {0,0,0,0};
            colorText[] = {1,1,1,1};
			text = "";
		};
	};
};

