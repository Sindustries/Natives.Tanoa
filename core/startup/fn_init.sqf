/*
	fn_init
	Author: Sinbane
*/
//-----------------------------------
private ["_startPoint"];
_startPoint = (paramsArray select 1);
//-----------------------------------
("NATVERSIONLayer" call BIS_fnc_rscLayer) cutRsc ["NAT_Version","PLAIN",2,false];
uiNameSpace getVariable "VERSIONTEXT" ctrlSetText format["%1, version %2. By %3.",missionName,NAT_version,NAT_authors];
uiNameSpace getVariable "VERSIONTEXT" ctrlSetTextColor [1, 1, 1, 0.66];
cutText ["PRELOADING \n WAITING FOR SERVER, PLEASE WAIT", "BLACK FADED", 999];
//-----------------------------------
//-GET SETTINGS
if (isServer) then {
	["NAT"] call NAT_fnc_getSettings;
	DebugMode = ["NATdebugMode"] call NAT_fnc_getSetting;
	if (DebugMode isEqualTo 1) then {
		DebugMode = true;
		publicVariable "DebugMode";
	};
};
NATgasMasks = ["NATgasMasks"] call NAT_fnc_getSetting;
NATsealedVehicles = ["NATsealedVehicles"] call NAT_fnc_getSetting;
[] call NAT_fnc_vItemInit;
[] call NAT_fnc_gearInit;
//-----------------------------------
//-FIND LOCATIONS
private ["_startPos"];
if (isServer) then {
	NAT_mapLocations = [];
	NAT_mapLocationsCities = [];
	NAT_mapLocationsVillages = [];
	NAT_mapLocationsAirports = [];

	{
		NAT_mapLocations pushBackUnique [(locationPosition _x),(size _x)];
		NAT_mapLocationsCities pushBackUnique [(locationPosition _x),(size _x)];
	} forEach nearestLocations [NATErrorPos, ["NameCity","NameCityCapital"], 999999];
	{
		NAT_mapLocations pushBackUnique [(locationPosition _x),(size _x)];
		NAT_mapLocationsVillages pushBackUnique [(locationPosition _x),(size _x)];
	} forEach nearestLocations [NATErrorPos, ["NameVillage"], 999999];
	{
		NAT_mapLocations pushBackUnique [(locationPosition _x),(size _x)];
		NAT_mapLocationsAirports pushBackUnique [(locationPosition _x),(size _x)];
	} forEach nearestLocations [NATErrorPos, ["Airport"], 999999];
	publicVariable "NAT_mapLocations";
	publicVariable "NAT_mapLocationsCities";
	publicVariable "NAT_mapLocationsVillages";
	publicVariable "NAT_mapLocationsAirports";
	if (worldName isEqualTo "Tanoa") then {
		NATislandZones = [
			[[8092.05,10362.7,0.00175095],4000],
			[[11196.3,9635.81,0.00164795],4000],
			[[11212.6,3367.12,0.00170135],2500]
		];
		publicVariable "NATislandZones";
	};
};

//-----------------------------------
//-TPW init
if (isServer) then {
	[[]] spawn NAT_fnc_tpw_core;
	[10,25,1000,75,60] spawn NAT_fnc_tpw_animals;
};
//-----------------------------------
//-AI SKILL VALUES
NATmilitarySkills = [
["aimingAccuracy",0.45],
["aimingShake",0.45],
["aimingSpeed",0.25],
["spotDistance",0.25],
["spotTime",1],
["courage",1],
["reloadSpeed",1],
["commanding",1],
["general",0.45]
];
NATmilitiaSkills = [
["aimingAccuracy",0.2],
["aimingShake",0.2],
["aimingSpeed",0.1],
["spotDistance",0.25],
["spotTime",1],
["courage",1],
["reloadSpeed",1],
["commanding",1],
["general",0.33]
];
NATnativeSkills = [
["aimingAccuracy",0.4],
["aimingShake",0.4],
["aimingSpeed",0.33],
["spotDistance",1],
["spotTime",1],
["courage",1],
["reloadSpeed",1],
["commanding",1],
["general",0.33]
];
NATzombieSkills = [
["aimingAccuracy",0.66],
["aimingShake",0.66],
["aimingSpeed",0.5],
["spotDistance",0.8],
["spotTime",1],
["courage",1],
["reloadSpeed",1],
["commanding",1],
["general",0.66]
];

