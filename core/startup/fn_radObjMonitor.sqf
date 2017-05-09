/*
	HVP Radioactive Object Spawn Script
	By Sinbane
	Spawns a variety of radioactive objects and areas around the map
*/
_radObjCars = _this select 0;
//-----------------------------------

	while {true} do {
		sleep 5;

		{
			if (player distance (_x select 0) < ((_x select 1)*4) && (_x select 2) isEqualTo false) then {
				if (DebugMode) then {systemChat format["DEBUG MODE :: APPENDING %1",(NATRadioActiveLocations select _forEachIndex)]};
				NATRadioActiveLocations set [_forEachIndex,[(_x select 0),(_x select 1),true]];
				if (DebugMode) then {systemChat format["DEBUG MODE :: TO %1",(NATRadioActiveLocations select _forEachIndex)]};
				[_radObjCars,(_x select 0),(_x select 1)] call NAT_fnc_radObjSpawner;
			};
		} forEach NATRadioActiveLocations;

	};

//----------------------------------- Pos = [(_x select 0),0,((_x select 1) select 0),0.2] call SIN_fnc_findPos;