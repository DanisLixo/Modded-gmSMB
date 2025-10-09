if (startRecord) {
	draw_set_halign(fa_center)
	draw_set_valign(fa_middle)
	draw_set_font(global.fnt);
	draw_text(SCREENW/2,SCREENH/2, "RESTART THE LEVEL TO START RECORDING!!!");
	draw_set_font(-1);
	draw_set_halign(-1)
	draw_set_valign(-1)
}