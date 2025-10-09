/// @description Draw Menu
draw_set_color(c_black); 
draw_set_alpha(0.98); 
draw_rectangle(0,0,SCREENW+1,SCREENH+1,false); 
draw_set_color(-1); 
draw_set_alpha(1);

draw_set_font(fntComic)

for (var i = 0; i < ds_grid_width(cmoptions); i++;)
{
	for (var j = 0; j < ds_grid_height(cmoptions); j++;) {
		var gv = variable_global_get(cmbool[# i,j])
		
		if is_string(cmbool[# i,j]) and cmvalue[# i,j] == "nothin" 
		{draw_sprite(sCheckbox,sign(gv),32+(i*SCREENH/1.25),64+(j*16));}
		
		if cmvalue[# i,j] != "nothin" 
		{
			var value = variable_instance_get(id, cmvalue[# i,j]);
			if changemode and cmsec = i and cmsel = j 
			{draw_set_color(c_red);} 
			draw_text(64+(i*SCREENH/1.25),64+(j*16)-4,cmoptions[# i,j]+" "+string(value)); 
			draw_set_color(c_white);
		}
		else if cmoptions[# i,j] != "" {draw_text(64+(i*SCREENH/1.25),64+(j*16)-4,cmoptions[# i,j]);}
	}
}
	
draw_sprite(sMushsel,oGame.image_index,16+(cmsec*SCREENH/1.25),64+(cmsel*16))

draw_set_halign(fa_center);
draw_text(SCREENW/2, SCREENH-32, "Press ESCAPE to return");
draw_set_halign(fa_left);

draw_set_font(-1);
