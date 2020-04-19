/*
	Author: Panorpha
	Last Modified: 2019.03.10 10.54
	Email: Panorpha91@gmail.com

	Notes:

	Description:

	To Do:

*/

_drain_time = 10; //Variable countdown time

hintSilent "Begining to drain fuel...";
s_failed = false;
sleep 1;
while {_drain_time > 0} do
{
	if (vehicle player == player) exitWith {systemChat "Failed to repair vehicle, player not in vehicle"};
	hintSilent format ["%1 seconds left...",_drain_time];
	_drain_time = _drain_time - 1;
	sleep 1;
};
if (s_failed) exitWith {};
(vehicle player) setfuel 0; //Sets feul to empty
hint "Fuel has been drained";

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