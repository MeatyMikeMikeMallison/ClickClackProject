depth = -y-5;

if (Selected) sprite_index = BaseSprite_Sellected;
else sprite_index = BaseSprite;

if (HasAttacked) image_index = 2;
else if (HasMoved) image_index = 1;
else image_index = 0;