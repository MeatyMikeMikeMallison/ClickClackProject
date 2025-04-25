/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

oGod.Confirm_End_Turn = true;
instance_create_layer(x,y,"Instances",oConfirmEndTurn);
instance_destroy();