global.coins += coins_loot

if loot != -1
{
	instance_create_layer(x, y, "Instances", obj_item, {item_num: loot})
}

if instance_number(obj_enemy) == 1
{
	instance_create_layer(x, y, "Instances", obj_stairs)
}