depth = 200-y-5;

if (Selected) sprite_index = BaseSprite_Sellected;
else sprite_index = BaseSprite;



if (collision_point(x,y,oHexTest,true,false).HexSelection == sHexagon_Grass_Damage) InRange = true;
else InRange = false;

if (OldX != x)
{
	if (OldX > x) image_xscale = -1;
	if (OldX < x) image_xscale = 1;
	OldX = x;
}
