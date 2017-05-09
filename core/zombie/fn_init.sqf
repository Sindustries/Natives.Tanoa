/*
	HVP Zombie Spawner
	Author: Sinbane
	Grabs zombies from Ryans Zombie & Demon's mod and spawns them when called
*/
private ["_cfg","_i","_cfgName","_counter","_temp","_exclusions"];
//-----------------------------------
//-DON'T EDIT
["Z"] call NAT_fnc_getSettings;
NAT_maxZombies = ["NAT_maxZombies"] call NAT_fnc_getSetting;
NAT_zhordeSize = ["NAT_zhordeSize"] call NAT_fnc_getSetting;;
NAT_zSpawnChance = ["NAT_zSpawnChance"] call NAT_fnc_getSetting;
NAT_zBossChance = ["NAT_zBossChance"] call NAT_fnc_getSetting;

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

	NAT_BossZombies = ["RyanZombieboss1","RyanZombieboss2","RyanZombieboss3","RyanZombieboss4","RyanZombieboss5","RyanZombieboss6","RyanZombieboss7","RyanZombieboss8","RyanZombieboss9","RyanZombieboss10","RyanZombieboss11","RyanZombieboss12","RyanZombieboss13","RyanZombieboss14","RyanZombieboss15","RyanZombieboss16","RyanZombieboss17","RyanZombieboss18","RyanZombieboss19","RyanZombieboss20","RyanZombieboss21","RyanZombieboss22","RyanZombieboss23","RyanZombieboss24","RyanZombieboss25","RyanZombieboss26","RyanZombieboss27","RyanZombieboss28","RyanZombieboss29","RyanZombieboss30","RyanZombieboss31","RyanZombieboss32"];

	_cfg = (configFile >> "CfgVehicles");
	for "_i" from 0 to ((count _cfg)-1) do {
		if (isClass (_cfg select _i)) then {
			_cfgName = configName (_cfg select _i);
			if (_cfgName isKindOf "Man" && (getNumber ((_cfg select _i) >> "scope") == 2) && (getText ((_cfg select _i) >> "faction") isEqualTo "Ryanzombiesfaction") && (!(_cfgName in _exclusions)) &&
			(!(_cfgName in NAT_BossZombies))) then {
				NAT_zombies pushBackUnique _cfgName;
			};
		};
	};

	publicVariable "NAT_BossZombies";
	publicVariable "NAT_zombies";
/*
	//-SPAWN EACH ZOMBIE ONCE AND DELETE (TO CACHE)
	_counter = (count NAT_zombies);
	{
		_temp = createVehicle [_x,[0,0,0], [], 0, "NONE"];
		deleteVehicle _temp;
		_counter = _counter - 1;
		[_counter,(count NAT_zombies)] remoteExec ["NAT_fnc_updateProgressBar", 0];
	} forEach (NAT_zombies+NAT_BossZombies);
}; */
//-----------------------------------
//-LAUNCH FUNCS

[] spawn z_fnc_zMonitor;
[] spawn z_fnc_zMask;
if (isServer) then {
	[] spawn z_fnc_zDeleter;
};

//-----------------------------------
//-ZOMBIE CAMO ACTION
/*
zCamo_action = [player addAction["Zombie Camouflage",z_fnc_zCamo,"",0,false,true,"",'
!isNull cursorObject && player distance cursorObject < 3.5 && (typeOf cursorObject) in ((NAT_zombies)+(NAT_BossZombies)) && !alive cursorObject && vehicle player isEqualTo player']];
// && (player getVariable ["z_CamoApplied",false]) isEqualTo false */
//-----------------------------------