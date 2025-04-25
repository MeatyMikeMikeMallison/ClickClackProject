if (CurrentTurn == 0) // Player turn
{
	if (mouse_check_button_pressed(mb_left) && !PlayerBattle)
	{
		if (collision_point(mouse_x, mouse_y, pUnit, true, false)) //Sellecting guy
		{
			if (selected_guy != noone && selected_guy.Team != (collision_point(mouse_x, mouse_y, pUnit, true, false)).Team && selected_guy.Team == CurrentTurn && (collision_point(mouse_x, mouse_y, pUnit, true, false)).InRange == true && selected_guy.HasMoved && !selected_guy.HasAttacked)
			//Checks to see if 1) you've already selected a unit, 2) you're selecting an enemy, 3) that enemy is in range
			{
				with (selected_guy)
				{
					with (collision_point(mouse_x, mouse_y, pUnit, true, false))
					{
						InfoCheck = true;
						if(oGod.numberSelected == 1) SecondInfo = true;
					}
					oGod.BattleButton = true;
					oGod.PlayerBattle = true;
					with (instance_create_layer(room_width/2,room_height-200,"Instances_1",oFightButton))
					{
						AttackerButton = other;
						DefenderButton = collision_point(mouse_x, mouse_y, pUnit, true, false);
					}
				}
			}
			else
			{
				var Old_Selected_Guy = selected_guy;
				selected_guy = unselect(selected_guy,true);
				selected_guy = collision_point(mouse_x, mouse_y, pUnit, true, false);
				with (selected_guy)
				{
					InfoCheck = true;
					if(other.numberSelected == 1 && Old_Selected_Guy.Team != Team) SecondInfo = true;
					Selected = true;
					if (!HasMoved) HighlightHex(2,Movement,Range,Team);
					else if (!HasAttacked) HighlightHex(1,0,Range,Team);
				}
				numberSelected++;
			}
		}
		else if (collision_point(mouse_x, mouse_y, oHexTest, true, false) && selected_guy != noone) //Moving guy to Hex
		{
			var obj = collision_point(mouse_x, mouse_y, oHexTest, true, false);
			with (selected_guy)
			{
				if (!place_meeting(obj.x,obj.y,pUnit))
				{
					if ((!HasMoved)  && obj.HexSelection == sHexagon_Grass_Select && Team == other.CurrentTurn)
					{
						HighlightHex(0,Movement,Range,Team);
						x = obj.x;
						y = obj.y;
						HasMoved = true;
					}
				}
				HighlightHex(0,Movement,Range,Team);
				other.selected_guy = unselect(other.selected_guy,false);
				other.numberSelected = 0;
			}
		}
		else selected_guy = unselect(selected_guy,false); // Unsellect guy
	}
	else if (PlayerBattle && BattleButton)
	{
		if (mouse_check_button_pressed(mb_left) && !position_meeting(mouse_x,mouse_y,oFightButton))
		{
			PlayerBattle = false;
			BattleButton = false;
			selected_guy = unselect(selected_guy,false);
		}
	}
	
	/*if (mouse_check_button_pressed(mb_right) && !PlayerBattle)//next turn
	{
		selected_guy = unselect(selected_guy,false);
		switch (BattleCondition)
		{
			case BattleStatus.Victory:
				room_goto_next();
				break;
			case BattleStatus.Defeat:
				room_restart();
				break;
			case BattleStatus.Going:
				break;
		}
		nextTurn();
	}*/
}
else if (CurrentTurn == 1) // Enemy turn
{
	if (Enemy_Move)
	{
		if (!Enemy_Number == 0)
		{
			var _list = ds_list_create();
			var _num = collision_rectangle_list(0,0,room_width,room_height,pEnemyUnit,true,true,_list,true);
			if (_num > 0)
			{
				ds_list_shuffle(_list);
				if (!_list[| 0].HasMoved)
				{
					Enemy_Move = false;
					Enemy_Number--;
					with(_list[| 0])
					{
						show_debug_message("enemyTurn");
						EnemyAction(self);
						HasMoved = true;
					}
				}
			}
			ds_list_destroy(_list);
		}
		else
		{
			Enemy_Number = Enemy_Number_Max;
			nextTurn();
		}
	}
}


depth = -room_height-100;

