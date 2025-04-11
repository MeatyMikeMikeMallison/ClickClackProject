if event_data[? "event_type"] == "sequence event" // or you can check "sprite event"
{
    switch (event_data[? "message"])
    {
        case string(ActorType+"Idle"):
            sprite_index = IdleActorSprite;
        break;
		case string(ActorType+"Walk"):
            sprite_index = WalkActorSprite;
        break;
		case string(ActorType+"Action"):
            sprite_index = ActionActorSprite;
        break;
		case string(ActorType+"Hurt"):
            sprite_index = HitActorSprite;
        break;
    }
}