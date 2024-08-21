current_menu = 0

#region Métodos

close_game = function() {
	game_end()
}

start_game = function() {
	room_goto(rm_lobby)	
}

toggle_fullscreen = function() {
	window_set_fullscreen(!window_get_fullscreen())	
}

#endregion

#region Lista dos menus

main_menu =
[
	["Play", MENU_ACTIONS.EXECUTE_METHOD, start_game], 
	["Options", MENU_ACTIONS.CHANGE_MENU, MENUS.OPTIONS],
	["Exit", MENU_ACTIONS.EXECUTE_METHOD, close_game]
]

options_menu =
[
	["Fullscreen", MENU_ACTIONS.EXECUTE_METHOD, toggle_fullscreen],
	["Back", MENU_ACTIONS.CHANGE_MENU, MENUS.MAIN]
]

menu_list = [main_menu, options_menu]
selected = array_create(array_length(menu_list), 0)
selecting = false

enum MENU_FIELDS
{
	NAME,
	ACTION,
	PARAMETER 
}

enum MENU_ACTIONS
{
	EXECUTE_METHOD,
	CHANGE_MENU
}

enum MENUS
{
	MAIN,
	OPTIONS
}

#endregion
