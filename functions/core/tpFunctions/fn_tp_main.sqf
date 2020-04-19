/*
	Author: Panorpha
	Last Modified: 2020.04.19 11.23
	Email: Panorpha91@gmail.com

	Notes:

	Description:

	To Do:

*/

if (isNull (findDisplay 9003)) exitWith {systemChat "File fn_tp_main.sqf ||| Display not found"}; //Checks to see if display is shown before running function

//systemChat str (lbCurSel 1500); //debug

//Detect differnce in tp_list when opening menu and when clicking confirm.

_newTPlist = call pan_fnc_tp_getPoints;

if ((count _newTPlist) != (count tp_points)) exitWith {
	//Warn the player that the list has changed.
	hint "Some players have joined or left the server, please reselect the position you'd like to teleport to.";
	lbClear 1500;
	{
		lbAdd [1500,name _x];
	} foreach _newTPlist;
	lbSetCurSel [1500,0];
};


_point = getPos (tp_points select (lbCurSel 1500)); //Gets list index. 1500 is the list first placed on page.

//systemChat str _point;

if (isTouchingGround player) then
{
	//debug:
	//systemChat format ["%1 is touching ground", name player];
	player setPos _point;
} else {
hint "Error. You can't teleport while falling.";
};