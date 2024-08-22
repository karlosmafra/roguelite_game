vspeed = lerp(vspeed, 0, 0.1)
if abs(vspeed) < 0.1 {vspeed = 0}
hspeed = lerp(hspeed, 0, 0.1)
if abs(hspeed) < 0.1 {hspeed = 0}