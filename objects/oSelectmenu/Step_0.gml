if allowMoviment {
	var p = keyboard_check_pressed(global.menukd) - keyboard_check_pressed(global.menuku);
	sel += p;
	sel = clamp(sel, 0, 2);

	if keyboard_check_pressed(global.menukj) || keyboard_check_pressed(vk_enter) 
	{
		if sel != 2 
		{instance_destroy(id, false); instance_create_depth(x,y,depth,menus[sel].obj).menuXY = menuXY;}
		else 
		{instance_destroy();}
	}
	if keyboard_check_pressed(global.menuka)  || keyboard_check_pressed(vk_escape) 
	{instance_destroy();}
}