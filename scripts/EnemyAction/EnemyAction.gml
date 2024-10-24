// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function EnemyAction()
{
	repeat (Movement)
	{
		instance_create_layer(x,y,"Instances_1",oHexaTester);
		with(oHexaTester)
		{
			var _list = ds_list_create();
			var _TempList = ds_list_create();
			var _num = instance_place_list(x,y,oHexTest,_list,true);
			if (_num > 0)
			{
				for (var i = 0; i < _num; ++i;)
				{
					with (_list[| i])
					{
						if !place_meeting(x,y,pUnit) 
						{
							ds_list_add(_TempList, self);
						}
					}
				}
			}
			if (ds_list_size(_TempList) > 0)
			{
				ds_list_shuffle(_TempList);
				var obj = _TempList[| 0];
				other.x = obj.x;
				other.y = obj.y;
				ds_list_destroy(_list);
				ds_list_destroy(_TempList);
			}
		}
		instance_destroy(oHexaTester);
	}
}