//-----------------------------------
//-SET TIME OF DAY						setDate [year, month, day, hour, minute]
if (isServer) then {
	_date = numberToDate [(2015+floor(random 20)),random 1];
	setDate [(_date select 0),(_date select 1),(_date select 2),4,0];
	sleep 3;
	if (["NATweatherOvercast"] call NAT_fnc_getSetting isEqualTo 1) then {
		0 setOvercast (random 1);
	} else {
		0 setOvercast 0;
	};
	if (["NATweatherFog"] call NAT_fnc_getSetting isEqualTo 1) then {
		0 setFog (overcast*0.1);
	} else {
		0 setFog 0;
	};
	forceWeatherChange;
	[] spawn NAT_fnc_weather;
	[] spawn {
		while {sunOrMoon isEqualTo 0} do {
			skiptime (1/20);
		};
		NAT_serverReady = true;
		publicVariable "NAT_serverReady";
	};
};
//-----------------------------------
if (isServer) then {
	[] call SIN_fnc_adminInit;
};
//-----------------------------------
waitUntil {NAT_serverReady isEqualTo true};
cutText ["", "BLACK FADED", 999];
//-----------------------------------
setViewDistance (["NATviewDistance"] call NAT_fnc_getSetting);
_viewDist = ["NATviewDistance"] call NAT_fnc_getSetting;
setObjectViewDistance [_viewDist,(_viewDist/10)];
NAT_safeZones = [];
NAT_clientMarkers = [];
//-----------------------------------
("HVPGasMaskLayer" call BIS_fnc_rscLayer) cutRsc ["equipment_prot","PLAIN",-1,false];
("HVPGasMaskLayer" call BIS_fnc_rscLayer) cutFadeOut 0;
[] spawn NAT_fnc_cache;
[] call NAT_fnc_needsInit;
//-----------------------------------
//-INIT LOOT, CARS, BOATS, ZOMBEES! & FURNITURE, RADOBJECTS
("NATHUDpBar" call BIS_fnc_rscLayer) cutRsc ["NATHUDpBar","PLAIN",-1,true];
uiNameSpace getVariable "PBarProgress" ctrlSetTextColor [0.2, 0.5, 0.9, 1];

cutText ["PRELOADING \n RAISING THE DEAD", "BLACK FADED", 999];
["Z"] call NAT_fnc_getSettings;
[] call z_fnc_init;
if (isServer) then {
	uiSleep 1;
	NATzombiesLoaded = true;
	publicVariable "NATZombiesLoaded";
} else {
	waitUntil {NATzombiesLoaded isEqualTo true};
};

cutText ["PRELOADING \n LOADING WARBOT", "BLACK FADED", 999];
[] call NAT_fnc_warbotInit;
waitUntil {NATwarbotLoaded isEqualTo true};

/*
cutText ["LOADING VEHICLES (LAND)", "BLACK FADED", 999];
if (isServer) then {
	uiSleep 1;
	[] call NAT_fnc_spawnVeh;
	NATCarsLoaded = true;
	publicVariable "NATCarsLoaded";
} else {
	waitUntil {NATCarsLoaded isEqualTo true};
};

cutText ["LOADING VEHICLES (SEA)", "BLACK FADED", 999];
if (isServer) then {
	uiSleep 1;
	[] call NAT_fnc_spawnBoats;
	NATBoatsLoaded = true;
	publicVariable "NATBoatsLoaded";
} else {
	waitUntil {NATBoatsLoaded isEqualTo true};
};
*/
cutText ["PRELOADING \n LOADING RADIATION", "BLACK FADED", 999];
if (isServer) then {
	uiSleep 1;
	[] call NAT_fnc_radInit;
	NATRadObjsLoaded = true;
	publicVariable "NATRadObjsLoaded";
} else {
	waitUntil {NATRadObjsLoaded isEqualTo true};
};

