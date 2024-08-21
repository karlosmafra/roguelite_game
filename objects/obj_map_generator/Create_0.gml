// Variáveis da grid de geração procedural
cell_size = 32
grid_w = room_width div cell_size
grid_h = room_height div cell_size

grid = ds_grid_create(grid_w, grid_h)
ds_grid_clear(grid, 0)

mp_grid = mp_grid_create(0, 0, grid_w, grid_h, cell_size, cell_size)

var _xx = round(grid_w/2)
var _yy = round(grid_h/2)
randomize()
var _dir = irandom(3)

// Variáveis do auto-tiling
north = 1
west = 2
east = 4
south = 8

tile_layer = layer_tilemap_get_id("Tiles_walls")

max_enemies = 5

// Algoritmo de geração de dungeon

rooms_count = irandom_range(6, 8)
room_size = 3

ds_grid_set_region(grid, _xx - room_size, _yy - room_size, _xx + room_size, _yy + room_size, 1)

for (var _i = 1; _i < rooms_count; _i++)
{
	
	var _path = irandom_range(9, 11)
	dir = irandom(3)
	
	for (var _p = _path; _p > 0; _p--)
	{
		_xx += lengthdir_x(1, dir * 90)
		_yy += lengthdir_y(1, dir * 90)
		
		_xx = clamp(_xx, room_size + 1, grid_w - room_size - 2)
		_yy = clamp(_yy, room_size + 1, grid_h - room_size - 2)
		
		grid[# _xx, _yy] = 1
	}
	
	ds_grid_set_region(grid, _xx - room_size, _yy - room_size, _xx + room_size, _yy + room_size, 1)
	
}

/* Algoritmo random walker
var _chance = 70
var _steps = 450
// Preencher grid com valores aleatórios (0 == parede, 1 == chão)
for (var _i = 0; _i < _steps; _i++)
{
	
	grid[# _xx, _yy] = 1
	
	if irandom(99) < _chance
	{
		_dir = irandom(3)
	}
	
	_xx += lengthdir_x(1, _dir * 90)
	_yy += lengthdir_y(1, _dir * 90)
	
	_xx = clamp(_xx, 2, grid_w - 3)
	_yy = clamp(_yy, 2, grid_h - 3)
	
}
*/

// Percorrer grid e criar paredes
for (var _w = 0; _w < grid_w; _w++)
{
	for (var _h = 0; _h < grid_h; _h++)
	{
		if grid[# _w, _h] == 0
		{
			tile_layer = layer_tilemap_get_id("Tiles_walls")
			
			instance_create_layer(_w * cell_size, _h * cell_size, "Instances", obj_block)
			
			#region Auto-tiling
			var _north = grid[# _w, _h-1] == 0
			var _west = grid[# _w-1, _h] == 0
			var _east = grid[# _w+1, _h] == 0
			var _south = grid[# _w, _h+1] == 0
			
			var _tile_id = _north * north + _west * west + _east * east + _south * south + 1
			
			tilemap_set(tile_layer, _tile_id, _w, _h)
		}
		else
		{
			if irandom(150) == 150
			{
				instance_create_layer(_w * cell_size + cell_size/2, _h * cell_size + cell_size/2, "Instances", obj_weapon_dropped, {weapon_num: irandom_range(1, 2)})
			}
			
			tile_layer = layer_tilemap_get_id("Tiles_ground")
			
			tilemap_set(tile_layer, 17, _w, _h)
		}
		#endregion
	}
}

function generate_enemies() {
	
	for (var _w = 0; _w < grid_w; _w++)
	{
		for (var _h = 0; _h < grid_h; _h++)
		{
			if irandom(50) == 50 && max_enemies > 0 && grid[# _w, _h] == 1
			{
				// Inimigo não spawna perto do player (centro do mapa)
				if _w > (grid_w div 2) + room_size || _w < (grid_w div 2) - room_size ||  _h > (grid_h div 2) + room_size || _h < (grid_h div 2) - room_size
				{
					instance_create_layer(_w * cell_size + cell_size/2, _h * cell_size + cell_size/2, "Instances", obj_enemy)
					max_enemies--
				}
			}
		}
	}

}

function generate_store() {
	
	var _store = 0
	
	for (var _w = 0; _w < grid_w; _w++)
	{
		for (var _h = 0; _h < grid_h; _h++)
		{
			// Verifica se já existe uma loja, se os espaços ao redor são chão e se os espaços em cima são paredes
			if _store == 0 && grid[# _w, _h] == 1 && grid[# _w-1, _h] == 1 && grid[# _w+1, _h] == 1 && grid[# _w, _h-1] == 0 && grid[# _w+1, _h-1] == 0 && grid[# _w-1, _h-1] == 0  &&  grid[# _w, _h+1] == 1 && grid[# _w-1, _h+1] == 1 && grid[# _w+1, _h+1] == 1
			{
				if irandom(30) == 30
				{
					instance_create_layer(_w * cell_size + cell_size/2, _h * cell_size + cell_size/2, "Instances", obj_store)
					_store++
				}
			}
		}
	}

}

// Garante que crie pelo menos 2 inimigos
while max_enemies > 3
{
	generate_enemies()
}
generate_store()

mp_grid_add_instances(mp_grid, obj_block, false)
