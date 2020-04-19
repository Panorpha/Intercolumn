/*
	Author: Panorpha
	Last Modified: 2020.04.19 11.16
	Email: Panorpha91@gmail.com

	Notes:

	Description:

	To Do:

*/

	class pan {
	tag = "pan";
	class jetFunctions {
		file = "functions\core\jetFunctions";
		class menuInit {};
		class jetSpawnInit {};
		class jetSpawns {};
	};
	class vehicleSpawner {
		file = "functions\core\vehicleSpawner";
		class spawnVehicle {};
	};
	class tpFunctions {
		file = "functions\core\tpFunctions";
		class tpToLocation {};
		class tp_getPoints {};
		class tp_main {};
	};
	class vehichleActions {
		file = "functions\core\vehichleActions";
		class vehicleRepair {};
		class vehicleFuelDrain {};
	};
	class misc {
		file = "functions\core\misc";
		class msc_pmenu_init {};
	};
	class localEventHandlers {
		file = "functions\mechanics";
		class mec_localEventHandlers{};
	};
	class events{
		file = "functions\mechanics\events";
		class keys_downPressHandler{};
	};
	class earplugs {
		file = "functions\mechanics\earplugs";
		class ep_main {};
	};

	class moderator {
		file = "functions\mechanics\moderator";
		class mod_whitelist {};
	};

	class animations {
		file = "functions\mechanics\animations";
		class anm_jump{};
	};
};