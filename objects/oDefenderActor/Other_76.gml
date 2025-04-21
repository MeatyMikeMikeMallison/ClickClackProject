if event_data[? "event_type"] == "sequence event" // or you can check "sprite event"
{
    switch (event_data[? "message"])
    {
        case string("DefenseIdle"):
            sprite_index = IdleActorSprite;
			SpriteLoop = true;
        break;
		case string("DefenseWalk"):
            sprite_index = WalkActorSprite;
			SpriteLoop = true;
        break;
		case string("DefenseAction"):
            sprite_index = ActionActorSprite;
			SpriteLoop = false;
        break;
		case string("DefenseHurt"):
            sprite_index = HitActorSprite;
			SpriteLoop = false;
        break;
		case string("DefenseDie"):
            sprite_index = DieActorSprite;
			SpriteLoop = false;
        break;
    }
}