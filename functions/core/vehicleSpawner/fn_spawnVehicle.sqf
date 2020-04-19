/*
	Author: Panorpha & MoldiSocks
	Last Modified: 2019.04.19 18.10
	Email: Panorpha91@gmail.com % moldisocks78@gmail.com

	Notes:

	Description:

	To Do:

*/

params["_marker","_classname"];


_position = getMarkerPos _marker;
_dir = markerDir _marker;
_spCheck = nearestObjects[_position,["AllVehicles"],15];  //Get array of AllVehicles (AllVehicles means litterally any object defined as a vehicle: player, unit, quadbike, etc...) within a 15 metre radius.  May need to look at the AllVehicles part Panorpha. Maybe change to ["tanks","cars","plane",etc...] to make it ore specific
//systemChat str _spCheck;

_veh = objNull; //Define local varible outside of the if statements scope. Explaination below..

if (count _spCheck > 0) then {   //If the array contains elements. i.e. there are vehicles on the spawnpad
	systemChat "There are vehicles on the spawnpad";

	_vehCrew = [];
	{
		if (count (crew _x) > 0) then {
			_vehCrew pushBack _x;
			systemChat "Crewed vehicles on the spawnpad"
		};
	} forEach _spCheck;  //Foreach vehicle on the spawn pad, check if there is crew. If there is crew, then add the VEHICLE no the CREW to the _vehCrew array (should be something like _vehWithCrew or something).  This was a naming mistake on mypart, but still works.

	//systemChat str _vehCrew;
	if (count _vehCrew <= 0) then { //If there are no crew in the vehicles, delete the vehicles and spawn the vehicle.
		{
			deleteVehicle _x;
		} forEach _spCheck;
		_veh = _classname createVehicle _position;
		_veh setDir _dir;

	}  else { //If there are vehicles with crew members, only delete the vehicles that don't have crew members. and then spawn the vehicle.
		{
			if (_vehCrew find _x >=0) then {
				systemChat format ["There is already a %1 on the spawnpad",(getText (configFile >> "CfgVehicles" >> typeOf(_x) >> "DisplayName"))];
			} else {
				deleteVehicle _x;
			};
		} forEach _spCheck;
		_veh = _classname createVehicle _position;
		_veh setDir _dir;

	};
} else {  //If arrray doesn't contain elements. I.e. there are no vehicles on the spawnpad, just spawn the vehicle
	_veh = _classname createVehicle _position;
	_veh setDir _dir;

	//////////////////WRONG//////////////////////////////////////////
/*if _jetname = "C_Plane_Civil_01_F" then {
	[_jet,"Cannon_30mm_Plane_CAS_02_F",5] call BIS_fnc_addWeapon;
	[_jet,"CMFlareLauncher",15] call BIS_fnc_addWeapon;
};*/
};


//To add/ remove addActions whilst player is in a vehichle. This is subject to change:
_veh addEventHandler ["GetIn",{ //Will be called apon a player getting into a vehicle:
	  _veh_action_id = (_this select 2) addAction ["<t color='#54d81c'>Vehicle Rearm/Repair</t>",{call pan_fnc_vehicleRepair}]; //_vehichle_action_id = stores the player addAction ID ["Text of addAction", {call function}]
    adhoc_action_id_arr pushback [_veh_action_id,_this select 2];
		_veh_action_id = (_this select 2) addAction ["<t color='#ff0000'>Drain fuel</t>",{call pan_fnc_vehicleFuelDrain}]; //_vehichle_action_id = stores the player addAction ID ["Text of addAction", {call function}]
    adhoc_action_id_arr pushback [_veh_action_id,_this select 2];
    //add new action here
    //adhoc_action_id_arr pushback [_veh_action_id,_this select 2];
  	publicVariable "adhoc_action_id_arr";
}];

 _veh addEventHandler ["GetOut",{
   _id_indexes = [];
   {
    	if ((_x select 1) == (_this select 2)) then {
    		(_this select 2) removeAction	((adhoc_action_id_arr select _foreachIndex) select 0);
        _id_indexes pushback _foreachIndex;
      };
    } foreach adhoc_action_id_arr;
   {
     adhoc_action_id_arr deleteAt _x;
   } foreach _id_indexes;
 }];

//////////////////RIGHT//////////////////////////////////////////
if (_classname == "C_Plane_Civil_01_F") then { //If the vehicle classname passded into the function is a ceaser BT , apply weapons. Panorpha to change to weapons he wants. You CAN copy and paste this block of code and simply change the vehicle and weapon classnames to suit other vehicles and loadouts.
	[_veh,"HMG_M2",2] call BIS_fnc_addWeapon;
	[_veh,"CMFlareLauncher",2] call BIS_fnc_addWeapon;
};
	player moveInDriver _veh;
/* So in summary, you had the following things wrong:
	- The above statement had a syntax error in the if statement. All if statements are comprised of:  if (condition) then { code to execute};  You didn't have the  ( ) parentheses
	- The if statement's condition was referencing the _jetname variable, that wasn't previsouly defined in the function or scope. I've changed this to _classname, as you already must pass in a vehicle classname when calling the function.
	- The BIS_fnc_addWeapon calls on line 58-59 were trying to pass in an undefined variable. You had just copied to the code, not changing the variable names, meaning that it wouldn't be able to find a definied for that varible, causing it to throw an errror. I've changed to the _veh varibable, as that variable is defined above each time a vehicle is created (i say each, however it is only used once per call due to the control strucutres used). You should also note how the _veh varible has been scoped. Where i've placed it at the moment is outside the scope of the if statments above where the variable is assigned it's object value, which would usually mean that it would throw an undefined variable error. However, i've added another variable declaration at the top on line 9 (in the same scope as its usage at the bottom), meaning it will persist through the scopes and will not throw an error.

The main issues here was the fact that you just copied the code, you need to make sure that to reapply copied code correctly, making sure that all variables used in the pasted code are defined in the current scope, if not you will get errors. Also, the code wasn't put in the correct spot; in this particular case, you were trying to change something about the vehicle once spawned, meaning that you must put the code after the code where the vehicle is created, or it will not have a vehicle to apply it to. You actually did have it in the correct spot ish..., but only for a single case where it was found that there was no vehicles on the spawn pad. Due to the way the if statements are layed out here, the code would have not run in any other case (if there were vehicles on the spawn pad). To avoid this, i've put it at the end of the function, OUTSIDE the scope of all if statements, meaning that no matter the situation, the code will run.

Please take a bit of time to study what i've done and what's different between what you've given me to what i give back to you. I've made the effort to put a lot of explaination in here, which i hope will help you understand how scopes, control structures and variable definitions work.
*/