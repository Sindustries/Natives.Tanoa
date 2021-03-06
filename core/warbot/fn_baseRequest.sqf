/*
	fn_baseRequest
	Author: Sinbane
	Builds/recruits selected unit/vehicle
*/
private [];
params [
	["_type",0]
];
if (_type isEqualTo 0) exitWith {};

_display = findDisplay 4040;
//-----------------------------------
/* RECRUIT UNIT */
if (_type isEqualTo 1) then {
	_selected = lbCurSel 1500;
	_unitArray = (NATbaseUnitRequest select _selected);
	_unitName = (_unitArray select 0);
	_unitEquip = (_unitArray select 1);
	_unitFood = (_unitArray select 2);
	_unitWater = (_unitArray select 3);

	if (!DebugMode) then {
		if (_unitFood > NATresFood || _unitWater > NATresWater) exitWith {
			systemChat "NOT ENOUGH RESOURCES TO RECRUIT";
			showChat true;
		};
		NATresFood = NATresFood - _unitFood;
		NATresWater = NATresWater - _unitWater;
		publicVariable "NATresFood";
		publicVariable "NATresWater";
	};

	_spawnPos = [(getPos player),2,100] call SIN_fnc_findPos;
	_time = floor(random _unitFood)+floor(random _unitWater);
	systemChat format["RECRUITING: %1 | ETA: %2 seconds",_unitName,[_time,0] call BIS_fnc_cutDecimals]; showChat true;

	[_unitEquip,_time,_spawnPos] spawn {
		private ["_weapon","_sidearm"];
		_unitEquip = _this select 0;
		_time = _this select 1;
		_spawnPos = _this select 2;

		sleep _time;

		_unit = (group player) createUnit ["B_Survivor_F", _spawnPos, [], 0, "NONE"];
		_unit allowFleeing 0;
		[_unit] call NAT_fnc_unequip;

		/* EQUIP THE BLIGHTER */
		_pWeps = _unitEquip select 0;
		_pWepAccs = _unitEquip select 1;
		_sWeps = _unitEquip select 2;
		_sWepAccs = _unitEquip select 3;
		_grenades = _unitEquip select 4;
		_uniforms = _unitEquip select 5;
		_vests = _unitEquip select 6;
		_backpacks = _unitEquip select 7;
		_headgear = _unitEquip select 8;
		_goggles = _unitEquip select 9;
		_linked = _unitEquip select 10;

		if (count _uniforms > 0) then {
			_unit forceAddUniform (selectRandom _uniforms);
		};
		if (count _vests > 0) then {
			_unit addVest (selectRandom _vests);
		};
		if (count _backpacks > 0) then {
			_unit addBackpack (selectRandom _backpacks);
		};
		if (count _headgear > 0) then {
			_unit addHeadgear (selectRandom _headgear);
		};
		if (count _goggles > 0) then {
			_unit addGoggles (selectRandom _goggles);
		};
		if (count _linked > 0) then {
			{_unit linkItem _x} forEach _linked;
		};
		if (count _grenades > 0) then {
			{_unit addMagazines [(_x select 0),(_x select 1)]} forEach _grenades;
		};
		if (count _pWeps > 0) then {
			_weapon = (selectRandom _pWeps);
			_mags = (getArray (configFile >> "CfgWeapons" >> _weapon >> "magazines"));
			_unit addMagazines [(selectRandom _mags),9];
			_unit addWeapon _weapon;
			if (count _pWepAccs > 0) then {
				{_unit addPrimaryWeaponItem _x} forEach _pWepAccs;
			};
		};
		if (count _sWeps > 0) then {
			_weapon = (selectRandom _sWeps);
			_mags = (getArray (configFile >> "CfgWeapons" >> _weapon >> "magazines"));
			_unit addMagazines [(selectRandom _mags),4];
			_unit addWeapon _weapon;
			if (count _sWepAccs > 0) then {
				{_unit addHandgunItem _x} forEach _pWepAccs;
			};
		};
		_unit addItem "sc_dogtag";
		_unit addItem "FirstAidKit";
		_unit addItem "FirstAidKit";
		_unit addItem "FirstAidKit";
		_unit linkItem "itemMap";
		_unit linkItem "itemRadio";
		_unit linkItem "itemWatch";
		_unit addWeapon "binocular";
		{_unit setSkill [(_x select 0),(_x select 1)]} forEach NATmilitarySkills;
		[_unit,"tacs_Insignia_ZombieOutbreakResponseTeam"] call bis_fnc_setUnitInsignia;
	};
};
//-----------------------------------
/* BUILD VEHICLE */
if (_type isEqualTo 2) then {
	_vehType = lbData [1501, lbCurSel 1501];
	if (_vehType isEqualTo "land") then {
		_selected = lbCurSel 1501;
		_vehArray = NATbaseVehicleRequest select _selected;
		_name = _vehArray select 0;
		_classes = _vehArray select 1;
		_cost = _vehArray select 2;

		if (!DebugMode) then {
			if (_cost > NATresScrap) exitWith {
				systemChat "NOT ENOUGH RESOURCES TO BUILD";
				showChat true;
			};
			NATresScrap = NATresScrap - _cost;
			publicVariable "NATresScrap";
		};

		private "_spawnPos";
		_spawnPos = (getPos nearestObject [(getPos player),"Land_JumpTarget_F"]);
		if (_spawnPos distance player > 100) then {
			_spawnPos = [(getPos player),0,100,4,0,1,1] call SIN_fnc_findPos;
		};
		_time = (_cost/3);
		systemChat format["BUILDING: %1 | ETA: %2 seconds",_name,[_time,0] call BIS_fnc_cutDecimals]; showChat true;

		[_classes,_time,_spawnPos] spawn {
			private ["_time","_hitPoints"];
			_classes = _this select 0;
			_time = _this select 1;
			_spawnPos = _this select 2;

			_veh = (selectRandom _classes) createVehicle _spawnPos;
			[_veh,true,false,true] call SIN_fnc_emptyVeh;
			_veh setFuel (0.25+(random 0.5));
			_veh lock true;
			[_veh] spawn NAT_fnc_pinMarkerVeh;

			_hull = ["karoserie","hull_hit"];
			_glass = ["glass1","glass2","glass3","glass4"];
			_wheels = ["wheel_1_1_steering","wheel_1_4_steering","wheel_1_3_steering","wheel_1_2_steering","wheel_2_1_steering","wheel_2_4_steering","wheel_2_3_steering","wheel_2_2_steering","track_l_hit","track_r_hit"];

			{_veh setHit [_x,0.9]} forEach _hull;
			{_veh setHit [_x,1]} forEach (_glass+_wheels);

			_hullTime = (_time/3);
			_glassTime = (_time/3);
			_wheelTime = (_time/3);

			while {_hullTime > 0} do {
				private "_hit";
				_hit = (1-(1/_hullTime));
				if (_hit < 0.9) then {
					{_veh setHit [_x,_hit]} forEach _hull;
				};
				sleep 1;
				_hullTime = _hullTime - 1;
			};
			while {_glassTime > 0} do {
				private "_hit";
				_hit = (1-(1/_glassTime));
				{_veh setHit [_x,_hit]} forEach _glass;
				sleep 1;
				_glassTime = _glassTime - 1;
			};
			while {_wheelTime > 0} do {
				private "_hit";
				_hit = (1-(1/_wheelTime));
				{_veh setHit [_x,_hit]} forEach _wheels;
				sleep 1;
				_wheelTime = _wheelTime - 1;
			};

			_veh lock false;	//name = "engine_hit";
			_veh setDamage 0;
			NATcache pushBack _veh;
		};
	};
//-----------------------------------
/* BUILD BOAT */
	if (_vehType isEqualTo "sea") then {
		_selected = lbCurSel 1501;
		_vehArray = NATbaseBoatRequest select (_selected-(count NATbaseVehicleRequest));
		_name = _vehArray select 0;
		_classes = _vehArray select 1;
		_cost = _vehArray select 2;

		if (!DebugMode) then {
			if (_cost > NATresScrap) exitWith {
				systemChat "NOT ENOUGH RESOURCES TO BUILD";
				showChat true;
			};
			NATresScrap = NATresScrap - _cost;
			publicVariable "NATresScrap";
		};

		_spawnPos = [(getPos player),0,25,10,2] call SIN_fnc_findPos;
		_veh = (selectRandom _classes) createVehicle _spawnPos;
		_veh allowDamage false;
		[_veh,true,false,true] call SIN_fnc_emptyVeh;
		_veh hideObjectGlobal true;
		while {getPosATL _veh select 2 < 1} do {
			_pos = [(getPos _veh),0,25,10,2] call SIN_fnc_findPos;
			_veh setPos _pos;
		};

		[_veh] spawn NAT_fnc_pinMarkerVeh;

		_veh hideObjectGlobal false;
		_veh setFuel (0.25+(random 0.5));
		_veh setDamage 0;
		_veh allowDamage true;
		NATcache pushBack _veh;
	};
};
//-----------------------------------
[(cursorObject getVariable "NATbaseType")] call NAT_fnc_baseMenu;