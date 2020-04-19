/*
	File: fn_spawnVehicle.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Spawns the selected vehicle, if a vehicle is already on the spawn point
	then it deletes the vehicle from the spawn point.
*/
disableSerialization;
private["_position","_direction","_className","_displayName","_spCheck","_cfgInfo"];
if(lnbCurSelRow 38101 == -1) exitWith {hint "You did not select a vehicle to spawn!"};

_className = lnbData[38101,[(lnbCurSelRow 38101),0]];
_displayName = lnbData[38101,[(lnbCurSelRow 38101),1]];
_position = getMarkerPos VVS_SP;
_direction = markerDir VVS_SP;

//Make sure the marker exists in a way.
if(isNil "_position") exitWith {hint "The spawn point marker doesn't exist?";};

//Check to make sure the spawn point doesn't have a vehicle on it, if it does then delete it.
_spCheck = nearestObjects[_position,["AllVehicles"],15];
_spCheck = nearestObjects[_position,["AllVehicles"],15];
if(!isNil "_spCheck") then {
	{
		deleteVehicle _x;
	} forEach _spCheck;
};

_cfgInfo = [_className] call VVS_fnc_cfgInfo;

_vehicle = _className createVehicle _position;
_vehicle allowDamage false;
_vehicle setPos _position; //Make sure it gets set onto the position.
_vehicle setDir _direction; //Set the vehicles direction the same as the marker.

//To add/ remove addActions whilst player is in a vehichle. This sis subject to change:
_vehicle addEventHandler ["GetIn",{ //Will be called apon a player getting into a vehicle:
	  _veh_action_id = (_this select 2) addAction ["<t color='#54d81c'>Vehicle Rearm/Repair</t>",{call pan_fnc_vehicleRepair}]; //_vehichle_action_id = stores the player addAction ID ["Text of addAction", {call function}]
    adhoc_action_id_arr pushback [_veh_action_id,_this select 2];
		_veh_action_id = (_this select 2) addAction ["<t color='#ff0000'>Drain fuel</t>",{call pan_fnc_vehicleFuelDrain}]; //_vehichle_action_id = stores the player addAction ID ["Text of addAction", {call function}]
    adhoc_action_id_arr pushback [_veh_action_id,_this select 2];
    //add new action here
    //adhoc_action_id_arr pushback [_veh_action_id,_this select 2];
  	publicVariable "adhoc_action_id_arr";
}];

 _vehicle addEventHandler ["GetOut",{
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

if((_cfgInfo select 4) == "Autonomous") then
{
	createVehicleCrew _vehicle;
};

if(VVS_Checkbox) then
{
	clearWeaponCargoGlobal _vehicle;
	clearMagazineCargoGlobal _vehicle;
	clearItemCargoGlobal _vehicle;
};

_vehicle allowDamage true;
hint format["You have spawned a %1",_displayName];
closeDialog 0;

if ((VVS_spCheckbox) and (!((_cfgInfo select 4) == "Autonomous"))) then {
	player moveInDriver _vehicle;
} else {
	if ((_cfgInfo select 4) == "Autonomous") then {
		hintSilent "You cannot spawn into an Autonomous vehicle from this menu.";
	};
};




