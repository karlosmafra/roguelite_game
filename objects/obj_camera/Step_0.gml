if instance_exists(target)
{
	x = lerp(x, target.x - cw/2, spd)
	y = lerp(y, target.y - ch/2, spd)
	
	x = clamp(x, 0, room_width - cw)
	y = clamp(y, 0, room_height - ch)
	
	camera_set_view_pos(view_camera[0], x, y)
}
else
{
	target = -1
}