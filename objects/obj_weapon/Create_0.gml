parent_id = -1

dir = 0
xx = 0
yy = 0

weapon_num = 0
weapon = global.weapon_list[weapon_num]

can_shoot = true

function shoot() 
{
	if !can_shoot
	{
		return false
	}
		
	if !weapon_num > 0
	{
		return false
	}
		
	var _proj_type = parent_id.object_index == obj_player ? obj_projectile : obj_enemy_projectile
		
	for (var _i = 0; _i < weapon.proj_num; _i++)
	{
	var _proj = instance_create_layer(xx, yy, "Projectiles", _proj_type)
	_proj.sprite_index = weapon.projectile
	_proj.speed = weapon.proj_spd
	var _dir = ceil(_i/2) * power(-1, _i) * 8
	_proj.direction = dir + _dir
	_proj.image_angle = dir + _dir
	_proj.damage = weapon.proj_dmg
	}
	can_shoot = false
	alarm[0] = weapon.rate
}