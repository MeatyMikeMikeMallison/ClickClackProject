// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function nextTurn()
{
	if (oGod.CurrentTurn+1 == 2)
	{
		oGod.CurrentTurn = 0;
	}
	else oGod.CurrentTurn++;
	oGod.numberSelected = 0;
	oGod.BattleButton = false;
	oGod.Confirm_End_Turn = false;
	
	if (oGod.CurrentTurn == 0)
	{
		with (pPlayerUnit) InfoBase = 100;
		with (pEnemyUnit ) InfoBase = browser_width-478;
	}
	else if (oGod.CurrentTurn == 1)
	{
		with (pPlayerUnit) InfoBase = browser_width-478;
		with (pEnemyUnit ) InfoBase = 100;
	}
	
	with (pUnit)
	{
		HasMoved = false;
		HasAttacked = false;
		Selected = false;
		InfoCheck = false;
		SecondInfo = false;
	}
	
	if (!instance_exists(pPlayerUnit)) BattleCondition = BattleStatus.Defeat;
	else if (!instance_exists(pEnemyUnit)) BattleCondition = BattleStatus.Victory;
	
	Enemy_Number_Max = instance_number(pEnemyUnit);
	Enemy_Number = Enemy_Number_Max;
	oGod.TurnCount++;
	show_debug_message(Enemy_Number_Max);
	show_debug_message("////////////////");
}