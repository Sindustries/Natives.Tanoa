class SIN {
	tag = "SIN";
	class core {
		file = "core\sin";
		class adminInit {};
		class checkPos {};
		class checkDist {};
		class emptyUnit {};
		class emptyVeh {};
		class findPos {};
		class testCode {};
	};
}

class NAT_Core {
    tag = "NAT";
	class core {
		file = "core\core";
		class emptyVeh {};
		class fuelPump {};
		class fuelStation {};
		class getSetting {};
		class getSettings {};
		class message {};
		class updateProgressBar {};
		class weather {};
	};
	class fx {
		file = "core\fx";
		class gasMask {};
		class mineDetector {};
		class radLocation {};
		class radObject {};
	};
	class startup {
		file = "core\startup";
		class act1 {};
		class addActions {};
		class gravity {};
		class gravity_ray {};
		class gravity_ray_effect {};
		class keyHandler {};
		class locationDisplay {};
		class prologue {};
		class spawnBoats {};
		class spawnVeh {};
		class tpw_air {};
		class tpw_animals {};
		class tpw_core {};
		class radInit {};
		class radObjMonitor {};
		class radObjSpawner {};
	};
	class weather {
		file = "core\weather";
		class dustStorm {};
		class duststormFX {};
		class dustWall {};
		class hunt {};
		class monsoon {};
		class monsoonFX {};
		class tornado {};
		class tornadoFX {};
		class tornadoSFX {};
		class tunetTornado {};
	};
};

class Z {
	tag = "Z";
	class core {
		file = "core\zombie";
		class init {};
		class setSpawn {};
		class spawnZombies {};
		class zCamo {};
		class zDeleter {};
		class zMask {};
		class zMonitor {};
	};
};