class SIN {
	tag = "SIN";
	class core {
		file = "core\sin";
		class adminInit {};
		class checkPos {};
		class checkDist {};
		class emptyVeh {};
		class findPos {};
		class testCode {};
	};
}

class NAT_Core {
    tag = "NAT";
	class core {
		file = "core\core";
		class createGroup {};
		class emptyVeh {};
		class fuelPump {};
		class fuelStation {};
		class getSetting {};
		class getSettings {};
		class handleDamage {};
		class healthMonitor {};
		class healthRegen {};
		class message {};
		class saveGame {};
		class updateProgressBar {};
		class weather {};
	};
	class fx {
		file = "core\fx";
		class gasMask {};
		class mineDetector {};
		class radFXdust {};
		class radLocation {};
		class radObject {};
	};
	class gear {
		file = "core\gear";
		class equip {};
		class unequip {};
	};
	class inventory {
		file = "core\inventory";
		class vInv {};
		class vInvAdjust {};
		class vInvCheck {};
		class vInvDrop {};
		class vInvUpdate {};
		class vInvUse {};
	};
	class action {
		file = "core\inventory\action";
		class firstAidAction {};
	};
	class needs {
		file = "core\needs";
		class needsInit {};
		class needsHunger {};
		class needsThirst {};
		class needsSickness {};
		class needsUpdate {};
	};
	class startup {
		file = "core\startup";
		class act1 {};
		class addActions {};
		class eventHandlers {};
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