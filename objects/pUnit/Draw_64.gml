/// @description Debug and Info
//if Selected draw_sprite_ext(sHexagonTest,0,x,y,Movement,Movement,0,c_white,1);
if (SecondInfo) InfoBase = 1092;
else InfoBase = 100;

if (InfoCheck)
{
	draw_set_font(fnt_Basic);
	draw_sprite(sInfoSquare,0,InfoBase-100,0);
	draw_sprite_ext(PortaitSprite,0,InfoBase+10,115,(sign(InfoBase-1091))*0.5,0.5,0,-1,1);
	draw_text(InfoBase+110,100,"Hp:" + string(Health)+"/"+string(MaxHealth));
	draw_text(InfoBase+110,130,"Speed:" + string(Movement));
	draw_text(InfoBase+110,155,"Range:" + string(Range));
	draw_text(InfoBase-50,200,"Attack:" + string(Attack));
	draw_text(InfoBase+70,200,"Armor:" + string(Defense));
	draw_text(InfoBase+110,40,"Unit Type:\n" + UnitType);
}
