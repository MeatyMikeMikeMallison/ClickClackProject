if (CurrentTurn == 0) // Player turn
{
	if mouse_check_button_pressed(mb_left) 
	{
		if (collision_point(mouse_x, mouse_y, pUnit, true, false)) //Sellecting guy
		{
			if (selected_guy != 0 && selected_guy.Team != (collision_point(mouse_x, mouse_y, pUnit, true, false)).Team && selected_guy.Team == CurrentTurn && (collision_point(mouse_x, mouse_y, pUnit, true, false)).InRange == true && selected_guy.HasMoved && !selected_guy.HasAttacked)
			//Checks to see if 1) you've already selected a unit, 2) you're selecting an enemy, 3) that enemy is in range
			{
				with (selected_guy)
				{
					HasAttacked = true;
					Battle(self, collision_point(mouse_x, mouse_y, pUnit, true, false));
				}
			}
			else if (selected_guy != 0 && collision_point(mouse_x, mouse_y, pUnit, true, false).Selected)
			{
				with (selected_guy)
				{
					HighlightHex(0,Movement,Range,Team);
					InfoCheck = true;
				}
			}
			else
			{
				selected_guy = unselect(selected_guy);
				selected_guy = collision_point(mouse_x, mouse_y, pUnit, true, false);
				with (selected_guy)
				{
					Selected = true;
					if (!HasMoved) HighlightHex(2,Movement,Range,Team);
					else if (!HasAttacked) HighlightHex(1,0,Range,Team);
				}
			}
		}
		else if (collision_point(mouse_x, mouse_y, oHexTest, true, false) && selected_guy != 0) //Moving guy to Hex
		{
			var obj = collision_point(mouse_x, mouse_y, oHexTest, true, false);
			with (selected_guy)
			{
				if (!place_meeting(obj.x,obj.y,pUnit))
				{
					if ((!HasMoved)  && obj.HexSelection == sHexagon_Test_Sellect && Team == other.CurrentTurn)
					{
						HighlightHex(0,Movement,Range,Team);
						x = obj.x;
						y = obj.y;
						HasMoved = true;
					}
					HighlightHex(0,Movement,Range,Team);
					Selected = false;
					other.selected_guy = 0;
				}
			}
		
		}
		else selected_guy = unselect(selected_guy); // Unsellect guy
	}
}
else if (CurrentTurn == 1) // Enemy turn
{
	var _list = ds_list_create();
	var _num = collision_rectangle_list(0,0,room_width,room_height,oEnemyUnit,true,true,_list,true);

	if (_num > 0)
	{
	    for (var i = 0; i < _num; ++i;)
	    {
			with(_list[| i])
			{
				show_debug_message("enemyTurn");
				EnemyAction(self);
			}
	    }
	}
	ds_list_destroy(_list);
	nextTurn();
}

if mouse_check_button_pressed(mb_right) //next turn
{
	selected_guy = unselect(selected_guy);
	nextTurn();
}

depth = -y;

