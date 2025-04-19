/// @Stop the animation if it shouldn't loop
if (SpriteLoop == false)
{
	image_speed = 0;
	CurrentSprite = sprite_index;
}
else image_speed = 1;