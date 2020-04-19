/*
	Author: Panorpha
	Last Modified: 2020.04.19 10.58
	Email: Panorpha91@gmail.com

	Notes:

	Description:

	To Do:

*/

class helpMenu {
  idd = 9002;
  movingEnable =false;
  class controls {
 		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT START (by Panorpha, v1.063, #Joqeda)
		////////////////////////////////////////////////////////

		class helpMenu: IGUIBack
		{
			idc = 2200;

			x = 0.221094 * safezoneW + safezoneX;
			y = 0.211 * safezoneH + safezoneY;
			w = 0.565781 * safezoneW;
			h = 0.646 * safezoneH;
		};
		class helpStrip: RscText
		{
			idc = 1000;

			text = "HELP"; //--- ToDo: Localize;
			x = 0.221094 * safezoneW + safezoneX;
			y = 0.177 * safezoneH + safezoneY;
			w = 0.565853 * safezoneW;
			h = 0.034 * safezoneH;
			colorBackground[] = {0,0.502,0,1};
		};
		class helpHelp: RscButton
		{
			idc = 1600;
			sizeEx = 0.8 * GUI_GRID_H;

			text = Help; //--- ToDo: Localize;
			x = 0.237031 * safezoneW + safezoneX;
			y = 0.2484 * safezoneH + safezoneY;
			w = 0.090843 * safezoneW;
			h = 0.085 * safezoneH;
			colorText[] = {1,0,0,1};
		};
		class helpTeleport: RscButton
		{
			idc = 1601;
			sizeEx = 0.8 * GUI_GRID_H;

			text = "Teleport"; //--- ToDo: Localize;
			x = 0.237031 * safezoneW + safezoneX;
			y = 0.3708 * safezoneH + safezoneY;
			w = 0.0908434 * safezoneW;
			h = 0.085 * safezoneH;
		};
		class supportMenu: RscButton
		{
			idc = 1602;
			sizeEx = 0.8 * GUI_GRID_H;

			text = "Support Ticket"; //--- ToDo: Localize;
			x = 0.237031 * safezoneW + safezoneX;
			y = 0.4932 * safezoneH + safezoneY;
			w = 0.090843 * safezoneW;
			h = 0.085 * safezoneH;
		};
		class HelpCancel: RscButton
		{
			idc = 1604;
			action = "closeDialog 9001;";

			text = "Back"; //--- ToDo: Localize;
			x = 0.719937 * safezoneW + safezoneX;
			y = 0.8128 * safezoneH + safezoneY;
			w = 0.06375 * safezoneW;
			h = 0.0408 * safezoneH;
		};
		class helpTextAlpha: RscText
		{
			idc = 1001;

			text = "Intercolumn is a multiplayer sandbox mission which is limitless with possibilities."; //--- ToDo: Localize;
			x = 0.380469 * safezoneW + safezoneX;
			y = 0.262 * safezoneH + safezoneY;
			w = 0.366562 * safezoneW;
			h = 0.0306 * safezoneH;
		};
		class helpTextHotel: RscText
		{
			idc = 1002;

			text = "Please contact Panorpha for additional support."; //--- ToDo: Localize;
			x = 0.418718 * safezoneW + safezoneX;
			y = 0.619 * safezoneH + safezoneY;
			w = 0.282121 * safezoneW;
			h = 0.0748 * safezoneH;
		};
		class helpTextBravo: RscText
		{
			idc = 1003;

			text = "from any and all boundaries. If you have any feedback please contact"; //--- ToDo: Localize;
			x = 0.364531 * safezoneW + safezoneX;
			y = 0.2926 * safezoneH + safezoneY;
			w = 0.398437 * safezoneW;
			h = 0.0306 * safezoneH;
		};
		class helpTextCharlie: RscText
		{
			idc = 1004;

			text = "please contact myself, Panorpha, regarding the subject. All feedback is"; //--- ToDo: Localize;
			x = 0.359744 * safezoneW + safezoneX;
			y = 0.3334 * safezoneH + safezoneY;
			w = 0.411203 * safezoneW;
			h = 0.0238 * safezoneH;
		};
		class helpTextDelta: RscText
		{
			idc = 1005;

			text = "read and taken into account."; //--- ToDo: Localize;
			x = 0.467158 * safezoneW + safezoneX;
			y = 0.360807 * safezoneH + safezoneY;
			w = 0.1705 * safezoneW;
			h = 0.0306 * safezoneH;
		};
		class helpTextEcho: RscText
		{
			idc = 1006;

			text = "Hotkeys are as listed below:"; //--- ToDo: Localize;
			x = 0.359711 * safezoneW + safezoneX;
			y = 0.42983 * safezoneH + safezoneY;
			w = 0.1705 * safezoneW;
			h = 0.0306 * safezoneH;
		};
		class helpTextFoxtrot: RscText
		{
			idc = 1007;

			text = "-   F1 for Earplugs"; //--- ToDo: Localize;
			x = 0.374878 * safezoneW + safezoneX;
			y = 0.464089 * safezoneH + safezoneY;
			w = 0.108334 * safezoneW;
			h = 0.0306 * safezoneH;
		};
		class helpTextGolf: RscText
		{
			idc = 1008;

			text = "-   F2 to acess the Player Menu"; //--- ToDo: Localize;
			x = 0.374093 * safezoneW + safezoneX;
			y = 0.5034 * safezoneH + safezoneY;
			w = 0.181658 * safezoneW;
			h = 0.0306 * safezoneH;
		};
		class RscText_1009: RscText
		{
			idc = 1009;

			text = "-   Left Shift + V toJump"; //--- ToDo: Localize;
			x = 0.374094 * safezoneW + safezoneX;
			y = 0.5442 * safezoneH + safezoneY;
			w = 0.181657 * safezoneW;
			h = 0.0306 * safezoneH;
		};
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT END
		////////////////////////////////////////////////////////

  };
};