selecting = false

for (var _i = 0; _i < array_length(menu_list[current_menu]); _i++)
{
	var _menu = menu_list[current_menu]
	var _c = c_white
	var _mx = device_mouse_x_to_gui(0)
	var _my = device_mouse_y_to_gui(0)
	var _margin = string_height("I")
	var _width = 100
	var _total_height = _margin * array_length(_menu)
	var _x0 = display_get_gui_width()/2
	var _y0 = display_get_gui_height()/2 - _total_height/2
	
	draw_set_halign(fa_center)
	draw_set_valign(fa_top)
	
	if point_in_rectangle(_mx, _my, _x0 - _width/2, _y0 + _i * _margin, _x0 + _width/2, (_y0 + _i * _margin) + _margin - 1)
	{
		selected[current_menu] = _i
		selecting = true
		_c = c_blue
	}
	draw_text_color(_x0, _y0 + _i * _margin, _menu[_i][MENU_FIELDS.NAME], _c, _c, _c, _c, 1)
}

draw_set_halign(-1)
draw_set_valign(-1)