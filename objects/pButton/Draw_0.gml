
draw_self();

//draw shadow
color = c_black;
draw_sprite_ext(sprite_index,image_index,x+5,y+5,image_xscale,image_yscale,0,color,.5);

//draw sprite
color = c_white;
draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,0,color,1);