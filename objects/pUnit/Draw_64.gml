/// @description Debug and Info
//if Selected draw_sprite_ext(sHexagonTest,0,x,y,Movement,Movement,0,c_white,1);

if (InfoCheck)
{
	draw_sprite(sInfoSquare,0,0,0);
	draw_text(InfoBase-50,InfoBase,"Max Hp:" + string(MaxHealth));
	draw_text(InfoBase+100,InfoBase,"Hp:" + string(Health));
	draw_text(InfoBase-50,InfoBase+50,"Speed:" + string(Movement));
	draw_text(InfoBase+100,InfoBase+50,"Range:" + string(Range));
	draw_text(InfoBase-50,InfoBase+100,"Attack:" + string(Attack));
	draw_text(InfoBase+100,InfoBase+100,"Armor:" + string(Defense));
	draw_text(InfoBase,InfoBase-50,"Unit Type:" + UnitType);
}
