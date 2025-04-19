// Var Set Up
selected_guy = noone;
cutscene = 0;
PlayerBattle = false;

//Turn Count
TurnCount = 1;
enum TurnOrder
{
	Player,
	Enemy
}

CurrentTurn = TurnOrder.Player;
//Winning Or Losing
enum BattleStatus
{
	Victory,
	Defeat,
	Going
}

BattleCondition = BattleStatus.Going;

//Enemy Fixing
Enemy_Number_Max = instance_number(pEnemyUnit);
Enemy_Number = Enemy_Number_Max;
Enemy_Move = true;

//show_debug_log(true);
show_debug_message(Enemy_Number_Max);

//Battle Vars
//Attacker
Attack_IdleActorSprite = noone;
Attack_ActionActorSprite = noone;
Attack_HitActorSprite = noone;
Attack_WalkActorSprite = noone;
Attack_DieActorSprite = noone;
//Defense
Defense_IdleActorSprite = noone;
Defense_ActionActorSprite = noone;
Defense_HitActorSprite = noone;
Defense_WalkActorSprite = noone;
Defense__DieActorSprite = noone;