/*
author: Moldisocks with edits by Panorpha

Date: 19/04//2019     Last Modified: 6:00pm

Description: This function accepts params and then spawns jets accordingly to those params. It then moves the player into said jet.

Notes: Please read JS-Setup.txt for setup instructions.
*/

params ["_groundSp"];
_jet = objNull;
_airmin = "";
_airmax = "";
_groundPoint = "";
_jetAlt = 0; // changing this line will not affect the altitude of the spawned in jet, read down further to find the same variable for each team.
_Rotation = 0;
_detectRadius = 15; // value that sets the detection radius for the ground spawning feature.
if (side player == east) then {
// for csat players------------------------------------------------------------------------------------------------------------------
	if (_groundSp) then {
		// for spawning on ground
		_groundPoint = "csatgroundspawn"; // Marker that marks position for the jet to spawn on, rotation of marker is also taken into account.
	} else {
		// for spawning in the air
		_airmin = "csatairspawn_1";
		_airmax = "csatairspawn_2";
		_Rotation = 45; // sets the median direction that the jet spawns in facing ( a random direction that is either 20 degrees left or right is selected base on this variable).
		_jetAlt = 2000; // sets the exact altitude for the jet to spawn in at
	};
} else {
	if (side player == west) then {
// for nato players------------------------------------------------------------------------------------------------------------------
	if (_groundSp) then {
		// for spawning on ground
		_groundPoint = "natogroundspawn"; // Marker that marks position for the jet to spawn on, rotation of marker is also taken into account.
	} else {
		// for spawning in the air
		_airmin = "natoairspawn_1";
		_airmax = "natoairspawn_2";
		_Rotation = 45; // sets the main direction that the jet spawns in facing ( a random direction that is either 20 degrees left or right is selected base on this variable).
		_jetAlt = 500; // sets the exact altitude for the jet to spawn in at
	};
	} else {
		if (side player == resistance) then {
// for independent players-----------------------------------------------------------------------------------------------------------
			if (_groundSp) then {
			// for spawning on ground
				_groundPoint = "guergroundspawn"; // Marker that marks position for the jet to spawn on, rotation of marker is also taken into account.
			} else {
		// for spawning in the air
			_airmin = "guerairspawn_1";
			_airmax = "guerairspawn_2";
			_Rotation = 45; // sets the main direction that the jet spawns in facing ( a random direction that is either 20 degrees left or right is selected base on this variable).
			_jetAlt = 2000; // sets the exact altitude for the jet to spawn in at
			};
		} else {
//for civillian players---------------------------------------------------------------------------------------------------------------
			if (_groundSp) then {
		// for spawning on ground
				_groundPoint = "civgroundspawn"; // Marker that marks position for the jet to spawn on, rotation of marker is also taken into account.
			} else {
		// for spawning in the air
			_airmin = "civairspawn_1";
			_airmax = "civairspawn_2";
			_Rotation = 45; // sets the main direction that the jet spawns in facing ( a random direction that is either 20 degrees left or right is selected base on this variable).
			_jetAlt = 2000; // sets the exact altitude for the jet to spawn in at
			};
		};
	};
};


if (_groundSp) then {

	// for spawning on ground
if (getMarkerColor _groundPoint == "") then {
systemChat format ["--------------------------------********--ERROR--ERROR--*******---------------------------------
Marker: %1  Have not been placed and/or named correctly. Refer to the JS-Setup.txt file for setup instructions.", _groundPoint];
hintSilent "ERROR!!";
sleep (2);
hintSilent "";
} else {
_Dir = markerDir _groundPoint;
_mpos = getMarkerPos _groundPoint;
_Xcrd = _mpos select 0;
_Ycrd = _mpos select 1;
_objarray = nearestObjects [_mpos,["Plane"],_detectRadius];
_objstr = _objarray select 0;
if (isNil "_objstr")then{
_jetname = jetsclassname select jetno;

_jet= createVehicle [_jetname,[_Xcrd,_Ycrd,0], [], 0, "NONE"];
_jet setDir _Dir;

_jet engineOn true;

} else {
hintSilent "Spawn Area is full!";
systemChat "Ensure that the jet's ground spawn area is kept clear";
sleep (5);
hintSilent "";
};
};
} else {
	//for spawning in the air
if (!(getMarkerColor _airmin == "") && !(getMarkerColor _airmax == "")) then {
_markerPosMin = getMarkerPos _airmin;
_markerPosMax = getMarkerPos _airmax;
_minXcrd = _markerPosMin select 0;
_maxXcrd = _markerPosMax select 0;
_minYcrd = _markerPosMin select 1;
_maxYcrd = _markerPosMax select 1;
_midXcrd = (_minXcrd +_maxXcrd)/2;
_midYcrd =(_minYcrd +_maxYcrd)/2;
_Xcrd = random [_minXcrd,_midXcrd ,_maxXcrd];
_Ycrd = random [_minYcrd,_midYcrd ,_maxYcrd];
_RanDir = random [_Rotation - 20,_Rotation,_Rotation + 20];

//hintSilent str([_Xcrd,_Ycrd]); //uncomment to hintSilent x and y cords for where the jet spawns

_jetname = jetsclassname select jetno;



_jet= createVehicle [_jetname,[_Xcrd,_Ycrd,_jetAlt], [], 0, "NONE"];

_jet setDir _RanDir;
_direction = getDir _jet;
_jet setVelocity [sin _direction * 222.222 ,cos _direction * 222.222,0];


_jet engineOn true;
} else {
systemChat format ["--------------------------------********--ERROR--ERROR--*******---------------------------------
Marker: %1 And Marker: %2, Have not been placed and/or named correctly. Refer to the JS-Setup.txt file for setup instructions",_airmin,_airmax];
hintSilent "ERROR!!";
sleep (2);
hintSilent "";
};
};

//NOTE: Line 144 through to line 162 will only work for ONE ACTION ONLY. If multiple actions are required refer to other vehichle spawners.
_jet addEventHandler ["GetIn",{ //Will be called apon a player getting into a vehicle:
	_veh_action_id = (_this select 2) addAction ["<t color='#54d81c'>Vehicle Rearm/Repair</t>",{call pan_fnc_vehicleRepair}]; //_vehichle_action_id = stores the player addAction ID ["Text of addAction", {call function}]

    adhoc_action_id_arr pushback [_veh_action_id,_this select 2];
  	publicVariable "adhoc_action_id_arr";
}];

 _jet addEventHandler ["GetOut",{
   _id_index = 0;
   {
    	if ((_x select 1) == (_this select 2)) exitWith {
    		(_this select 2) removeAction	((adhoc_action_id_arr select _foreachIndex) select 0);
        _id_index = _foreachIndex;
      };
    } foreach adhoc_action_id_arr;

   adhoc_action_id_arr deleteAt _id_index;
 }];
 player moveInDriver _jet;