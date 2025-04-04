// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function HighlightHex(Highlight,Movement,Range,Team)
{
	show_debug_message("HexGate");
	if (Highlight == 0)
	{
		with (oHexTest)
		{
			HexSelection = sHexagon_Test;
			HexHighlightSellect = false;
		}
		show_debug_message("breakout");
		exit;
	}
	instance_create_layer(x,y,"Instances_1",oHexaTester);
	var loops = 0;
	repeat (Movement+Range)
	{
		loops++;
		with(oHexaTester)
		{
			var _list = ds_list_create();
			var _num = instance_place_list(x, y, oHexTest, _list, false);
			if (_num > 0)
			{
				for (var i = 0; i < _num; ++i;)
				{
					with(_list[| i])
					{
						if (!HexHighlightSellect)
						{
							switch (Highlight)
							{
								case 2: 
									if (!place_meeting(x,y,pUnit))
									{
										HexSelection = sHexagon_Test_Sellect;
										instance_create_layer(x,y,"Instances_1",oHexaTester);
									}
								break;
								case 1:
									if (HexSelection != sHexagon_Test_Sellect)
									{
										HexSelection = sHexagon_Test_Damage;
										instance_create_layer(x,y,"Instances_1",oHexaTester);
									}
								break;
								case 0:
									HexSelection = sHexagon_Test;
									instance_create_layer(x,y,"Instances_1",oHexaTester);
								break;
							}
							HexHighlightSellect = true;
						}
					}
				}
			}
			ds_list_destroy(_list);
		}
		if (Highlight == 2)
		{
			if (loops == Movement) Highlight = 1;
		}
	}
	with (oHexTest) HexHighlightSellect = false;
	instance_destroy(oHexaTester);
	if (Highlight != 0 && !HasMoved) collision_point(x,y,oHexTest,false,true).HexSelection = sHexagon_Test_Sellect;
}