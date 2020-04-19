/*
  Author: Panorpha
  Last Modified: 2019.10.06 18.23
  Email: Panorpha91@gmail.com

  Notes:

  Description:

  To Do:

*/

_reserved_uids =
[
 "76561198158262401"/* Panorpha */
];
_reserved_unitStr = ["res1","res2"]; // Array of strings containing var name of each reserved player
_reserved_units = []; // Second array, containing objects of verified existence
//Keep these seperated from code. If error occurs, UID won't be shown










//Verify existence of player object
{
  if (!IsNull (missionNamespace getVariable _x)) then {
    _reserved_units pushBack (missionNamespace getVariable _x);
  }
} forEach _reserved_unitStr; //For each _reserved_unitStr (Defined units)
if (count _reserved_units < 1) exitWith {}; //If no reserved slots populated, exit function. Note: If going to add more than 1 _reserved_uids check debug weather or not this needs to be a greater number


_playerIsAdmin = false;
_playerInAdminSlot = false;
{
  if (_x == player) then { //If player is in reserve slot:
     _playerInAdminSlot = true; //Changes flag state to true
    if ((_reserved_uids select _foreachindex) == (getPlayerUID player)) then {
    //If _reserved_uids (_reserved_uids (Variable) select (selects) _foreachindex(Is a magic variable which represents 0  in a 4each _x element (The First element of a loop array))) == getsPlayerUID (Finds player UID of _x) then:
      _playerIsAdmin = true; //Changes _playerIsAdmin state to true
    }
  }
} foreach _reserved_units; //Do line 41 - 49 foreach _reserved_units

if (_playerIsAdmin) then { //If _playerIsAdmin then:
  systemChat "Develepor slot granted"; //System chat followed by exit function
}
else
{
  if (_playerInAdminSlot) then { //If player is i n admin slot:
    titleText ["", "BLACK OUT"];
    disableUserInput true; //Removes player input

    //Kick to lobby timer
    _i = 10;
    while {_i > 0} do {
      hint format ["You are in a locked slot! You will be kicked to the lobby in %1 seconds!",_i];
      _i = _i - 1;
      sleep 1;
    };

    titleText ["", "BLACK IN"];
    disableUserInput false; //Enables player input
    failMission "end1"; //Removes player to end screen
  };
};