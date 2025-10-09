shader_set(shdColorswap);
	apply_palette(sPalette_tilegreen,global.environment,image_alpha);
	draw_self();
shader_reset();