/*
	Author: Panorpha
	Last Modified: 2019.10.03 23.21
	Email: Panorpha91@gmail.com

	Notes:

	Description:

	To Do:

*/

sz_safezoned = false;
sz_inEnemyZone = false;
sz_justSpawned = false;
sz_safezoneing = false;


player addEventHandler["Respawn",{sz_justSpawned = true;}];

waitUntil {!isNull (findDisplay 46)};
[] call pan_fnc_mec_localEventHandlers;


if (isNil "adhoc_action_id_arr") then {
	_i = 0;

  if (isNil "adhoc_action_id_arr") then {
  	adhoc_action_id_arr = [];
    publicVariable "adhoc_action_id_arr";
  };
};

waitUntil {(vehicle player) == player};
[] spawn pan_fnc_mod_whitelist;
