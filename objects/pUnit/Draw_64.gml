/// @description Debug and Info
//if Selected draw_sprite_ext(sHexagonTest,0,x,y,Movement,Movement,0,c_white,1);

if (InfoCheck)
{
	draw_sprite(sInfoSquare,0,x,y);
	draw_text(x,y,"Max Hp:" + string(MaxHealth));
	draw_text(x+50,y,"Hp:" + string(Health));
	draw_text(x,y+50,"Speed:" + string(Movement));
	draw_text(x+50,y+50,"Range:" + string(Range));
	draw_text(x,y+100,"Attack:" + string(Attack));
	draw_text(x+50,y+100,"Armor:" + string(Defense));
	draw_text(x,y-100,"Unit Type:" + UnitType);
}
