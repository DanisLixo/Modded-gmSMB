if keyboard_check_pressed(vk_escape)
{instance_destroy();}

if !changemode {
	if keyboard_check_pressed(global.keyd) && cmsel < ds_grid_height(cmoptions)-1
	{cmsel += 1;}
	if keyboard_check_pressed(global.keyu) && cmsel > 0
	{cmsel -= 1;}
}
	
var p = keyboard_check(global.keyr)-keyboard_check(global.keyl);
	
if p = 0 {c = 0}
else {c++}
		
if !changemode and (c = 1 || c >= 35) 
	{cmsec += p;}
if cmsec > 1
	{cmsec = 0;}
if cmsec < 0
	{cmsec = 1;}
	
if changemode {
	var value = variable_instance_get(id, cmvalue[# cmsec,cmsel]);
	if (c = 1 || c >= 35) 
	{variable_instance_set(id, cmvalue[# cmsec,cmsel], value + p);}
			
	if cmoptions[# cmsec,cmsel] = "Arena time limit - "
	{
		if gtime > 1000
		{gtime = 0;}
		if gtime > 0 && gtime < 5
		{gtime = 100;}
		if gtime < 100
		{gtime = 0;}
		if gtime < 0
		{gtime = 1000;}
	}
	if cmoptions[# cmsec,cmsel] = "Arena WIP - "
	{
		if ga > 3
		{ga = 0;}
		if ga < 0
		{ga = 3;}
	}
	if cmoptions[# cmsec,cmsel] = "Level - "
	{
		if glev > 4
		{glev = 1;}
		if glev < 1
		{glev = 4;}
	}
	if cmoptions[# cmsec,cmsel] = "World - "
	{
		if gwor > 8
		{gwor = 1;}
		if gwor < 1
		{gwor = 8;}
	}
		
	if cmoptions[# cmsec,cmsel] != "Arena time limit - " 
	{variable_global_set(cmbool[# cmsec,cmsel], value)}
}

if keyboard_check_pressed(global.keyj) || keyboard_check_pressed(vk_enter)
{
	if cmvalue[# cmsec,cmsel] != "nothin"
	{
		changemode = !changemode;
		if cmoptions[# cmsec,cmsel] != "Arena time limit - " 
		{variable_global_set(cmbool[# cmsec,cmsel], variable_instance_get(id, cmvalue[# cmsec,cmsel]))}
	}
	if is_string(cmbool[# cmsec,cmsel])
	{
		var gv = variable_global_get(cmbool[# cmsec,cmsel])
		variable_global_set(cmbool[# cmsec,cmsel],!gv)
	}
	else
	{
		if cmoptions[# cmsec,cmsel] = "Begin game"
		{
			global.arena = ga;
			if global.challenge {
				global.world = 1; global.level = 1
			} else {
				global.world = gwor; global.level = glev;
			}
			oServer.apply_settings();
		}
		if cmoptions[# cmsec,cmsel] = "Disconnect" 
		{network_destroy(oServer.server); game_restart();}
		
		instance_destroy();
	}
}