if !global.demo {
	shader_set(shdColorswap)
		apply_palette(sPalette_warningpress,ind,1)
		draw_self();
	shader_reset();
}

var messag = (global.demo)? sWarningentersimple : sWarningenter;

draw_sprite(messag,0,SCREENW/2,SCREENH/2)