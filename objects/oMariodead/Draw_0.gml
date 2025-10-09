if !onview() 
{exit;}

shader_set(shdColorswap);
apply_palette(palspr,palind,image_alpha)
	draw_sprite_ext(spr,image_index,x,y,image_xscale,image_yscale,image_angle,c_white,image_alpha)
shader_reset()
