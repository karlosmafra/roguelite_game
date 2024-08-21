path = path_add()

spd = 1
dir = 0 // Direção pra girar em volta do player
clockwise = 1 // Sentido pra girar em volta do player
agg_range = 150
atk_range = 120
hp = 8

hit_alpha = 0

state = scr_enemy_idle

my_weapon = instance_create_layer(x, y, "Weapons", obj_weapon)
my_weapon.parent_id = self
scr_change_weapon(my_weapon, 1)

coins_loot = irandom_range(3, 5)
loot = irandom_range(-1, 0)
