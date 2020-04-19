/*
	Author: Moldisocks & Panorpha
	Last Modified: 2020.06.29 11:22
	Email: moldisocks78@gmail.com & Panorpha91@gmail.com

	Notes:

	Description:

	To Do:

*/

params["_enemy_marker"];

if (!sz_inEnemyZone) then {
	sz_inEnemyZone = true;
	_followThrough = false;
	_player_died = false;
	_i = 10;

	while {_i > 0} do
	{
		hintSilent format ["You're in an enemy safezone, leave the area immediately or you will be killed. %1 seconds left.",_i];
		_i = _i - 1;
		sleep 1;
		systemChat format["inArea: %1 | belowHeight: %2",(player inArea _enemy_marker),(((getPos player) select 2) <= [_enemy_marker] call pan_fnc_sz_getHeight)];
		if (!(player inArea _enemy_marker) or !(((getPos player) select 2) <= [_enemy_marker] call pan_fnc_sz_getHeight)) exitwith {_followThrough = true};
		if (!(alive player)) exitWith {_player_died = true}; //If player dies midway through being killed, stop loop.
	};
	
	if (_player_died) exitWith {hintSilent ""; sz_inEnemyZone = false;};

	if (_followThrough) exitWith {
		hint "You've left the area, and won't be killed anymore";
		sz_inEnemyZone = false;
		sleep 2;
		hintSilent "";
	};

	player setDamage 1;
	hintSilent "";
};