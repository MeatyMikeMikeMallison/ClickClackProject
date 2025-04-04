// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function unselect(SelectedGuy)
{
	if (SelectedGuy != noone)
		{
			with (SelectedGuy)
			{
				HighlightHex(0,Movement,Range,Team);
				InfoCheck = false;
				Selected = false;
			}
		SelectedGuy = noone;
		}
	return SelectedGuy;
}