/*
	Author: Moldisocks & Panorpha
	Last Modified: 2020.06.29 11:22
	Email: moldisocks78@gmail.com & Panorpha91@gmail.com

	Description: Spawn this function to create a trigger loop PER SIDE. This trigger is responsible for checking if players are in the correct area or not, the executing that appropriate function.

	To Do:

*/

params["_friendly_markers","_enemy_markers","_zone_side"];

while {true} do
{
	{
		_player = _x;
		_playerHeight = (getPos _player) select 2;

		//Only run check for players on the current zone's side. Each side will have a single zone instance.
		if (side _player == _zone_side) then {
			_inFriendlyArea = false;
			_inEnemyArea = false;
			_currentfriendlyMarker = "";
			_currentEnemyMarker = "";

			//Check if player is in friendly zone
			{
				if ((_player inArea _x) and (_playerHeight <= [_x] call pan_fnc_sz_getHeight)) exitWith {
					_inFriendlyArea = true;
					_currentfriendlyMarker = _x;
				};
			} forEach _friendly_markers;

			//Check if player is in enemy zone
			{
				if ((_player inArea _x) and (_playerHeight <= [_x] call pan_fnc_sz_getHeight)) exitWith {
					_inEnemyArea = true;
					_currentEnemyMarker = _x;
				};
			} forEach _enemy_markers;

			//Execute appropriate action
			if (_inFriendlyArea) then {
				//Start safezone enable countdown
				[_currentfriendlyMarker] remoteExec ["pan_fnc_sz_safe",_player];
			};

			if (_inEnemyArea) then {
				//Start kill countdown
				[_currentEnemyMarker] remoteExec ["pan_fnc_sz_kill",_player];
			};

			if (!_inEnemyArea and !_inFriendlyArea) then {
				//If they were previously in friendly area remove safezone invulnerability. Countdowns for entering safezones and killzones are handled seperately.
				[] remoteExec ["pan_fnc_sz_neutral",_player];
			};
		};
	} forEach allPlayers;

	sleep 0.5;
};