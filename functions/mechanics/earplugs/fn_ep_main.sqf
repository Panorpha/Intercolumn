/*
	Author: Panorpha
	Last Modified: 2019.10.04 12.15
	Email: Panorpha91@gmail.com

	Notes:

	Description:

	To Do:

*/
_ep_switch = false;

if (!_ep_switch) then {
	_ep_switch = true;
	If (soundVolume < 0.3) then {
		0.4 fadeSound 1;
    //Remove the image:
    "ep_layer" cutText ["","PLAIN"];
	//Alternatively use a hint insted of a RSC Title:	hint "Earplugs off";
    sleep 2; //Changes the amount of time inbetween you being able to use your earplugs again
    //hint "";
	}	else {
		//Calls the image:
		 "ep_layer" cutRsc ["earplugsSymbol","PLAIN"];
		0.4 fadeSound 0.1;
   //Alternatively use a hint insted of a RSC Title:  hint "Earplugs On";
    sleep 2; //Changes the amount of time inbetween you being able to use your earplugs again
    //hint "";
	};
	sleep 1;
	_ep_switch = false;
};