("NATHUDpBar" call BIS_fnc_rscLayer) cutText ["","PLAIN"];
cutText ["", "BLACK FADED", 999];
//-----------------------------------
//-PLAYER VARIABLES
player setUnitRank "LIEUTENANT";
player setVariable ["NATspawned",false,true];
player setVariable ["NAT_pumpingFuel",false];
//-----------------------------------
//-PLAYER STARTING GEAR
cutText ["PRELOADING \n RANDOMISING GEAR", "BLACK FADED", 999];
["zk_f_canteen",1,true] call NAT_fnc_vInvAdjust;
["sc_mre",2,true] call NAT_fnc_vInvAdjust;
[player,"military",true] call NAT_fnc_equip;
//-----------------------------------
[] call NAT_fnc_eventHandlers;
[] call NAT_fnc_fuelStation;
[] spawn NAT_fnc_dynObjMonitor;
[] spawn NAT_fnc_mineDetector;
[] call NAT_fnc_handleDamage;
[] spawn NAT_fnc_healthMonitor;
//-----------------------------------
//-PLAYER MAP MARKER
[] spawn {
	_aMarkername = format["%1%2",(getPos player),(random 10000)];
	_aMarker = createMarker [_aMarkername,(getPos player)];
	_aMarker setMarkerShape "ICON";
	_aMarker setMarkerType "mil_triangle";
	_aMarker setMarkerColor "ColorGreen";
	_aMarker setMarkerSize [0.75,0.75];
	while {alive player} do {
		_aMarker setMarkerPosLocal (getPos player);
		_aMarker setMarkerDirLocal (getDir player);
		if (vehicle player != player) then {
			_name = getText (configFile >> "CfgVehicles" >> (typeOf (vehicle player)) >> "displayName");
			_aMarker setMarkerText _name;
		} else {
			_aMarker setMarkerText name player;
		};
		sleep 0.1;
	};
};
//-----------------------------------
//-BEGIN PROLOGUE
cutText ["PRELOADING \n PREPARING GAME, PLEASE WAIT", "BLACK FADED", 999];
if (isServer) then {
	private ["_location"];
	setTimeMultiplier (["NATtimeMultiplier"] call NAT_fnc_getSetting);
	_location = (selectRandom NAT_mapLocations);
	_pos = [(_location select 0),0,(_location select 1 select 0),0,0,0] call SIN_fnc_findPos;
	if (_startPoint isEqualTo 0) then {
		[_pos] spawn NAT_fnc_prologue;
	};
	if (_startPoint > 1) then {
		_shorePos = [_pos,0,100,0,0,1,1] call SIN_fnc_findPos;
		_spawnPos = [_shorePos,30,60,0,2] call SIN_fnc_findPos;
		_veh = createVehicle ["I_C_Boat_Transport_02_F",_spawnPos,[],0,"NONE"];
		[
			_veh,
			["Black",1],
			true
		] call BIS_fnc_initVehicle;
		[_veh,true,true,true] call SIN_fnc_emptyVeh;
		[_veh] spawn NAT_fnc_pinMarkerVeh;
		[_veh,0.4+(random 0.3)] remoteExec ["setFuel",0];
		_veh setDir (random 360);
	};
	if (_startPoint isEqualTo 1) then {
		skipTime 0.2;
		//MOVE PLAYERS/AI INTO HOST GROUP
		{
			[_x] joinSilent (group player);
		} forEach playableUnits;
		_aiCount = (4-({isPlayer _x} count playableUnits));
		if (_aiCount > 0) then {
			for "_i" from 1 to _aiCount do {
				_unit = [_pos,west,"military",(group player)] call NAT_fnc_spawnUnit;
			};
		};
		//MOVE TO POS
		{
			if (isPlayer _x) then {
				_x setVariable ["NATspawned", true, true];
			};
			_x setPos _pos;
		} forEach (units group player);
		[] spawn NAT_fnc_act1;
	};
	if (_startPoint isEqualTo 2) then {
		skipTime 2;
		_campPos = [_pos] call NAT_fnc_findBasePos;
		[_campPos,"military","land",6] call NAT_fnc_createBase;
		//MOVE PLAYERS/AI INTO HOST GROUP
		{
			[_x] joinSilent (group player);
		} forEach playableUnits;
		_aiCount = (4-({isPlayer _x} count playableUnits));
		if (_aiCount > 0) then {
			for "_i" from 1 to _aiCount do {
				_unit = [_pos,west,"military",(group player)] call NAT_fnc_spawnUnit;
			};
		};
		//MOVE TO POS
		{
			if (isPlayer _x) then {
				_x setVariable ["NATspawned", true, true];
			};
			_x setPos _campPos;
		} forEach (units group player);
		[_campPos] spawn NAT_fnc_act2;
	};
};
waitUntil {(player getVariable "NATspawned") isEqualTo true};
//-----------------------------------
enableEnvironment true;
player enableSimulationGlobal true;
player enableStamina true;
player allowDamage true;
cutText ["", "BLACK IN", 10];
10 fadeSound 1;
[] spawn {
	waitUntil {!isNull (findDisplay 46)};
	private "_keyHandler";
	_keyHandler = (findDisplay 46) displayAddEventHandler ["KeyDown", {
		[_this select 0,_this select 1,_this select 2,_this select 3,_this select 4] call NAT_fnc_keyHandler;
	}];
};
//-----------------------------------
waitUntil {isTouchingGround player};
[] spawn NAT_fnc_locationDisplay;
[] spawn NAT_fnc_radObject;
[] spawn NAT_fnc_radLocation;
[] spawn {
//-----------------------------------
if (isServer) then {
	[missionNamespace,NAT_militaryWeapons,true,false] call BIS_fnc_addVirtualWeaponCargo;
	[missionNamespace,(NAT_militaryGrenades+NAT_militaryMagazines),true,false] call BIS_fnc_addVirtualMagazineCargo;
	[missionNamespace,(NAT_militaryUniforms+NAT_militaryVests+NAT_militaryHeadgear+NAT_militaryGoggles),true,false] call BIS_fnc_addVirtualItemCargo;
	[missionNamespace,["optic_ACO_grn","optic_Aco","optic_Arco_blk_F","optic_Arco_ghex_F","optic_ERCO_blk_F","optic_Holosight","optic_Holosight_blk_F","optic_Holosight_khk_F","optic_Holosight_smg","optic_Holosight_smg_blk_F","optic_MRCO","optic_Hamr","optic_Hamr_khk_F"],true,false] call BIS_fnc_addVirtualItemCargo;
	[missionNamespace,NAT_militaryBackpacks,true,false] call BIS_fnc_addVirtualBackpackCargo;
};
//-----------------------------------
sleep 30;
["NATnotification",["HINT","PRESS SHIFT+WINDOWS KEY TO OPEN YOUR STATUS MENU","i"]] call bis_fnc_showNotification;
};