if !onview()
{exit;}

shader_set(shdColorswap);
	apply_palette(sPalette_goomba,global.environment,1)
	draw_sprite(sFireHat,0,x,y);
shader_reset();