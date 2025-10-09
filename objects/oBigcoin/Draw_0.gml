if !onview()
{exit;}

if instance_exists(oMario) {
	var m_char = instance_nearest(x,y,oMario).char

	sprite_index = custom_sprite(sBigcoin, m_char);
}

shader_set(shdColorswap);
	apply_palette(sPalette_gold,global.environment+1,image_alpha)
	draw_sprite_ext(sprite_index,oGame.image_index,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha)
shader_reset();