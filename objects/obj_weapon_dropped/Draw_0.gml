draw_sprite(weapon.sprite, 0, x, y)

// Se o objeto da arma dropada tiver um preço, escreve o preço da arma específica
if price > 0 
{
	draw_text(x, y+8, price)
}