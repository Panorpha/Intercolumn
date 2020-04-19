/*
	Author: Panorpha
	Last Modified: 2019.10.02 11.52
	Email: Panorpha91@gmail.com

	Notes: This file is for the object teleportor defined via object inits

	Description:

	To Do:

*/

params["_marker"];


_teleportPos = getMarkerPos _marker; //Finds TP position position
_teleportDir = markerDir _marker; //TPs player facing direction of marker


player setPos _teleportPos;
player SetDir _teleportDir;
systemChat "You're arrived at the teleport position";
