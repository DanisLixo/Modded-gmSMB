function menu_background(_XY) { 
	if global.titleroom = rmTitle_new 
	{
		draw_sprite_tiled(sMenu_pattern, -1, _XY, _XY);
		
	}
	else 
	{
		draw_set_color(c_black);
			draw_rectangle(0,0,SCREENW,SCREENH,false);
		draw_set_color(-1);
	}
}