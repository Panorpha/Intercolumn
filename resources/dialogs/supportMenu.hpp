/*
	Author: Panorpha
	Last Modified: 2020.04.19 11.00
	Email: Panorpha91@gmail.com

	Notes:

	Description:

	To Do:

*/

class supportMenu {
  idd = 9004;
  movingEnable =false;
  class controls {
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT START (by Panorpha, v1.063, #Cebuze)
		////////////////////////////////////////////////////////

		class supportMenu: IGUIBack
		{
			idc = 2200;

			x = 0.221094 * safezoneW + safezoneX;
			y = 0.211 * safezoneH + safezoneY;
			w = 0.565781 * safezoneW;
			h = 0.646 * safezoneH;
		};
		class supportStrip: RscText
		{
			idc = 1000;

			text = "SUPPORT TICKET"; //--- ToDo: Localize;
			x = 0.221094 * safezoneW + safezoneX;
			y = 0.177 * safezoneH + safezoneY;
			w = 0.565853 * safezoneW;
			h = 0.034 * safezoneH;
			colorBackground[] = {0,0.502,0,1};
		};
		class supportHelp: RscButton
		{
			idc = 1600;
			sizeEx = 0.8 * GUI_GRID_H;

			text = "Help"; //--- ToDo: Localize;
			x = 0.237031 * safezoneW + safezoneX;
			y = 0.2484 * safezoneH + safezoneY;
			w = 0.090843 * safezoneW;
			h = 0.085 * safezoneH;
		};
		class supportTeleport: RscButton
		{
			idc = 1601;
			sizeEx = 0.8 * GUI_GRID_H;

			text = "Teleport"; //--- ToDo: Localize;
			x = 0.237031 * safezoneW + safezoneX;
			y = 0.3708 * safezoneH + safezoneY;
			w = 0.0908434 * safezoneW;
			h = 0.085 * safezoneH;
		};
		class supportSupport: RscButton
		{
			idc = 1602;
			sizeEx = 0.8 * GUI_GRID_H;

			text = "Support Ticket"; //--- ToDo: Localize;
			x = 0.237031 * safezoneW + safezoneX;
			y = 0.4932 * safezoneH + safezoneY;
			w = 0.090843 * safezoneW;
			h = 0.085 * safezoneH;
			colorText[] = {1,0,0,1};
		};
		class supportCancel: RscButton
		{
			idc = 1604;
			action = "closeDialog 9001;";

			text = "Back"; //--- ToDo: Localize;
			x = 0.719937 * safezoneW + safezoneX;
			y = 0.8128 * safezoneH + safezoneY;
			w = 0.06375 * safezoneW;
			h = 0.0408 * safezoneH;
		};
		class supportTextAlpha: RscText
		{
			idc = 1001;

			text = "If you are experiencing any technical difficulties with mission"; //--- ToDo: Localize;
			x = 0.380469 * safezoneW + safezoneX;
			y = 0.262 * safezoneH + safezoneY;
			w = 0.358597 * safezoneW;
			h = 0.0271998 * safezoneH;
		};
		class supportTextBravo: RscText
		{
			idc = 1002;

			text = "file specific errors, or you just want to leave some feedback or"; //--- ToDo: Localize;
			x = 0.380461 * safezoneW + safezoneX;
			y = 0.2892 * safezoneH + safezoneY;
			w = 0.358612 * safezoneW;
			h = 0.0306 * safezoneH;
		};
		class supportTextCharlie: RscText
		{
			idc = 1003;

			text = "suggestions. Please leave a support ticket bellow:"; //--- ToDo: Localize;
			x = 0.412313 * safezoneW + safezoneX;
			y = 0.3232 * safezoneH + safezoneY;
			w = 0.283763 * safezoneW;
			h = 0.0238 * safezoneH;
		};
		class supportTicketButton: RscButton
		{
			idc = 1604;
			url = "https://docs.google.com/forms/d/e/1FAIpQLSebm56YY1y7vf6wrcXPc74IlLk23JaeNxVwh4Q6UwSHn6v33g/viewform";
			underline = "true";

			text = "Submit a Support Ticket Here"; //--- ToDo: Localize;
			x = 0.426735 * safezoneW + safezoneX;
			y = 0.363994 * safezoneH + safezoneY;
			w = 0.256426 * safezoneW;
			h = 0.0680031 * safezoneH;
			colorText[] = {0,0,1,1};
		};
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT END
		////////////////////////////////////////////////////////
  };
};