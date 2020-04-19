/*
	Author: Moldisocks
	Last Modified: 2020.06.29 11:23
	Email: moldisocks78@gmail.com & Panorpha91@gmail.com

	Notes:

	Description:

	To Do:

*/

params["_friendly_marker"];

if (!sz_safezoneing and !sz_safezoned) then {
	sz_safezoneing = true;

	if (sz_justSpawned) exitWith {
		//Player is now invulnerable. Add notification code here (e.g. hint, or cutRsc)
		player allowDamage false;
		sz_justSpawned = false;
		sz_safezoned = true;
		sz_safezoneing = false;
	};

	_followThrough = false;
	_player_died = false;
	_i = 10;

	while {_i > 0} do
	{
		//TODO: Customise player notification
		hintSilent format ["You've entered a friendly safezone, you will be invulnerable in %1 seconds",_i];
		_i = _i - 1;
		sleep 1;
		systemChat format["inArea: %1 | belowHeight: %2",(player inArea _friendly_marker),(((getPos player) select 2) <= [_friendly_marker] call pan_fnc_sz_getHeight)];
		if (!(player inArea _friendly_marker) or !(((getPos player) select 2) <= [_friendly_marker] call pan_fnc_sz_getHeight)) exitwith {_followThrough = true};
		if (!(alive player)) exitWith {_player_died = true}; //If player dies midway through becoming safe, stop loop.
	};
	if (_player_died) exitWith {hintSilent ""; sz_safezoneing = false;};
	if (_followThrough) exitWith {
		//TODO: Customise player notification
		hint "You have left your friendly safezone, stopping the safezone initialisation; thus you will remain vulnerable.";
		sz_safezoneing = false;
		sleep 2;
		hintSilent "";
	};

	player allowDamage false;
	//Player is now invulnerable. Add notification code here (e.g. hint, or cutRsc)
	hint "You're now invulnerable.";
	sz_safezoned = true;
	sz_safezoneing = false;
	sleep 2;
	hintSilent "";
};