weapon = irandom_range(1, 3)

function drop_weapon() {

	instance_create_layer(x, y, "Instances", obj_weapon_dropped, {weapon_num: weapon, vspeed: 1, hspeed: random_range(-0.5, 0.5)})
	instance_create_layer(x, y, "Instances", obj_chest_open)
	instance_destroy()
	
}