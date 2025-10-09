if (demoRecord) {
	draw_set_colour(c_red);
	draw_set_font(global.fnt);
	draw_circle(24,32,5,false);
	draw_text(32,32, "FRAME: " + string(demoRecordFrames));
	draw_set_colour(-1);
	draw_set_font(-1);
	
	draw_set_halign(fa_right)
	draw_set_font(global.fnt);
	draw_text(SCREENW - 24, 32, "PRESS F2 TO STOP RECORDING!");
	draw_set_font(-1);
	draw_set_halign(-1)
	
	if countdown > 0 {
		draw_set_halign(fa_center)
		draw_set_font(global.fnt);
		draw_text(SCREENW/2,SCREENH/2, string(countdown) + "!");
		draw_set_font(-1);
		draw_set_halign(-1)
	}
}