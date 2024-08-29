if instance_exists(parent_id)
{
	
	x = parent_id.x
	y = parent_id.y
	
	xx = x + lengthdir_x(8, dir)
	yy = y + lengthdir_y(8, dir)
	
}
else
{
	instance_destroy()
}