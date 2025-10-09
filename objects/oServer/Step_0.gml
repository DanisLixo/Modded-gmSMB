if global.race 
{
	global.arena = 0;
}
if global.arena != 0
{
	global.world = -1;
	global.level = -1;
	global.race = false;
	global.challenge = false;
	global.extra = false;
}
if global.challenge
{
	global.arena = 0;
	global.extra = false;
}
if global.extra
{
	global.world = 1;
	global.arena = 0;
	global.challenge = false;
}

if global.sync 
{global.waiting = true}

if keyboard_check_pressed(vk_escape)
{
	if !instance_exists(oServermenu) 
	{instance_create_depth(x,y,depth-1,oServermenu)}
}