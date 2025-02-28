/// @description Debug and Info
//if Selected draw_sprite_ext(sHexagonTest,0,x,y,Movement,Movement,0,c_white,1);

if (InfoCheck)
{
	draw_sprite(sInfoSquare,0,x,y);
	draw_text(x,y,string(MaxHealth));
	draw_text(x+50,y,string(Health));
	draw_text(x,y+50,string(Movement));
	draw_text(x+50,y+50,string(Range));
	draw_text(x,y+100,string(Attack));
	draw_text(x+50,y+100,string(Defense));
	draw_text(x,y-100,UnitType);
}
