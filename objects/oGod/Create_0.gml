selected_guy = 0;
cutscene = 0;

TurnCount = 1;
enum TurnOrder
{
	Player,
	Enemy
}

CurrentTurn = TurnOrder.Player;

enum Conclusion
{
	none,
	victory,
	defeat
}

TheBattleIs = Conclusion.none