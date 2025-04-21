switch (BattleCondition)
{
	case BattleStatus.Victory:
		draw_sprite(sVictory,0,200,300);
		break;
	case BattleStatus.Defeat:
		draw_sprite(sDefeat,0,200,300);
		break;
	case BattleStatus.Going:
		break;
}

//draw_text(room_width-100,100,string(TurnCount));
//draw_text(room_width-100,200,string(CurrentTurn));
draw_text(room_width-100,500,string(numberSelected));
/*draw_text(100,300,string(selected_guy));