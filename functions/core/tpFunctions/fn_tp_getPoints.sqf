/*
	Author: Panorpha
	Last Modified: 2019.10.06 14.33
	Email: Panorpha91@gmail.com

	Notes:

	Description:

	To Do:

*/

_return_arr = [];

//Get list of players on player's team/side

{
	if (side _x == playerSide) then {
		_return_arr pushback _x;
	};
} foreach allPlayers; //Loop through all players in the game, pushes back each player that is on the same team as the local player. "allUnits" = Including AI, "allPlayers" = only players.

//Append other points,
// if (does somethinte) the {
// 	_return_arr pushback ["F Flag",getMarkerPos "FFlagMarker"];
// };

//Return array/
_return_arr;