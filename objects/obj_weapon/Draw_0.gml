var _yscale = (dir > 90 && dir < 270) ? -1 : 1

if weapon.sprite != -1
{
	draw_sprite_ext(weapon.sprite, 0, xx, yy, 1, _yscale, dir, c_white, 1)
}