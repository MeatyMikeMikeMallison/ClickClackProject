// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Battle(Attacker,Defender)
{
	show_debug_message("Battle");
	HighlightHex(0,Movement,Range,Team);

	with(Defender)
	{
		Health = Health - ((Attacker.Attack * 2)/Defense);
		if (Health > 0)
		{
			with (Attacker)
			{
				Health = Health - ((Defender.Attack * 2)/Defense);
				if (Health < 1)
				{
					instance_destroy();
				}
			}
		}
		else instance_destroy();
	}
	
	//animation
	oGod.cutscene = layer_sequence_create("AssetsBattle",room_width/2,room_height/2,Sequence1);
	
}