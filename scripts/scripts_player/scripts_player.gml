function scr_collision() {

	if place_meeting(x + hspd, y, obj_block)
	{
		while !place_meeting(x + sign(hspd), y, obj_block)
		{
			x += sign(hspd)
		}
		hspd = 0
	}

	if place_meeting(x, y + vspd, obj_block)
	{
		while !place_meeting(x, y + sign(vspd), obj_block)
		{
			y += sign(vspd)
		}
		vspd = 0
	}

	x += hspd
	y += vspd
	
}

function scr_player_walking(){
	
	scr_collision()

	// Inputs
	var _up = keyboard_check(ord("W"))
	var _down = keyboard_check(ord("S"))
	var _left = keyboard_check(ord("A"))
	var _right = keyboard_check(ord("D"))
	var _dash = mouse_check_button_pressed(mb_right)

	// Variáveis de movimento
	var _hmove = _right - _left
	var _vmove = _down - _up
	var _moving = _hmove != 0 || _vmove != 0
	if _moving
	{
		move_dir = point_direction(x, y, x + _hmove, y + _vmove)
	}

	hspd = lengthdir_x(spd * _moving, move_dir)
	vspd = lengthdir_y(spd * _moving, move_dir)
	
	#region Troca de sprite
	if _moving
	{
		switch floor((move_dir+45)/90)
		{
			case 1:
				sprite_index = spr_player_run_up
			break
			case 2:
				sprite_index = spr_player_run_left
			break
			case 3:
				sprite_index = spr_player_run_down
			break
			default:
				sprite_index = spr_player_run_right
			break
		}
	}
	else
	{
		switch floor((move_dir+45)/90)
		{
			case 1:
				sprite_index = spr_player_idle_up
			break
			case 2:
				sprite_index = spr_player_idle_left
			break
			case 3:
				sprite_index = spr_player_idle_down
			break
			default:
				sprite_index = spr_player_idle_right
			break
		}
	}
	#endregion
	
	// Dash
	dash_cd--
	
	if _dash && _moving && dash_cd <= 0
	{
		state = scr_player_dash
		dash_cd = 30
		vulnerable = false
		alarm[0] = 20
	}

}

function scr_player_dash() {
	
	scr_collision()
	
	hspd = lengthdir_x(spd * 2, move_dir)
	vspd = lengthdir_y(spd * 2, move_dir)
	
	// Troca de sprite
	switch floor((move_dir+45)/90)
	{
		case 1:
			sprite_index = spr_player_roll_up
		break
		case 2:
			sprite_index = spr_player_roll_left
		break
		case 3:
			sprite_index = spr_player_roll_down
		break
		default:
			sprite_index = spr_player_roll_right
		break
	}
}
