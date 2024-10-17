// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function nextTurn()
{
	if (other.CurrentTurn+1 == 2)
	{
		other.CurrentTurn = 0;
	}
	else other.CurrentTurn++;
	
	with (pUnit)
	{
		HasMoved = false;
	}
	other.TurnCount++;
}