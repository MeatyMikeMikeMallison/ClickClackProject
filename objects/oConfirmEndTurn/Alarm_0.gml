/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

with (oGod)
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
}
instance_create_layer(x,y,"Instances",oEndTurn);
instance_destroy();