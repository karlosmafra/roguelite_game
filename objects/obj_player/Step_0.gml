script_execute(state)

// Morrer
if hp <= 0
{
	scr_end_run()
}

#region Shoot

if instance_exists(my_weapon)
{
	with my_weapon
	{
		dir = point_direction(x, y, mouse_x, mouse_y)
		
		var _mb = -1
		if weapon.auto { _mb = mouse_check_button(mb_left) } 
		else		   { _mb = mouse_check_button_pressed(mb_left) }
		
		if _mb
		{
			shoot()
		}
	}
}

#endregion

#region Switch Weapon

if keyboard_check_pressed(vk_tab)
{
	current_weapon++
	if current_weapon >= array_length(weapons)
	{
		current_weapon = 0
	}
	if current_weapon < 0
	{
		current_weapon = array_length(weapons) - 1
	}
	scr_change_weapon(my_weapon, weapons[current_weapon])
}

#endregion

#region Pick Weapon

if keyboard_check_pressed(ord("E")) 
{
	if distance_to_object(obj_pickup) < 8
	{
		var _obj = instance_nearest(x, y, obj_pickup)
		if _obj.object_index == obj_weapon_dropped
		{
			scr_pick_weapon(_obj)
		}
		else if _obj.object_index == obj_item
		{
			scr_pick_item(_obj)
		}
	}
}

#endregion
