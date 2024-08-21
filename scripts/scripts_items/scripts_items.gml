function scr_pick_item(_item) {
	
	if global.coins >= _item.price
	{
		global.coins -= _item.price
		script_execute(_item.scr)
		instance_destroy(_item)
	}
	
}

function create_item(_name, _sprite, _scr) constructor{
	
	name = _name
	sprite = _sprite
	scr = _scr

}

function scr_create_item_list()
{
	
	global.item_list =
	[
		new create_item("Heart", spr_heart, function() {with obj_player {hp = min(hp+1, max_hp)}}) 
	]
	
}