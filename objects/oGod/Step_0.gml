if (CurrentTurn == 0) // Player turn
{
	if mouse_check_button_pressed(mb_left) 
	{
		if (collision_point(mouse_x, mouse_y, pUnit, true, false)) //Sellecting guy
		{
			selected_guy = unselect(selected_guy);
			selected_guy = collision_point(mouse_x, mouse_y, pUnit, true, false);
			with (selected_guy)
			{
				Selected = true;
				if (!HasMoved) HighlightHex(2,Movement,Range);
				else if (!HasAttacked) HighlightHex(1,0,Range);
			}
		}
		else if (collision_point(mouse_x, mouse_y, oHexTest, true, false) && selected_guy != 0)
		{
			var obj = collision_point(mouse_x, mouse_y, oHexTest, true, false);
			with (selected_guy)
			{
				if (!place_meeting(obj.x,obj.y,pUnit))
				{
					if ((!HasMoved)  && obj.HexSelection == sHexagon_Test_Sellect && Team == other.CurrentTurn)
					{
						HighlightHex(0,Movement,Range);
						x = obj.x;
						y = obj.y;
						HasMoved = true;
					}
					HighlightHex(0,Movement,Range);
					Selected = false;
					other.selected_guy = 0;
				}
			}
		
	    }
		else if (collision_point(mouse_x, mouse_y, oSmartFella, true, false) && selected_guy != 0)
		{
			
		}
		else selected_guy = unselect(selected_guy);
	}
}
else if (CurrentTurn == 1)
{
	var _list = ds_list_create();
	var _num = collision_rectangle_list(0,0,room_width,room_height,oSmartFella,true,true,_list,true);

	if (_num > 0)
	{
	    for (var i = 0; i < _num; ++i;)
	    {
	        with(_list[| i])
			{
				EnemyAction();
			}
	    }
	}
	ds_list_destroy(_list);
	nextTurn();
}

if mouse_check_button_pressed(mb_right)
{
	selected_guy = unselect(selected_guy);
	nextTurn();
}
depth = -y;