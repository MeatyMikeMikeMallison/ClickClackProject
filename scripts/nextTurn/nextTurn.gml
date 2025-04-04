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
		HasAttacked = false;
	}
	
	if (!instance_exists(pPlayerUnit)) BattleCondition = BattleStatus.Defeat;
	else if (!instance_exists(pEnemyUnit)) BattleCondition = BattleStatus.Victory;
	
	Enemy_Number_Max = instance_number(pEnemyUnit);
	Enemy_Number = Enemy_Number_Max;
	other.TurnCount++;
	show_debug_message(Enemy_Number_Max);
}