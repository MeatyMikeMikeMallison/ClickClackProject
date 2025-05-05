depth = 200-y-5;

if (Selected) sprite_index = BaseSprite_Sellected;
else
{
	sprite_index = BaseSprite;
	SoundSelected = false;
}

if (!SoundSelected && Selected)
{
	audio_play_sound(snConfirmSelect,0,false,0.1);
	SoundSelected = true;
}

if (collision_point(x,y,oHexTest,true,false).HexSelection == sHexagon_Grass_Damage) InRange = true;
else InRange = false;

if (OldX != x)
{
	if (OldX > x) image_xscale = -1;
	if (OldX < x) image_xscale = 1;
	OldX = x;
}
