/*
	Author: Panorpha
	Last Modified: 2020.04.01 20.49
	Email: Panorpha91@gmail.com

	Notes:

	Description:

	To Do:

*/

class playerMenu {
  idd = 9001;
  movingEnable =false;
  class controls {
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT START (by Panorpha, v1.063, #Hubocy)
		////////////////////////////////////////////////////////

		class homeBackround: IGUIBack
		{
			idc = 2200;

			x = 0.221117 * safezoneW + safezoneX;
			y = 0.210987 * safezoneH + safezoneY;
			w = 0.56578 * safezoneW;
			h = 0.645999 * safezoneH;
		};
		class homeStrip: RscText
		{
			idc = 1000;

			text = "HOME"; //--- ToDo: Localize;
			x = 0.221117 * safezoneW + safezoneX;
			y = 0.176985 * safezoneH + safezoneY;
			w = 0.565854 * safezoneW;
			h = 0.034 * safezoneH;
			colorBackground[] = {0,0.502,0,1};
		};
		class homeHelp: RscButton
		{
			idc = 1600;
			sizeEx = 0.8 * GUI_GRID_H;
			action = createDialog "helpMenu";

			text = "Help"; //--- ToDo: Localize;
			x = 0.237031 * safezoneW + safezoneX;
			y = 0.2484 * safezoneH + safezoneY;
			w = 0.090843 * safezoneW;
			h = 0.085 * safezoneH;
		};
		class homeTeleport: RscButton
		{
			idc = 1601;
			sizeEx = 0.8 * GUI_GRID_H;
			action = createDialog "teleportMenu";

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
			action = createDialog "supportMenu"; /////////////////////////////////////////////////////////////////////////////////////////////////

			text = "Support Ticket"; //--- ToDo: Localize;
			x = 0.237031 * safezoneW + safezoneX;
			y = 0.4932 * safezoneH + safezoneY;
			w = 0.090843 * safezoneW;
			h = 0.085 * safezoneH;
		};
		class homeCancel: RscButton
		{
			idc = 1603;
			action = "closeDialog 9001;";

			text = "Cancel"; //--- ToDo: Localize;
			x = 0.719953 * safezoneW + safezoneX;
			y = 0.812814 * safezoneH + safezoneY;
			w = 0.06375 * safezoneW;
			h = 0.0407998 * safezoneH;
		};
		class splashImage: RscPicture
		{
			idc = 1200;

			text = "resources\pictures\overviewSplash.jpg";
			x = 0.383255 * safezoneW + safezoneX;
			y = 0.320132 * safezoneH + safezoneY;
			w = 0.350625 * safezoneW;
			h = 0.3298 * safezoneH;
		};
		class splashName: RscText
		{
			idc = 1001;

			text = "INTERCOLUMN"; //--- ToDo: Localize;
			x = 0.386281 * safezoneW + safezoneX;
			y = 0.28137 * safezoneH + safezoneY;
			w = 0.34588 * safezoneW;
			h = 0.034 * safezoneH;
		};
		class splashSignature: RscText
		{
			idc = 2202;

			text = "By Panorpha"; //--- ToDo: Localize;
			x = 0.651307 * safezoneW + safezoneX;
			y = 0.655387 * safezoneH + safezoneY;
			w = 0.0796876 * safezoneW;
			h = 0.034 * safezoneH;
		};
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT END
		////////////////////////////////////////////////////////

  };
};









