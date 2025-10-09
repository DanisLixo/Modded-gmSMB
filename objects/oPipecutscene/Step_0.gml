if pipesize < 32 {pipesize += pipet;}
else if pipet == 1 
{
	if m != noone {
		oPlayer.state = ps.exitpipe; 
		oPlayer.in_cutscene = true; 
	}
	pipet = 0;}

image_yscale = pipesize/sprite_get_height(sPipearena);

if (m != noone && oPlayer.state == ps.normal && pipet == 0) || m == noone && pipet == 0
{alarm[0] = 42; pipet = -1;}

if pipesize < 0 && pipet == -1 
{instance_destroy();}