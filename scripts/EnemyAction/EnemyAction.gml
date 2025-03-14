function EnemyAction(Me)
{
	var Fight = false;
	var Target = 0;
	var _TargetFinalList = ds_list_create();// Possible Hexs to move to attack
	var _TargetHexList = ds_list_create(); // Hypothetical Hexs to move to attack
	var _TargetPlayerList = ds_list_create(); //Hexs that has player on it

	//Find all hexes that have a player unit on them
	FindPlayerHexes(Me, _TargetPlayerList);
	
	//If any player unit exists...
	if (ds_list_size(_TargetPlayerList) > 0)
	{
		//Choose one as a target
		Target = SelectTarget(_TargetPlayerList)
		
		//Generate hypothetical hexes to the target
		GenerateHypotheticalHexes(Me, _TargetHexList);
		
		//If there are candidate hexes for fighting
		if (ds_list_size(_TargetHexList) > 0)
		{
			with (oHexTest) EnemySellect = false;
			Fight = true;
			//Adjust to the target
			Target = collision_point(Target.x,Target.y,pPlayerUnit,false,true);
		}
	}
	
	//If battle is possible
	if (Fight) 
	{
		// Compute the final movement hexes
		ComputeFinalMovementHexes(Me, _TargetHexList, _TargetFinalList);
		
		if (ds_list_size(_TargetFinalList) > 0)
		{
			ds_list_shuffle(_TargetFinalList);
			var obj = _TargetFinalList[| 0];
			Me.x = obj.x;
			Me.y = obj.y;
			Battle(Me,Target);
		}
	}
	
	//If fighting isn't possible then retreat
	else if (!Fight)
	{
		Retreat(Me);
	}
	
	//Cleanup
	with (oHexTest) EnemySellect = false;
	if instance_exists(oHexaTester) instance_destroy(oHexaTester);
	ds_list_destroy(_TargetHexList);
	ds_list_destroy(_TargetPlayerList);
	ds_list_destroy(_TargetFinalList);
}

function FindPlayerHexes(Me, targetPlayerList)
{
	instance_create_layer(x,y,"Instances_1",oHexaTester); //Creates the HexTester which does the highlight stuff
	
	repeat (Me.Movement + Me.Range)
	{
		with(oHexaTester)
		{
            var _list = ds_list_create(); //Base list of Hexs
			
			var _num = instance_place_list(x,y,oHexTest,_list,true);
			if (_num > 0)
			{
				for (var i = 0; i < _num; ++i;)
				{
					var hexInstance = _list[| i];
					
					with (hexInstance)
					{
						if (!EnemySellect)
						{
							EnemySellect = true;
							if place_meeting(x,y,pPlayerUnit)
							{
								ds_list_add(targetPlayerList, self);
							
							}
							instance_create_layer(hexInstance.x,hexInstance.y,"Instances_1",oHexaTester);
						}
					}

				}
			}
			//show_debug_message("Hex Instances: " + string (instance_number(oHexaTester)));
			ds_list_destroy(_list);
		}
	}
}

function SelectTarget (targetPlayerList)
{
	with (oHexTest) EnemySellect = false;
	instance_destroy(oHexaTester);
	ds_list_shuffle(targetPlayerList);
	var target = targetPlayerList[| 0]; //Chooses a random target
	instance_destroy(oHexaTester);
	instance_create_layer(target.x,target.y,"Instances_1",oHexaTester);
	ds_list_destroy(targetPlayerList);
	return target;
}

function GenerateHypotheticalHexes (Me, targetHexList)
{
	repeat (Me.Range) //begins to set hypothetical hexs to move
	{
		with(oHexaTester)
		{
			var _list = ds_list_create();
			var _num = instance_place_list(x, y, oHexTest, _list, true);
			if (_num > 0)
			{
				for (var i = 0; i < _num; ++i;)
				{
					with (_list[| i])
					{
						if (!EnemySellect)
						{
							EnemySellect = true;
							if !place_meeting(x,y,pUnit)
							{
								ds_list_add(targetHexList, self); //set Hyp Hexs
								show_debug_message("Found Possible Areas");
							}
							instance_create_layer(x,y,"Instances_1",oHexaTester);
						}
					}
				}
			}
			ds_list_destroy(_list);
		}
	}
	instance_destroy(oHexaTester);
}

function ComputeFinalMovementHexes (Me, targetHexList, targetFinalList)
{
	var lockSize = ds_list_size(targetHexList);
	for (var i = 0; i < lockSize; ++i;)
	{
		with (targetHexList[| i])
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
						for (var j = 0; j < _num; ++j)
						{
							var hexInstance = _list[| j];
							
							with (hexInstance)
							{
								if (!EnemySellect)
								{
									EnemySellect = true;
									if (place_meeting(x,y,Me))
									{
										ds_list_add(targetFinalList, targetHexList[| i]);
									}
									else if (!place_meeting(x,y,pUnit)) //and !instance_place(x,y,oHexaTester))
									{
										instance_create_layer(x,y,"Instances_1",oHexaTester);
									}
								}
							}
						}
						show_debug_message("Hex Instances: " + string (instance_number(oHexaTester)));
					}
					ds_list_destroy(_list);
				}
			}
			instance_destroy(oHexaTester);
			with (oHexTest) EnemySellect = false;
		}
	}
}

function Retreat (Me)
{
	repeat (Me.Movement)
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