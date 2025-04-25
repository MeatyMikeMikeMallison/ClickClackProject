if (oGod.Confirm_End_Turn == false)
{
	instance_create_layer(x,y,"Instances",oEndTurn);
	instance_destroy();
}