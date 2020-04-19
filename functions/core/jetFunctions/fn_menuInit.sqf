/*
author: Moldisocks

Date: 27/06//2017     Last Modified: 8:34pm     Edit made by Panorpha on late 2018

Description: This function opens up the jet spawner menu, and initalises its components.

Notes: Please read JS-Setup.txt for setup instructions.
*/

disableSerialization;

jets = ["Wipeout", "Neophron", "Buzzard CAS", "Buzzard AA", "Wasp", "Shikra", "Gryphon"];

jetsclassname = ["B_PLANE_CAS_01_F","O_PLANE_CAS_02_F","I_PLANE_FIGHTER_03_CAS_F","I_PLANE_FIGHTER_03_AA_F","B_PLANE_FIGHTER_01_F","O_PLANE_FIGHTER_02_F","I_PLANE_FIGHTER_04_F","I_C_Plane_Civil_01_F"];

createDialog "JetSpawnerMenu";

waitUntil {!isNull (findDisplay 895);};

_ctrl = (findDisplay 895) displayCtrl 1500;

{_ctrl lbAdd _x;} forEach jets;

