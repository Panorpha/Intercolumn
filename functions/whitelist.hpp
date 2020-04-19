/*
  Author: Panorpha
  Last Modified: 2020.04.01 13.09
  Email: Panorpha91@gmail.com

  Notes:

  Description:

  To Do:

*/

  class CfgRemoteExec
{
       class Functions
       {
               mode = 1;
               // Ability to send jip messages: 0-disabled, 1-enabled (default)
               jip = 1;
               /*your functions here*/
               class pan_fnc_jetSpawnInit
               {
                      allowedTargets=0; // can target anyone (default)
                      jip = 0; // sending jip messages is disabled for this function (overrides settings in the Functions class)
               };
               class pan_fnc_jetNotification
               {
                  allowedTargets = 0;
                  jip = 0;
               };
       };
};