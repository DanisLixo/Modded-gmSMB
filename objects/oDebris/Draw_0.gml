shader_set(shdColorswap);
	apply_palette(sPalette_tilebrown,global.environment,image_alpha)
	draw_self()
shader_reset();