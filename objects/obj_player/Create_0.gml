hspd = 0
vspd = 0
spd = 3.5 //1.5
move_dir = 0
dash_cd = 0

vulnerable = true
max_hp = 6
hp = max_hp

can_shoot = true

state = scr_player_walking

instance_create_layer(x, y, layer, obj_camera)

weapons = [0] // Array com quais armas o player tem
max_weapons = 2
current_weapon = 0 // Posição no array da arma equipada
my_weapon = instance_create_layer(x, y, "Weapons", obj_weapon) // Cria o objeto da arma
my_weapon.parent_id = self 
scr_change_weapon(my_weapon, weapons[current_weapon]) // Equipa a arma inicial
