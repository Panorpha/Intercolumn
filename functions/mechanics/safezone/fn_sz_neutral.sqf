/*
	Author: Moldisocks
	Last Modified: 2020.04.29 19.30
	Email: moldisocks78@gmail.com

	Description: Must be run on player. Handles resetting player invulnerbility upon leaving safezone.

	To Do:

*/

sz_justSpawned = false;
sz_safezoneing = false;
if (sz_safezoned) then {
	sz_safezoned = false;
	player allowDamage true;
	hint "You've left the safezone. You are now vulnerable.";
	sleep 2;
	hintSilent "";
};