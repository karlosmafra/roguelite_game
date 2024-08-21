function scr_start_run() {

	with obj_player
	{
		weapons = [3]
		current_weapon = 0
		scr_change_weapon(my_weapon, weapons[current_weapon])
	}
	global.level = 1
	
}

function scr_end_run(){
	
	global.coins = 0
	with obj_player
	{
		hp = max_hp
		weapons = [0]
		current_weapon = 0
		scr_change_weapon(my_weapon, weapons[current_weapon])
		x = 352
		y = 208
	}
	room_goto(rm_lobby)
	global.level = 0
	
}

function scr_next_room(){
	
	with obj_player
	{
		x = 1312
		y = 690
	}
	room_restart()
	global.level++
	
}