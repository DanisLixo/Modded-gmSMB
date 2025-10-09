menuXY += 0.2;
menu_background(floor(menuXY));

draw_set_font(global.fnt)
draw_set_halign(fa_center);

for (var i = 0; i < array_length(menus); i++) {
	if (sel == i) 
	{draw_set_colour(make_colour_rgb(234, 158, 34));}
	if (menus[i].name == "BACK") 
	{draw_sprite(sBacksel,0,SCREENW/2 - (string_width(menus[i].name) / 2) - 16, 64 + 16 * i);}
	draw_text(SCREENW/2, 64 + 16 * i, menus[i].name);
	draw_set_colour(-1);
}

draw_set_font(-1)
draw_set_halign(-1);