/*
	Author: Panorpha & MoldiSocks
	Last Modified: 2019.10.04 12.32
	Email: Panorpha91@gmail.com

	Notes:

	Description:

	To Do: - Change X, Y & Z of jump
	       - Add to key binding (Refer to WarZoneMP > functions > editKeysMenu > fn_keyHandler.sqf)
	       - Check if animation is being called

*/
_jumping = false;

 if (!_jumping) then { //If false then:
 if (isTouchingGround player) then {

 	_jumping = true; //change variable state to true

	_animName =  animationState player; //Returns players current primary animation state
	_animNameCheck = _animName select [4,4]; //selects 4 characters of 4th word. (i think - need to do more research on this alternative syntax). Make sure that line 15 = same characters as this deos (currently "perc")
	if (_animNameCheck == "Perc") then {
		_pSpdKH = speed player; //Returns players speed in km/h
		if (!isNil "_pSpdKH") then { //If player is stationary:
			_pDir = getDir player; //Returns player's direction in a 0-360 bearing
			_pSpdMs = (_pSpdKH*1000)/3600; //=player speed *1000 / 3600
			_Zvel = 4;
			player setVelocity [sin _pDir * _pSpdMs,cos _pDir * _pSpdMs,_Zvel]; //Sets velocity defined by variable in array
			player animate ["AovrPercMrunSrasWrflDf",1]; //In "" is the animation name - This sets the player's animation for 1 refer to animate wiki
		};
	};
	/*else {
		hintSilent "You can only jump while standing";
		sleep 3;
		hintSilent "";
	};*/
		sleep 1.4;// Delay in between jumps
		_jumping = false; //changes variable state to false
	};

};
