/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (!object_exists(oGod)) exit;
if (oGod.CurrentTurn == 0) InfoBase = browser_width-478;
if (oGod.CurrentTurn == 1) InfoBase = 100;