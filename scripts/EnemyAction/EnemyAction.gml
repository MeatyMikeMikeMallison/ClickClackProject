// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function EnemyAction(Me)
{
	var Fight = false;
	var Target = 0;
	var _TargetFinalList = ds_list_create();// Possible Hexs to move to attack
	var _TargetHexList = ds_list_create(); // Hypothetical Hexs to move to attack
	var _TargetPlayerList = ds_list_create(); //Hexs that has player on it
	instance_create_layer(x,y,"Instances_1",oHexaTester); //Creates the HexTester which does the highlight stuff
	repeat (Movement + Range)
	{
		with(oHexaTester)
		{
			var _list = ds_list_create(); //Base list of Hexs
			var _num = instance_place_list(x,y,oHexTest,_list,true);
			if (_num > 0)
			{
				for (var i = 0; i < _num; ++i;)
				{
					with (_list[| i])
					{
						if place_meeting(x,y,oPlayerUnitMedium)
						{
							ds_list_add(_TargetPlayerList, self);
							
						}
						instance_create_layer(x,y,"Instances_1",oHexaTester);
					}
				}
			}
			ds_list_destroy(_list);
		}
	}
	if (ds_list_size(_TargetPlayerList) > 0)
	{
		instance_destroy(oHexaTester);
		ds_list_shuffle(_TargetPlayerList);
		Target = _TargetPlayerList[| 0]; //Chooses a random target
		instance_destroy(oHexaTester);
		instance_create_layer(Target.x,Target.y,"Instances_1",oHexaTester);
		ds_list_destroy(_TargetPlayerList);
		repeat (Me.Range) //begins to set hypothetical hexs to move
		{
			with(oHexaTester)
			{
				var _list = ds_list_create();
				var _num = instance_place_list(x,y,oHexTest,_list,true);
				if (_num > 0)
				{
					for (var i = 0; i < _num; ++i;)
					{
						with (_list[| i])
						{
							if !place_meeting(x,y,pUnit)
							{
								ds_list_add(_TargetHexList, self); //set Hyp Hexs
							}
							instance_create_layer(x,y,"Instances_1",oHexaTester);
						}
					}
				}
				ds_list_destroy(_list);
			}
		}
		instance_destroy(oHexaTester);
		if (ds_list_size(_TargetHexList) > 0)
		{
			show_debug_message("FoundFight")
			Fight = true;
			with (Target)
			{
				Target = collision_point(Target.x,Target.y,oPlayerUnitMedium,false,true);
			}
		}
	}
	if (Fight) 
	{
		var lockSize = ds_list_size(_TargetHexList);
		for (var i = 0; i < lockSize; ++i;)
		{
			with (_TargetHexList[| i])
			{
				instance_create_layer(x,y,"Instances_1",oHexaTester);
				repeat (Me.Movement)
				{
					with(oHexaTester)
					{
						var _list = ds_list_create();
						var _num = instance_place_list(x,y,oHexTest,_list,true);
						if (_num > 0)
						{
							for (var j = 0; j < _num; ++j;)
							{
								with (_list[| j])
								{
									if place_meeting(x,y,Me) ds_list_add(_TargetFinalList, _TargetHexList[| i]);
									else if !place_meeting(x,y,pUnit) instance_create_layer(x,y,"Instances_1",oHexaTester);
								}
							}
						}
						ds_list_destroy(_list);
					}
				}
				instance_destroy(oHexaTester);
			}
		}
		if (ds_list_size(_TargetFinalList) > 0)
		{
			ds_list_shuffle(_TargetFinalList);
			var obj = _TargetFinalList[| 0];
			Me.x = obj.x;
			Me.y = obj.y;
			Battle(Me,Target);
		}
	}
	else if (!Fight)
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
	if instance_exists(oHexaTester) instance_destroy(oHexaTester);
	ds_list_destroy(_TargetHexList);
	ds_list_destroy(_TargetPlayerList);
	ds_list_destroy(_TargetFinalList);
}