/*
	Author: Moldisocks & Panorpha
	Last Modified: 2020.06.29 11:21
	Email: moldisocks78@gmail.com & Panorpha91@gmail.com

	Notes:

	Description:

	To Do:

*/

params ["_marker"];

_height = 0;
{
	_markerIndex = (_x select 0) find _marker;
	if !(_markerIndex == -1) exitWith {
		_height = (_x select 1) select _markerIndex;
	};
} forEach sz_config_arr;
_height;
