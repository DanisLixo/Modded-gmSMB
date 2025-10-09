if !onview()
{exit;}

shader_set(shdColorswap);
	apply_palette(sPalette_dawn,global.paletteindex,image_alpha)
	draw_sprite(sFirebow,0,x,y);
shader_reset();