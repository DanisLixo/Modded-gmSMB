if !onview() 
{exit;}

draw_self();

if (!teleported && sprite_index = sSecreteye_idleb && oMario.state == -1) {
	shader_set(shdColorswap);
	apply_palette(global.palettesprite,oMario.palindex,1)
	var _spr = ms("sMario_{}_jump");
	draw_sprite_ext(_spr, 0, x, y + sprite_get_height(ms("sMario_{}_jump"))/2, mScale, mScale, 0, -1, 1)
	shader_reset()
}