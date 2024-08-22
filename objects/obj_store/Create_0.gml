var _item = 0 //choose(1, 2)
var _weapon = irandom_range(2, 3)

instance_create_layer(x, y+6, "Weapons", obj_weapon_dropped, {weapon_num: _weapon, price: global.weapon_list[_weapon].price})
instance_create_layer(x - 32, y+6, "Weapons", obj_item, {item_num: _item, price: global.item_list[_item].price})
instance_create_layer(x + 32, y+6, "Weapons", obj_item, {item_num: _item, price: global.item_list[_item].price})