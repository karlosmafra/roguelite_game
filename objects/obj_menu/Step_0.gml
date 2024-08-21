if selecting
{
	var _menu = menu_list[current_menu]
	var _sel = selected[current_menu]
	if mouse_check_button_pressed(mb_left)
	{
		switch _menu[_sel][MENU_FIELDS.ACTION]
		{
		case MENU_ACTIONS.EXECUTE_METHOD:
			script_execute(_menu[_sel][MENU_FIELDS.PARAMETER])
		break
		case MENU_ACTIONS.CHANGE_MENU:
			current_menu = _menu[_sel][MENU_FIELDS.PARAMETER]
		break
		}
	}
}