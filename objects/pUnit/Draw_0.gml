if (HasAttacked)
{
	image_speed = 0.5;
	shader_set(shd_Done);
}
else if (HasMoved)
{
	image_speed = 1.5;
	shader_set(shd_Moved);
}
else image_speed = 1;
draw_self();
shader_reset();