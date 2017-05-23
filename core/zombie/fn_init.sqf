/*
	HVP Zombie Spawner
	Author: Sinbane
	Grabs zombies from Ryans Zombie & Demon's mod and spawns them when called
*/
private ["_cfg","_i","_cfgName","_counter","_temp","_exclusions"];
//-----------------------------------
//-DON'T EDIT
["Z"] call NAT_fnc_getSettings;
NAT_zSpawnChance = ["NAT_zSpawnChance"] call NAT_fnc_getSetting;
NAT_zSpawnDist = ["NAT_zSpawnDistance"] call NAT_fnc_getSetting;

NAT_zSpawnerArray = [];
NAT_usedSpawnerArray = [];
NAT_zombies = [];
NAT_zombieArray = [];
NAT_zombieArrayClient = [];

player setVariable ["z_CamoApplied",false];

//-----------------------------------
//-GET ZOMBIES
if (isServer) then {

	_exclusions = ["RyanZombiePlayer1","RyanZombiePlayer2","RyanZombiePlayer3","RyanZombiePlayer4","RyanZombiePlayer5","RyanZombiePlayer6","RyanZombiePlayer7","RyanZombiePlayer8","RyanZombiePlayer9","RyanZombiePlayer10","RyanZombiePlayer11","RyanZombiePlayer12","RyanZombiePlayer13","RyanZombiePlayer14","RyanZombiePlayer15","RyanZombiePlayer16","RyanZombiePlayer17","RyanZombiePlayer18","RyanZombiePlayer19","RyanZombiePlayer20","RyanZombiePlayer21","RyanZombiePlayer22","RyanZombiePlayer23","RyanZombiePlayer24","RyanZombiePlayer25","RyanZombiePlayer26","RyanZombiePlayer27","RyanZombiePlayer28","RyanZombiePlayer29","RyanZombiePlayer30","RyanZombiePlayer31","RyanZombiePlayer32"];

	NAT_slowZombies = ["RyanZombieC_man_1slow","RyanZombieC_man_polo_1_Fslow","RyanZombieC_man_polo_2_Fslow","RyanZombieC_man_polo_4_Fslow","RyanZombieC_man_polo_5_Fslow","RyanZombieC_man_polo_6_Fslow","RyanZombieC_man_p_fugitive_Fslow","RyanZombieC_man_w_worker_Fslow","RyanZombieC_scientist_Fslow","RyanZombieC_man_hunter_1_Fslow","RyanZombieC_man_pilot_Fslow","RyanZombieC_journalist_Fslow","RyanZombieC_Orestesslow","RyanZombieC_Nikosslow","RyanZombie15slow","RyanZombie16slow","RyanZombie17slow","RyanZombie18slow","RyanZombie19slow","RyanZombie20slow","RyanZombie21slow","RyanZombie22slow","RyanZombie23slow","RyanZombie24slow","RyanZombie25slow","RyanZombie26slow","RyanZombie27slow","RyanZombie28slow","RyanZombie29slow","RyanZombie30slow","RyanZombie31slow","RyanZombie32slow","RyanZombieB_Soldier_02_fslow","RyanZombieB_Soldier_02_f_1slow","RyanZombieB_Soldier_02_f_1_1slow","RyanZombieB_Soldier_03_fslow","RyanZombieB_Soldier_03_f_1slow","RyanZombieB_Soldier_03_f_1_1slow","RyanZombieB_Soldier_04_fslow","RyanZombieB_Soldier_04_f_1slow","RyanZombieB_Soldier_04_f_1_1slow","RyanZombieB_Soldier_05_fslow","RyanZombieB_Soldier_lite_Fslow","RyanZombieB_Soldier_lite_F_1slow","RyanZombieB_RangeMaster_Fslow","RyanZombieC_man_1walker","RyanZombieC_man_polo_1_Fwalker","RyanZombieC_man_polo_2_Fwalker","RyanZombieC_man_polo_4_Fwalker","RyanZombieC_man_polo_5_Fwalker","RyanZombieC_man_polo_6_Fwalker","RyanZombieC_man_p_fugitive_Fwalker","RyanZombieC_man_w_worker_Fwalker","RyanZombieC_scientist_Fwalker","RyanZombieC_man_hunter_1_Fwalker","RyanZombieC_man_pilot_Fwalker","RyanZombieC_journalist_Fwalker","RyanZombieC_Oresteswalker","RyanZombieC_Nikoswalker","RyanZombie15walker","RyanZombie16walker","RyanZombie17walker","RyanZombie18walker","RyanZombie19walker","RyanZombie20walker","RyanZombie21walker","RyanZombie22walker","RyanZombie23walker","RyanZombie24walker","RyanZombie25walker","RyanZombie26walker","RyanZombie27walker","RyanZombie28walker","RyanZombie29walker","RyanZombie30walker","RyanZombie31walker","RyanZombie32walker","RyanZombieB_Soldier_02_fwalker","RyanZombieB_Soldier_02_f_1walker","RyanZombieB_Soldier_02_f_1_1walker","RyanZombieB_Soldier_03_fwalker","RyanZombieB_Soldier_03_f_1walker","RyanZombieB_Soldier_03_f_1_1walker","RyanZombieB_Soldier_04_fwalker","RyanZombieB_Soldier_04_f_1walker","RyanZombieB_Soldier_04_f_1_1walker","RyanZombieB_Soldier_05_fwalker","RyanZombieB_Soldier_lite_Fwalker","RyanZombieB_Soldier_lite_F_1walker","RyanZombieB_RangeMaster_Fwalker"];

	NAT_mediumZombies = [
	"RyanZombieC_man_1medium",	"RyanZombieC_man_hunter_1_Fmedium",	"RyanZombieC_man_pilot_Fmedium","RyanZombieC_journalist_Fmedium","RyanZombieC_Orestesmedium","RyanZombieC_Nikosmedium","RyanZombie15medium","RyanZombie16medium","RyanZombie17medium","RyanZombie18medium","RyanZombie19medium","RyanZombieC_man_polo_1_Fmedium","RyanZombie20medium","RyanZombie21medium","RyanZombie22medium","RyanZombie23medium","RyanZombie24medium","RyanZombie25medium","RyanZombie26medium","RyanZombie27medium","RyanZombie28medium","RyanZombie29medium","RyanZombieC_man_polo_2_Fmedium","RyanZombie30medium","RyanZombie31medium","RyanZombie32medium","RyanZombieC_man_polo_4_Fmedium","RyanZombieC_man_polo_5_Fmedium","RyanZombieC_man_polo_6_Fmedium","RyanZombieC_man_p_fugitive_Fmedium","RyanZombieC_man_w_worker_Fmedium","RyanZombieC_scientist_Fmedium","RyanZombieB_Soldier_05_fmedium","RyanZombieB_RangeMaster_Fmedium","RyanZombieB_Soldier_02_fmedium","RyanZombieB_Soldier_lite_Fmedium","RyanZombieB_Soldier_lite_F_1medium","RyanZombieB_Soldier_02_f_1medium","RyanZombieB_Soldier_02_f_1_1medium","RyanZombieB_Soldier_03_fmedium","RyanZombieB_Soldier_03_f_1medium","RyanZombieB_Soldier_03_f_1_1medium","RyanZombieB_Soldier_04_fmedium","RyanZombieB_Soldier_04_f_1medium","RyanZombieB_Soldier_04_f_1_1medium"];

	NAT_crawlerZombies = ["RyanZombieSpider1","RyanZombieSpider2","RyanZombieSpider3","RyanZombieSpider4","RyanZombieSpider5","RyanZombieSpider6","RyanZombieSpider7","RyanZombieSpider8","RyanZombieSpider9","RyanZombieSpider10","RyanZombieSpider11","RyanZombieSpider12","RyanZombieSpider13","RyanZombieSpider14","RyanZombieSpider15","RyanZombieSpider16","RyanZombieSpider17","RyanZombieSpider18","RyanZombieSpider19","RyanZombieSpider20","RyanZombieSpider21","RyanZombieSpider22","RyanZombieSpider23","RyanZombieSpider24","RyanZombieSpider25","RyanZombieSpider26","RyanZombieSpider27","RyanZombieSpider28","RyanZombieSpider29","RyanZombieSpider30","RyanZombieSpider31","RyanZombieSpider32","RyanZombieCrawler1","RyanZombieCrawler2","RyanZombieCrawler3","RyanZombieCrawler4","RyanZombieCrawler5","RyanZombieCrawler6","RyanZombieCrawler7","RyanZombieCrawler8","RyanZombieCrawler9","RyanZombieCrawler10","RyanZombieCrawler11","RyanZombieCrawler12","RyanZombieCrawler13","RyanZombieCrawler14","RyanZombieCrawler15","RyanZombieCrawler16","RyanZombieCrawler17","RyanZombieCrawler18","RyanZombieCrawler19","RyanZombieCrawler20","RyanZombieCrawler21","RyanZombieCrawler22","RyanZombieCrawler23","RyanZombieCrawler24","RyanZombieCrawler25","RyanZombieCrawler26","RyanZombieCrawler27","RyanZombieCrawler28","RyanZombieCrawler29","RyanZombieCrawler30","RyanZombieCrawler31","RyanZombieCrawler32"];

	NAT_BossZombies = ["RyanZombieboss1","RyanZombieboss2","RyanZombieboss3","RyanZombieboss4","RyanZombieboss5","RyanZombieboss6","RyanZombieboss7","RyanZombieboss8","RyanZombieboss9","RyanZombieboss10","RyanZombieboss11","RyanZombieboss12","RyanZombieboss13","RyanZombieboss14","RyanZombieboss15","RyanZombieboss16","RyanZombieboss17","RyanZombieboss18","RyanZombieboss19","RyanZombieboss20","RyanZombieboss21","RyanZombieboss22","RyanZombieboss23","RyanZombieboss24","RyanZombieboss25","RyanZombieboss26","RyanZombieboss27","RyanZombieboss28","RyanZombieboss29","RyanZombieboss30","RyanZombieboss31","RyanZombieboss32"];

	publicVariable "NAT_BossZombies";
	NAT_zombies = (NAT_slowZombies+NAT_mediumZombies);
	publicVariable "NAT_zombies";

	//-SPAWN EACH ZOMBIE ONCE AND DELETE (TO CACHE)
	_counter = (count NAT_zombies);
	{
		_temp = createVehicle [_x,[0,0,0], [], 0, "NONE"];
		sleep 0.001;
		deleteVehicle _temp;
		_counter = _counter - 1;
		[_counter,(count NAT_zombies)] remoteExec ["NAT_fnc_updateProgressBar", 0];
	} forEach (NAT_zombies+NAT_BossZombies);
};
//-----------------------------------
//-LAUNCH FUNCS

[] spawn z_fnc_zMask;
if (isServer) then {
	[] spawn z_fnc_zMonitor;
};

//-----------------------------------
//-ZOMBIE CAMO ACTION
/*
zCamo_action = [player addAction["Zombie Camouflage",z_fnc_zCamo,"",0,false,true,"",'
!isNull cursorObject && player distance cursorObject < 3.5 && (typeOf cursorObject) in ((NAT_zombies)+(NAT_BossZombies)) && !alive cursorObject && vehicle player isEqualTo player']];
// && (player getVariable ["z_CamoApplied",false]) isEqualTo false */
//-----------------------------------