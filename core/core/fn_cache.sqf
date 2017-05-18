/*
	fn_cacheInit
	Author: Sinbane
	Prepares the caching system
	MODE,
*/
private [];
if (!isServer) exitWith {};

_checkTime = 30;
_cacheDist = 1000;

NATcache = [];

//-----------------------------------
while {true} do {

	sleep _checkTime;

	_menCached = 0;
	_vehCached = 0;

	if (count NATcache > 0) then {
		/* REMOVE NULL ENTRIES */
		_toRemove = [];
		{
			if (isNull _x) then {
				_toRemove pushBack _x;
			};
			sleep 0.01;
		} forEach NATcache;
		NATcache = NATcache - _toRemove;
		/* GET PLAYER POSITIONS & GROUPS */
		_playerPosArray = [];
		_playerGroups = [];
		{
			if (isPlayer _x && alive _x) then {
				_playerPosArray pushBack (getPos _x);
				_playerGroups pushBack (group _x);
			};
			sleep 0.01;
		} forEach playableUnits;
		/* TOGGLE CACHE */
		{
			for "_i" from 0 to ((count _playerPosArray)-1) do {
				/* UNITS */
				if ((typeOf _x) isKindOf ["Man", configFile >> "CfgVehicles"]) then {
					if (_x distance (_playerPosArray select _i) > _cacheDist && _x != (leader _x) && !((group _x) in _playerGroups)) then {
						if (alive _x) then {
							_x hideObjectGlobal true;
							_x enableSimulationGlobal false;
							_x disableAI "ALL";
							if (vehicle _x isEqualTo _x) then {
								_x attachTo [(leader _x)];
							};
							_x setVariable ["NATcache",true];
							_menCached = _menCached + 1;
						} else {
							deleteVehicle _x;
						};
					};
					if (_x distance (_playerPosArray select _i) <= _cacheDist && _x != (leader _x) && !((group _x) in _playerGroups)) then {
						_x hideObjectGlobal false;
						_x enableSimulationGlobal true;
						_x enableAI "ALL";
						if (vehicle _x isEqualTo _x) then {
							detach _x;
						};
						_x setVariable ["NATcache",false];
						if (_menCached > 0) then {
							_menCached = _menCached - 1;
						};
					};
					if (_x distance player < 100 && (_x getVariable "NATcache") isEqualTo false && (_x getVariable "NATgasMask") isEqualTo false) then {
						[_x] spawn NAT_fnc_gasMask;
					};
				};
				/* VEHICLES */
				if ((typeOf _x) isKindOf ["Land", configFile >> "CfgVehicles"]) then {
					if (_x distance (_playerPosArray select _i) > _cacheDist && (count crew _x) isEqualTo 0) then {
						if (alive _x) then {
							_x hideObjectGlobal true;
							_x enableSimulationGlobal false;
							_x setVariable ["NATcache",true];
							_vehCached = _vehCached + 1;
						} else {
							deleteVehicle _x;
						};
					};
					if (_x distance (_playerPosArray select _i) <= _cacheDist && (count crew _x) isEqualTo 0) then {
						_x hideObjectGlobal false;
						_x enableSimulationGlobal true;
						_x setVariable ["NATcache",false];
						if (_vehCached > 0) then {
							_vehCached = _vehCached - 1;
						};
					};
				};
				/* WRECKS */
				if ((typeOf _x) isKindOf ["Building", configFile >> "CfgVehicles"]) then {
					if (_x distance (_playerPosArray select _i) > _cacheDist && (count crew _x) isEqualTo 0) then {
						_x hideObjectGlobal true;
						_x enableSimulationGlobal false;
						_x setVariable ["NATcache",true];
						_vehCached = _vehCached + 1;
					};
					if (_x distance (_playerPosArray select _i) <= _cacheDist && (count crew _x) isEqualTo 0) then {
						_x hideObjectGlobal false;
						_x enableSimulationGlobal true;
						_x setVariable ["NATcache",false];
						if (_vehCached > 0) then {
							_vehCached = _vehCached - 1;
						};
					};
				};
			};
			sleep 0.01;
		} forEach NATcache;
		if (DebugMode) then {
			hintSilent parseText format["
				<t align='center'>NATIVES CACHE DEBUG<br />
				%1 TOTAL ENTRIES<br />
				%2 UNITS CACHED<br />
				%3 VEHICLES CACHED<br />
				%4 NULL ENTRIES REMOVED</t>",
				(count NATcache),_menCached,_vehCached,(count _toRemove)
			];
		};
	};

};
//-----------------------------------