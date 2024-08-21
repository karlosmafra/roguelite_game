function scr_change_weapon(_weapon_id, _weapon_num) {

	_weapon_id.weapon_num = _weapon_num

	if _weapon_id.parent_id.object_index == obj_player
	{
		_weapon_id.weapon = global.weapon_list[_weapon_num]
	}
	else
	{
		_weapon_id.weapon = global.enemy_weapon_list[_weapon_num]
	}
	
}
	
function scr_pick_weapon(_w) {
	
	if  global.coins >= _w.price
	{
		// Se ainda puder pegar mais uma arma
		if array_length(weapons) < max_weapons 
		{
			array_push(weapons, _w.weapon_num)
			current_weapon = array_length(weapons) - 1
		}
		// Se estiver com o máximo de armas, dropa a que está segurando e pega a nova
		else
		{
			instance_create_layer(x, y, "Instances", obj_weapon_dropped, {weapon_num: weapons[current_weapon]})
			weapons[current_weapon] = _w.weapon_num
		}
		scr_change_weapon(my_weapon, _w.weapon_num)
		global.coins -= _w.price
		instance_destroy(_w)
	}
	
}

function create_weapon(_name, _spr, _proj, _dmg, _spd, _rate, _price, _auto = false, _proj_num = 1) constructor {
	
	name = _name
	sprite = _spr
	projectile = _proj
	proj_dmg = _dmg
	proj_spd = _spd
	rate = _rate
	price = _price
	auto = _auto
	proj_num = _proj_num
	
}

function create_enemy_weapon(_name, _spr, _proj, _dmg, _spd, _rate, _proj_num = 1) constructor {
	
	name = _name
	sprite = _spr
	projectile = _proj
	proj_dmg = _dmg
	proj_spd = _spd
	rate = _rate
	proj_num = _proj_num
	
}

function scr_create_weapon_list() {
	
	enum WEAPONS 
	{
		PISTOL,
		UZI,
		LENGTH
	}

	global.weapon_list = 
	[
	new create_weapon("Fists", -1, -1, 1, 0, 15, false, 0),
	new create_weapon("Pistol", spr_weapon, spr_projectile, 2, 8, 14, 0),
	new create_weapon("UZI", spr_uzi, spr_projectile, 1, 9, 10, 20, true),
	new create_weapon("Shotgun", spr_shotgun, spr_projectile, 1, 8, 60, 30, false, 3)
	]
	
	global.enemy_weapon_list = 
	[
	new create_enemy_weapon("Fists", -1, -1, 1, 0, 15),
	new create_enemy_weapon("Pistol", spr_weapon, spr_enemy_projectile, 1, 3, 55),
	]
	
}