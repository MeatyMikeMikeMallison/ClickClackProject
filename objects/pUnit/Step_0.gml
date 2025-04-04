depth = 200-y-5;

if (Selected) sprite_index = BaseSprite_Sellected;
else sprite_index = BaseSprite;

if (HasAttacked) image_index = 2;
else if (HasMoved) image_index = 1;
else image_index = 0;



if (collision_point(x,y,oHexTest,true,false).HexSelection == sHexagon_Test_Damage) InRange = true;
else InRange = false;

if (!Selected) InfoCheck = false;