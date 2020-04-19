/*
	Author: Moldisocks
	Last Modified: 2020.04.28 08.52
	Email: moldisocks78@gmail.com

	Description: Must be run on server. Spawn this function from initServer.sqf

	To Do:

*/



[player,['Respawn',"hintSilent ''; sz_safezoned = false;  sz_inEnemyZone = false; sz_justSpawned = true; sz_safezoneing = false; systemChat 'RESPAWNED'"]] remoteExec ["addEventHandler",-2,true];

//Layout config settings (inc. marker name, trigger height, etc..) Use area markers in editor to define these positions.
sz_available_sides = [east,west]; //List of expected sides.
private _csat_markers = ["sz_csat"];
private _nato_markers = ["sz_nato"];
private _civ_markers  = ["sz_civ"];
private _guer_markers = ["sz_guer"];

private _csat_base_heights = [50];
private _nato_base_heights = [50];
private _civ_base_heights = [50];
private _guer_base_heights = [50];

sz_config_arr = [
	[_csat_markers,_csat_base_heights],
	[_nato_markers,_nato_base_heights],
	[_civ_markers,_civ_base_heights],
	[_guer_markers,_guer_base_heights]
];

publicVariable "sz_config_arr";

// Verify existence of marker
_followThrough = false;
_failed_side = objNull;
_failed_marker = [];
{
	{
		if (getMarkerColor _x == "") exitWith {
			_followThrough = true;
			_failed_marker = _x;
		};
	} foreach ((sz_config_arr select _foreachindex) select 0);

	if (_followThrough) exitWith{
		_failed_side = _x;
	};
} foreach sz_available_sides;

if (_followThrough) exitWith {
	private _msg = format['##ERROR## - Failed to find "%1" safezone marker for %2, please contact the server administrator.',_failed_marker,_failed_side];
	[_msg] remoteExec ["systemChat",0];
};


// Create zones
{
	private _friendly_markers = (sz_config_arr select _foreachindex) select 0;

	//Consolidate all enemy markers into a single array
	_enemy_markers = [];
	_current_side = _x;
	{
		if (_x != _current_side) then {
			{
				_enemy_markers pushBack _x;
			} forEach ((sz_config_arr select _foreachindex) select 0);
		};
	} forEach sz_available_sides;

	[_friendly_markers,_enemy_markers,_current_side] spawn mld_fnc_sz_createZone;

} forEach sz_available_sides;