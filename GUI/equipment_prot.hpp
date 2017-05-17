class equipment_prot {
	idd = -1;
	movingEnable = 0;
	duration = 1e+1000;
	fadein = 0;
	fadeout = 0;
	name = "equipment_prot";
	controls[] = {"Picture"};
	class Picture: RscPicture
	{
		x=safeZoneX; y=safeZoneY; w=safeZoneW; h=safeZoneH;
		idc = 1200;
		text = "GUI\Img\al_helmet.paa";
		colorText[] = {1,1,1,0.25};
	};
};