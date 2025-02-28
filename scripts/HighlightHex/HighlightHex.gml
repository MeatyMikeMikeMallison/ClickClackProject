// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function HighlightHex(Highlight,Movement,Range,Team)
{
	if (Highlight == 0)
	{
		oHexTest.HexSelection = sHexagon_Test;
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
								if ((Team == 0 && !place_meeting(x,y,pPlayerUnit)) || (Team == 1 && !place_meeting(x,y,pEnemyUnit)))
								{
									HexSelection = sHexagon_Test_Damage;
									instance_create_layer(x,y,"Instances_1",oHexaTester);
								}
							}
							break;
							case 0:
							HexSelection = sHexagon_Test;
							instance_create_layer(x,y,"Instances_1",oHexaTester);
							break
							
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
	instance_destroy(oHexaTester);
	if (Highlight != 0 && !HasMoved) collision_point(x,y,oHexTest,false,true).HexSelection = sHexagon_Test_Sellect;
}