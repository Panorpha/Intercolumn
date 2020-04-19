/*
	Author: Panorpha
	Last Modified: 2020.04.01 13.07
	Email: Panorpha91@gmail.com

	Notes:

	Description:

	To Do:

*/

setViewDistance 5500;
if (isNil "cusRadio") then {
	cusRadio = radioChannelCreate [[0.92,0.92,0.92,1],"","SAFEZONE",allUnits,false];
};
publicVariable "cusRadio";

//Server aboart to loby after 2 hours: 7200 seconds
sleep 6600;
systemChat "For a full server clean up, the mission will reset in 10 minutes";
sleep 590;
hintSilent "The server will reset";
sleep 10;
endMission "END1";