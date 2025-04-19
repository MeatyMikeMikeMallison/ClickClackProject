if event_data[? "event_type"] == "sequence event" // or you can check "sprite event"
{
    switch (event_data[? "message"])
    {
        case string(ActorType+"Idle"):
            sprite_index = IdleActorSprite;
			SpriteLoop = true;
        break;
		case string(ActorType+"Walk"):
            sprite_index = WalkActorSprite;
			SpriteLoop = true;
        break;
		case string(ActorType+"Action"):
            sprite_index = ActionActorSprite;
			SpriteLoop = false;
        break;
		case string(ActorType+"Hurt"):
            sprite_index = HitActorSprite;
			SpriteLoop = false;
        break;
		case string(ActorType+"Die"):
            sprite_index = DieActorSprite;
			SpriteLoop = false;
        break;
    }
}