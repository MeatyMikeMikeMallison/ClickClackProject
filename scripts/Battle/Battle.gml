// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Battle(Attacker,Defender)
{
	show_debug_message("Battle");
	HighlightHex(0,Movement,Range,Team);
	
	/*BORDD // One Range Defender Dies
	BORAD // One Range Attacker Dies
	BORAH // One Range Attacker Hurts
	B2RDD // <2 Range Defender Dies 
	B2RDX // <2 Range Defender out of Range
	B2RAD // <2 Range Attacker Dies 
	B2RAH // <2 Range Attacker Hurts*/
	var Outcome = BATTLE_BASE_BORAH;
	var Death = "None";
	
	with(Defender)
	{
		Health = Health - (Attacker.Attack - Defense);
		if (Health > 0)
		{
			with (instance_create_layer(x,y,"Instances_1",oHexaTester))
			{
				image_xscale = Defender.Range;
				image_yscale = Defender.Range;
				if (place_meeting(x,y,Attacker))
				{
					with (Attacker)
					{
						Health = Health - (Defender.Attack - Defense);
						if (Health < 1)
						{
							if (Attacker.Range == 1)
							{
								Outcome = BORAD;
							}
							else Outcome = B2RAD;
							Death = "Attacker";
						}
						else
						{
							if (Attacker.Range == 2 && Defender.Range == 2)
							{
								Outcome = B2RAH;
							}
							else Outcome = BORAH;
						}
					}
				}
				else Outcome = B2RDX;
				instance_destroy();
			}
		}
		else 
		{
			if (Attacker.Range == 1)
			{
				Outcome = BORDD;
			}
			else Outcome = B2RDD;
			Death = "Defender";
		}
	}
	show_debug_message(string(Outcome));
	//animation
	with(oGod)
	{
		Attack_IdleActorSprite = Attacker.IdleSprite;
		Attack_ActionActorSprite = Attacker.ActionSprite;
		Attack_HitActorSprite = Attacker.HurtSprite;
		Attack_WalkActorSprite = Attacker.WalkSprite;
		Attack_DieActorSprite = Attacker.DieSprite;
		Attack_UnitTypeSprite = Attacker.UnitType;
		Defense_IdleActorSprite = Defender.IdleSprite;
		Defense_ActionActorSprite = Defender.ActionSprite;
		Defense_HitActorSprite = Defender.HurtSprite;
		Defense_WalkActorSprite = Defender.WalkSprite;
		Defense_DieActorSprite = Defender.DieSprite;
		Defense_UnitTypeSprite = Defender.UnitType;
		cutscene = layer_sequence_create("AssetsBattle",room_width/2,room_height/2,Outcome);
		//with (oGod) alarm_set(0,10);
	}
	show_debug_message("Done 1");
	
	if (Death != "None")
	{
		unselect(oGod.selected_guy,oGod.selected_guy);
		oGod.selected_guy = noone;
		if (Death == "Attacker") instance_destroy(Attacker);
		if (Death == "Defender") instance_destroy(Defender);
	}
}