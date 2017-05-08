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
		class emptyVeh {};
		class fuelPump {};
		class fuelStation {};
		class getSetting {};
		class getSettings {};
		class message {};
		class updateProgressBar {};
		class weather {};
	};
	class startup {
		file = "core\startup";
		class addActions {};
		class gravity {};
		class gravity_ray {};
		class gravity_ray_effect {};
		class keyHandler {};
		class locationDisplay {};
		class loadPlayerSpawn {};
		class prologue {};
		class tpw_air {};
		class tpw_animals {};
		class tpw_core {};
	};
};