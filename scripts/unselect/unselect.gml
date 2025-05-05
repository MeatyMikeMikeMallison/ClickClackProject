// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function unselect(SelectedGuy,OtherTeam)
{
	if (SelectedGuy != noone && OtherTeam != noone)
	{
		audio_play_sound(snCancleSel,0,false);
		
		if (OtherTeam.Team == SelectedGuy.Team)
		{
			with (pUnit) InfoCheck = false;
		}
		
		with (SelectedGuy)
		{
			HighlightHex(0,Movement,Range,Team);
			Selected = false;
		}
		
		oGod.BattleButton = false;
		oGod.Confirm_End_Turn = false;
		//show_debug_message("unselect");
		SelectedGuy = noone;
	}
	return SelectedGuy;
}