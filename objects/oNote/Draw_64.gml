if (fadeTimerTotal == -1 && fadeTimer >= 0) {
	fadeTimerTotal = fadeTimer;
}
if (timer > 0) 
	{timer--;}
if (timer == 0) 
	{fadeTimer--;}
if (fadeTimer <= 0) 
	{instance_destroy();}

var _height = string_height(text);
var _width = string_width(text);
var _alpha = fadeTimer / fadeTimerTotal; // Insane things going on (Math)

image_xscale = _width/15;
image_yscale = _height/8;
image_alpha = _alpha;

draw_set_alpha(_alpha);
draw_set_font(useFont);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
	draw_self();
	draw_text(x, y, text);
draw_set_alpha(1);
draw_set_font(-1);
draw_set_halign(-1);
draw_set_valign(-1);