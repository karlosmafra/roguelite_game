function scr_enemy_idle(){
	
	// Verificar se o inimigo tem visão do player
	var _line = collision_line(x, y, obj_player.x, obj_player.y, obj_block, 0, 0)

	if distance_to_object(obj_player) <= agg_range && !_line
	{
		state = scr_enemy_pursuit
	}

}

function scr_enemy_pursuit(){

	// Perseguir
	var _x1 = x
	var _y1 = y
	var _x2 = obj_player.x div 32 * 32 + 16 // O destino é sempre o meio de uma célula da grid
	var _y2 = obj_player.y div 32 * 32 + 24

	if mp_grid_path(obj_map_generator.mp_grid, path, _x1, _y1, _x2, _y2, true)
	{
		path_start(path, spd, path_action_stop, false)
	}
	
	// Ataca enquanto persegue
	scr_enemy_attack()
	
	// Para de andar e apenas ataca
	if distance_to_object(obj_player) <= (atk_range / 2)
	{
		state = scr_enemy_close_in
		path_end()
	}
	
	// Desiste de seguir se estiver muito longe
	if distance_to_object(obj_player) > (agg_range * 2)
	{
		state = scr_enemy_idle
		path_end()
	}
	
}

function scr_enemy_close_in() {
	
	scr_enemy_attack()
	
	// Girar ao redor do player
	var _x1 = x
	var _y1 = y
	var _x2 = obj_player.x + lengthdir_x(atk_range/2, dir)
	var _y2 = obj_player.y + lengthdir_y(atk_range/2, dir)

	if mp_grid_path(obj_map_generator.mp_grid, path, _x1, _y1, _x2, _y2, true)
	{
		path_start(path, spd, path_action_stop, false)
	}
	else
	{
		clockwise *= -1
	}
	dir += clockwise
	if dir >= 360 {dir = 0}
	if dir < 0 {dir = 359}
	
	// Voltar a perseguir se o player se afastar
	if distance_to_object(obj_player) > (atk_range)
	{
		state = scr_enemy_pursuit
	}
	
}

function scr_enemy_attack(){
	
	if instance_exists(my_weapon)
	{
		with my_weapon
		{
			dir = point_direction(x, y, obj_player.x, obj_player.y)
			shoot()
		}
	}
	
}