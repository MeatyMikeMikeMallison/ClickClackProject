selected_guy = 0;
cutscene = 0;
PlayerBattle = false;

TurnCount = 1;
enum TurnOrder
{
	Player,
	Enemy
}

CurrentTurn = TurnOrder.Player;

enum BattleStatus
{
	Victory,
	Defeat,
	Going
}

BattleCondition = BattleStatus.Going;


Enemy_Number_Max = instance_number(pEnemyUnit);
Enemy_Number = Enemy_Number_Max;
Enemy_Move = true;

show_debug_message(Enemy_Number_Max);