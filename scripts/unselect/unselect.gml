// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function unselect(SelectedGuy,SecondGuy)
{
	if (SelectedGuy != noone)
		{
			with (SelectedGuy)
			{
				HighlightHex(0,Movement,Range,Team);
				Selected = false;
			}
			if (!SecondGuy || oGod.numberSelected > 1)
			{
				with (pUnit)
				{
					InfoCheck = false;
					SecondInfo = false;
				}
				numberSelected = 0;
			}
		oGod.BattleButton = false;
		oGod.Confirm_End_Turn = false;
		SelectedGuy = noone;
		//show_debug_message("unselect");
		}
	return SelectedGuy;
}