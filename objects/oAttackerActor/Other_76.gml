if event_data[? "event_type"] == "sequence event" // or you can check "sprite event"
{
    switch (event_data[? "message"])
    {
		case string("AttackIdle"):
            sprite_index = IdleActorSprite;
			SpriteLoop = true;
        break;
		case string("AttackWalk"):
            sprite_index = WalkActorSprite;
			SpriteLoop = true;
        break;
		case string("AttackAction"):
            sprite_index = ActionActorSprite;
			SpriteLoop = false;
			if (UnitTypeSprite == "Light") audio_play_sound(snLightAttack,0,false);
			if (UnitTypeSprite == "Medium") audio_play_sound(snMediumAttack,0,false);
			if (UnitTypeSprite == "Heavy") audio_play_sound(snHeavyAttack,0,false);
        break;
		case string("AttackHurt"):
            sprite_index = HitActorSprite;
			SpriteLoop = false;
        break;
		case string("AttackDie"):
            sprite_index = DieActorSprite;
			SpriteLoop = false;
			audio_play_sound(snUnitDeath,0,false);
        break;
    }
}