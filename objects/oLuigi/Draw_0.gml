if char = "Goldron"

{
	if hspd != 0 && grounded
	{yoff = -abs(sin(x/10))*5}
	else
	{yoff = 0;}
	if powerup = "s"	{ind = 0;}
	if powerup = "b"	{ind = 1;}
	if powerup = "f" || powerup = "c"	{ind = 2;}
}

//scale = 2;
if global.scaled = false {
	scale = 1;

	if char = "Peter Griffin"	{scale = 0.2;}
	if char = "Duke"	{scale = 0.2;}
	if char = "Pokey" {scale = 0.2;}
	if char = "Max_Verstappen" {scale = 0.2;}
	if char = "Anton" && powerup = "s"	{scale = 0.6}
	if char = "1pixelMario" && powerup = "s"	{scale = 0.5}
}

if powerup = "f" && (char = "Pokey" || char = "Gemaplys") and instance_number(oHat) < global.hats
{instance_create_depth(x,y-global.hats*4,depth+1,oHat);}
else if powerup != "f" 
{instance_destroy(oHat);}

if powerup = "c" && mycapeative = false && (state != ps.capetransform || state != ps.shrink) {
	var csp = instance_create_depth(x,y,depth+1,oCape);
	csp.spr = cs("sCape_idle");
	csp.m = id
	mycapeative = true;
}
else if powerup != "c" {mycapeative = false;}


//👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍👍

if powerup = "f"
{
	if global.paletteindex = 2 {palindex = 1;}
	else {palindex = 2;}
}
else
{palindex = global.p2_paletteindex;}

shader_set(shdColorswap);
apply_palette(global.p2_palettesprite,palindex,image_alpha)
if firetimer > 0 && char != "Peter Griffin" && char != "Duke" && char != "Pokey" && char != "1pixelmario" && char != "Max_Verstappen" and (char != "Sonic" or char = "Sonic" and state != ps.jump)
	{
		{
			firedraw = true;
			
			var fs = ms("sMario_{}_fire")
			var fsw = sprite_get_width(fs); var fsh = sprite_get_height(fs);
			draw_sprite_part_ext(fs,ind,0,0,fsw,fsh-8,x-(image_xscale*fsw/2),y-fsh+yoff,
			(image_xscale*scale),(image_yscale*scale),image_blend,image_alpha);
		
			var ccs = spr
			if spr = ms("sMario_{}_idle")
			{ccs = ms("sMario_{}_fire");}
			var csw = sprite_get_width(ccs); var csh = sprite_get_height(ccs); var cswsub = csw/16;
			draw_sprite_part_ext(ccs,ind,0,csh-9,csw,9,x-(image_xscale*csw/2)/*-cswsub-1*-image_xscale*/,y-8+yoff,
			(image_xscale*scale),(image_yscale*scale),image_blend,image_alpha);
		}
	}
else {firedraw = false; draw_sprite_ext(spr,ind,x,y+yoff,round(image_xscale)*scale,image_yscale*scale,image_angle,image_blend,image_alpha);}
shader_reset()

if starman != 0 and char != "Max_Verstappen"
{
	gpu_set_fog(true,make_color_hsv((starman) mod 255,255,255),1,1);
	if firedraw {
		var fs = ms("sMario_{}_fire")
		var fsw = sprite_get_width(fs); var fsh = sprite_get_height(fs);
		draw_sprite_part_ext(fs,ind,0,0,fsw,fsh-8,x-(image_xscale*fsw/2),y-fsh+yoff,
		(image_xscale*scale),(image_yscale*scale),image_blend,0.5);
		
		var ccs = spr
		if spr = ms("sMario_{}_idle")
		{ccs = ms("sMario_{}_fire");}
		var csw = sprite_get_width(ccs); var csh = sprite_get_height(ccs); var cswsub = (csw/16)+(1*-image_xscale);
		draw_sprite_part_ext(ccs,ind,0,csh-9,csw,9,x-(image_xscale*csw/2)-cswsub,y-8+yoff,
		(image_xscale*scale),(image_yscale*scale),image_blend,0.5);
	}
	else {draw_sprite_ext(spr,ind,x,y+yoff,round(image_xscale)*scale,image_yscale*scale,image_angle,image_blend,0.5)}
	gpu_set_fog(false,-1,1,1);
	
	if starman mod 3 = 0
	{var smsfx = instance_create_depth(x,y,depth+2,oStarmanFX); smsfx.image_xscale = image_xscale; smsfx.col = make_color_hsv((starman) mod 255,255,255); smsfx.image_index = ind; smsfx.sprite_index = spr;}
}


if shoulderbash > 0 && (current_time/1000) mod 5 = 0
{
	var smsfx = instance_create_depth(x,y,depth+2,oStarmanFX); 
	smsfx.image_xscale = image_xscale; 
	smsfx.col = choose(c_red,c_purple);
	smsfx.image_index = ind; 
	smsfx.sprite_index = spr;
}

if pmach < 5 
{global.p2_pind = pmach}
else 
{
	if pmet mod 10 < 5 {global.p2_pind = 6}
	else {global.p2_pind = 7}
}

nes_flicker()



if powerup != "s" && crouch = false and !(char = "Sonic" and state = ps.jump) and 
char != "1pixelmario" and char != "Pokey"
{sprite_index = sMariomask1;}
else
{sprite_index = sMariomask0;}

if char = "1pixelmario"
{if powerup = "s" sprite_index = s1pixelmario_s_idle;
else sprite_index = s1pixelmario_b_idle;}

if global.scaled 
{
sprite_height *= scale
sprite_width *= scale
}

if instance_exists(oClient)
{
	draw_set_alpha(0.6);
	draw_set_font(fntComic)
	draw_set_halign(fa_center);
	draw_text(x,bbox_top-16,global.username)
	draw_set_halign(fa_left);
	draw_set_font(-1);
	draw_set_alpha(1);
}

if instance_exists(oIsArena)
{
	draw_set_color(c_yellow);
	draw_set_font(FNT)
	draw_sprite_ext(sSuperstaricon,0,x-16,bbox_bottom,1,1,0,c_yellow,1);
	draw_text(x+8,bbox_bottom+6,global.stars);
	draw_set_font(-1);
	draw_set_color(-1);
	
	
	if instance_place(x,y,oSuperstar)
	{global.stars ++; instance_destroy(instance_place(x,y,oSuperstar))}
}

if room = rmTitle 
{
	if instance_place(x+15, y, oGoomba) {state = ps.nah}  
	else {state = ps.title; ind = 0;}  
	invincible = 1;
}