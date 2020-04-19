/*
	Author: Panorpha
	Last Modified: 2020.04.19 11.22
	Email: Panorpha91@gmail.com

	Notes:

	Description:

	To Do:

*/

createDialog "playerMenu";  //Creating menu

waitUntil{!isNull(findDisplay 9003)}; //Wait until menu is registered before manipulating controls, or adding text.

//Do all setup stuff...

tp_points = call pan_fnc_tp_getPoints; //Get array of points that player can teleport to. Array consists of [Displayname, position]
//systemChat str tp_points;
//list box population
{
	lbAdd [1500,name _x];
} foreach tp_points;

lbSetCurSel [1500,0];


(findDisplay 9003) displayAddEventHandler ["Unload",{
	//When dialog closes, run this code. You can check if player settings are saved or not, then save just before closing.

}];