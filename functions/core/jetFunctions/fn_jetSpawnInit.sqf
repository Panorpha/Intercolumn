/*
author: Moldisocks

Date: 27/06//2017     Last Modified: 9:50pm

Description: This function is to be called when button "spawn" is pressed (according to the dialog).

Notes:
*/

disableSerialization;

_ctrl = (findDisplay 895) displayCtrl 2801;
_checked = cbChecked _ctrl;
jetno = lbCurSel 1500;
if (jetno == -1) then {
hintSilent "You Must Select A Jet!";
systemChat "In the JetSpawnMenu, you must select a jet before pressing Spawn";
} else {
[jetno,jets,player,_checked] remoteExec ["pan_fnc_jetNotification",0];
[_checked] call pan_fnc_jetSpawns;
};
closeDialog 895;