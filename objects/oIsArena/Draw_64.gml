if win >= 0 
{
	var text = (draw == 0)? "ROUND IS OVER\nTHE WINNER IS: "+ string_upper(winner) : "DRAW GAME";
	
	draw_set_halign(fa_center);
	draw_set_font(global.fnt);
	draw_text(SCREENW/2,SCREENH/2,text);
	draw_set_halign(-1);
	draw_set_font(-1);
}

draw_sprite(sRacestarts,image_index,SCREENW/2,SCREENH/2);

if round(image_index) = 1
{fx = lerp(fx,-8,.2);}
if round(image_index) = 2
{fx = lerp(fx,-16,.2);}
if image_index >= 3
{fx = lerp(fx,sprite_get_height(sAwesomefade),.2);}

draw_sprite_ext(sAwesomefade,0,0,7+SCREENH+fx,60,1,0,1,1);
draw_sprite_ext(sAwesomefade,0,0,7+-fx,60,-1,0,1,1);

if endcounter > 0
{endcounter --;}

if endcounter != -1
{
	draw_set_color(c_yellow)
	draw_set_font(global.fnt);
	draw_text(6,SCREENH-12,"GET READY IN "+string(round(endcounter div 60))+"...");
	draw_set_font(-1);
	draw_set_color(-1);
}