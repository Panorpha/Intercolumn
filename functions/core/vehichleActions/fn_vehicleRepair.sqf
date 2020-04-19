/*
	Author: Panorpha
	Last Modified: 2019.02.03 15.50
	Email: Panorpha91@gmail.com

	Notes:

	Description:

	To Do:

*/


if (vehicle player == player) exitWith {systemChat "Failed to repair vehicle, player not in vehicle"};
if (isEngineOn(vehicle player)) exitWith {hint "Cannot repair vehicle when engine is on"; systemChat "Failed to repair vehicle, engine is on"};
if (speed(vehicle player) > 1) exitWith {hint "Cannot repair vehicle while moving"; systemChat "Failed to repair vehicle, vehicle is moving"};


_repair_time = 15; //Variable time for vehicle repair time

hintSilent "Begining to repair and rearm vehicle...";
s_failed = false;
sleep 1;
while {_repair_time > 0} do
{
	if (vehicle player == player) exitWith {systemChat "Failed to repair vehicle, player not in vehicle"};
	if (isEngineOn(vehicle player)) exitWith {s_failed = true; hint "Cannot repair vehicle when engine is on"; systemChat "Failed to repair vehicle, engine is on"};
	if (speed(vehicle player) > 1) exitWith {s_failed = true; hint "Cannot repair vehicle while moving"; systemChat "Failed to repair vehicle, vehicle is moving"};
	hintSilent format ["%1 seconds left...",_repair_time];
	_repair_time = _repair_time - 1;
	sleep 1;
};
if (s_failed) exitWith {};
(vehicle player) setfuel 1; //Sets feul to full
(vehicle player) setdamage 0; //Sets damage to zero
(vehicle player) setVehicleAmmo 1; //Sets ammo to full
hint "Vehicle repaired and rearmed";

/*_timeForRepair = 15; //Variable time for vehicle repair time
_vehicle = vehicle player; //vehichle player = vehicle contains a player

hint format ["Your vehicle will be repaired and refueled in %1 seconds",_timeForRepair];
sleep _timeForRepair;

if (_vehicle == player) then { //If player is in vehicle then:
	{_vehicle = cursorTarget;}; //Does action to teh cursor target
	_vehicle setfuel 1; //Sets feul to full
	_vehicle setdamage 0; //Sets damage to zero
	_vehicle setVehicleAmmo 1; //Sets ammo to full
	_vehicle = nil; //Has a return value of nothing
	_vehicle = _this select 0; //Check. _this deos not exist.
	_vehicle setvectorup [0,0,1]; //Unflips vehicle. [0,0,1] = Face up, [0,0,-1] = Face down
};
*/