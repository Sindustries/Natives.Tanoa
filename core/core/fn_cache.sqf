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
		} forEach NATcache;
		NATcache = NATcache - _toRemove;
		/* GET PLAYER POSITIONS */
		_playerPosArray = [];
		{
			if (isPlayer _x && alive _x) then {
				_playerPosArray pushBack (getPos _x);
			};
		} forEach playableUnits;
		/* TOGGLE CACHE */
		{
			for "_i" from 0 to ((count _playerPosArray)-1) do {
				/* UNITS */
				if ((typeOf _x) isKindOf ["Man", configFile >> "CfgVehicles"]) then {
					if (_x distance (_playerPosArray select _i) > _cacheDist && _x != (leader _x)) then {
						_x hideObjectGlobal true;
						_x enableSimulationGlobal false;
						_x disableAI "ALL";
						if (vehicle _x isEqualTo _x) then {
							_x attachTo [(leader _x)];
						};
						_menCached = _menCached + 1;
					};
					if (_x distance (_playerPosArray select _i) < _cacheDist && _x != (leader _x)) then {
						_x hideObjectGlobal false;
						_x enableSimulationGlobal true;
						_x enableAI "ALL";
						if (vehicle _x isEqualTo _x) then {
							detach _x;
						};
						if (_menCached > 0) then {
							_menCached = _menCached - 1;
						};
					};
				};
				/* VEHICLES */
				if ((typeOf _x) isKindOf ["Land", configFile >> "CfgVehicles"]) then {
					if (_x distance (_playerPosArray select _i) > _cacheDist && (count crew _x) isEqualTo 0) then {
						_x hideObjectGlobal true;
						_x enableSimulationGlobal false;
						_vehCached = _vehCached + 1;
					};
					if (_x distance (_playerPosArray select _i) < _cacheDist && (count crew _x) isEqualTo 0) then {
						_x hideObjectGlobal false;
						_x enableSimulationGlobal true;
						if (_vehCached > 0) then {
							_vehCached = _vehCached - 1;
						};
					};
				};
			};
		} forEach NATcache;
		if (DebugMode) then {
			systemChat format["DEBUG :: CACHE : REMOVING %1 NULL ENTRIES",(count _toRemove)];
			systemChat format["DEBUG :: CACHE : %1 UNITS CACHED",_menCached];
			systemChat format["DEBUG :: CACHE : %1 VEHICLES CACHED",_vehCached];
			systemChat format["DEBUG :: CACHE : %1 TOTAL ENTRIES",(count NATcache)];
			showChat true;
		};
	};

};
//-----------------------------------
/*

jim hideObjectGlobal true; jim enableSimulationGlobal false; jim attachTo [player];
jim hideObjectGlobal false; jim enableSimulationGlobal true; detach jim;

*/