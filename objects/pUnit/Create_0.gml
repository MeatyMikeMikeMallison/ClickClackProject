/// @description Sets up the Varablies 
Selected = false; //if I am selected
SoundSelected = false;
HasMoved = false; //if I have moved
HasAttacked = false; // if I have attacked
InRange = false; // if I am in range
InfoCheck = false;
sprite_index = BaseSprite;
PortCheck = 0;
Health = MaxHealth;

InfoBase = 100;
//InfoBase = 1092;

//fully xscale manover
OldX = x;

image_index = random_range(0,image_number);