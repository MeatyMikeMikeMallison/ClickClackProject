
event_inherited();

//hides and unhides the text based on clicks 

if (instance_exists(obj_creditText))
{
instance_destroy(obj_creditText);	
}
else
{
	instance_create_layer(room_width / 2, room_height - 100, "Text", obj_creditText);
}
