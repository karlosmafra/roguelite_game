instance_destroy()
other.hp -= damage
other.hit_alpha = 1
if other.state == scr_enemy_idle
{
	other.state = scr_enemy_pursuit
}