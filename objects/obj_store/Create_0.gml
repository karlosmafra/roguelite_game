products = [0, 1]

var _item = choose(1, 2)

var _weapon = irandom_range(2, 3)
instance_create_layer(x, y, "Weapons", obj_weapon_dropped, {weapon_num: _weapon, price: global.weapon_list[_weapon].price})