/*
	Author: Moldisocks & Panorpha
	Last Modified: 2020.06.29 11:23
	Email: moldisocks78@gmail.com & Panorpha91@gmail.com

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