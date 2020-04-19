/*
	Author: Panorpha
	Last Modified: 2020.04.19 11.00
	Email: Panorpha91@gmail.com

	Notes:

	Description:

	To Do:

*/

class teleportMenu {
  idd = 9003;
  movingEnable =false;
  class controls {
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT START (by Panorpha, v1.063, #Daryba)
		////////////////////////////////////////////////////////

		class teleportMenu: IGUIBack
		{
			idc = 2200;

			x = 0.221094 * safezoneW + safezoneX;
			y = 0.211 * safezoneH + safezoneY;
			w = 0.565781 * safezoneW;
			h = 0.646 * safezoneH;
		};
		class teleportStrip: RscText
		{
			idc = 1000;

			text = "TELEPORT"; //--- ToDo: Localize;
			x = 0.221094 * safezoneW + safezoneX;
			y = 0.177 * safezoneH + safezoneY;
			w = 0.565853 * safezoneW;
			h = 0.034 * safezoneH;
			colorBackground[] = {0,0.502,0,1};
		};
		class teleportHelp: RscButton
		{
			idc = 1600;
			sizeEx = 0.8 * GUI_GRID_H;

			text = "Help"; //--- ToDo: Localize;
			x = 0.237031 * safezoneW + safezoneX;
			y = 0.2484 * safezoneH + safezoneY;
			w = 0.090843 * safezoneW;
			h = 0.085 * safezoneH;
		};
		class teleportTeleport: RscButton
		{
			idc = 1601;
			sizeEx = 0.8 * GUI_GRID_H;

			text = "Teleport"; //--- ToDo: Localize;
			x = 0.237031 * safezoneW + safezoneX;
			y = 0.3708 * safezoneH + safezoneY;
			w = 0.0908434 * safezoneW;
			h = 0.085 * safezoneH;
			colorText[] = {1,0,0,1};
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
		class teleportCancel: RscButton
		{
			idc = 1604;
			action = "closeDialog 9003;";

			text = "Back"; //--- ToDo: Localize;
			x = 0.719937 * safezoneW + safezoneX;
			y = 0.8128 * safezoneH + safezoneY;
			w = 0.06375 * safezoneW;
			h = 0.0408 * safezoneH;
		};
		class playersListBox: RscListBox
		{
			idc = 1500;

			x = 0.396406 * safezoneW + safezoneX;
			y = 0.381 * safezoneH + safezoneY;
			w = 0.239062 * safezoneW;
			h = 0.391 * safezoneH;
		};
		class textCharlie: RscText
		{
			idc = 1001;
			text = "List of available players to teleport to:"; //--- ToDo: Localize;
			x = 0.404375 * safezoneW + safezoneX;
			y = 0.33 * safezoneH + safezoneY;
			w = 0.223125 * safezoneW;
			h = 0.051 * safezoneH;
		};
		class textAlpha: RscText
		{
			idc = 1002;
			text = "Select desired player you wish to teleport to."; //--- ToDo: Localize;
			x = 0.388437 * safezoneW + safezoneX;
			y = 0.228 * safezoneH + safezoneY;
			w = 0.262969 * safezoneW;
			h = 0.051 * safezoneH;
		};
		class textBravo: RscText
		{
			idc = 1003;
			text = "After hit the confirm button below."; //--- ToDo: Localize;
			x = 0.412344 * safezoneW + safezoneX;
			y = 0.279 * safezoneH + safezoneY;
			w = 0.207187 * safezoneW;
			h = 0.051 * safezoneH;
		};
		class confirmButton: RscButton
		{
			idc = 1604;
			action = "call pan_fnc_tp_main";

			text = "Confirm"; //--- ToDo: Localize;
			x = 0.476094 * safezoneW + safezoneX;
			y = 0.789 * safezoneH + safezoneY;
			w = 0.0717187 * safezoneW;
			h = 0.051 * safezoneH;
		};
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT END
		////////////////////////////////////////////////////////
  };
};