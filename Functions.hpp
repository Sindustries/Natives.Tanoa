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
		class zoneCheck {};
	};
}

class NAT_Core {
    tag = "NAT";
    class camp {
		file = "core\camp";
		class campAddAction {};
		class campCreate {};
		class campDestroy {};
		class campObjectPlace {};
		class campSleep {};
	};
	class core {
		file = "core\core";
		class cache {};
		class clearWaypoints {};
		class createWaypoint {};
		class createGroup {};
		class emptyVeh {};
		class fuelStation {};
		class getSetting {};
		class getSettings {};
		class handleDamage {};
		class message {};
		class pinMarker {};
		class pinMarkerVeh {};
		class saveGame {};
		class spawnUnit {};
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
		class gearInit {};
		class unequip {};
	};
	class inventory {
		file = "core\inventory";
		class interact {};
		class vInvAdjust {};
		class vInvCheck {};
		class vInvDrop {};
		class vInvOpen {};
		class vInvUpdate {};
		class vInvUse {};
		class vItemInit {};
		class vInvWeight {};
	};
	class action {
		file = "core\inventory\action";
		class campAction {};
		class drinkAction {};
		class eatAction {};
		class firstAidAction {};
		class gasMaskAction {};
		class refuelAction {};
		class repairAction {};
		class schematicAction {};
	};
	class needs {
		file = "core\needs";
		class needsInit {};
		class needsHUD {};
		class healthMonitor {};
		class healthRegen {};
		class needsHunger {};
		class needsThirst {};
		class needsRadiation {};
		class needsSleep {};
		class needsUpdate {};
	};
	class startup {
		file = "core\startup";
		class init {};
		class act1 {};
		class act2 {};
		class eventHandlers {};
		class dynObjMonitor {};
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
		class radObjSpawner {};
	};
	class warbot {
		file = "core\warbot";
		class baseMenu {};
		class baseRequest {};
		class createBase {};
		class createZonePatrol {};
		class findBasePos {};
		class findNearestBase {};
		class findNearestZone {};
		class findShoreBasePos {};
		class rearmBase {};
		class rearmSquad {};
		class warbotInit {};
		class warbotWave {};
		class warbotZoneCreator {};
		class warbotZoneMonitor {};
	};
	class missions {
		file = "core\warbot\mission";
		class missionClearZombies {};
		class missionRescueCivilians {};
		class missionReward {};
		class missionSelect {};
		class missionUpdater {};
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