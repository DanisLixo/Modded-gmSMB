if sprite_index != sFeather || sprite_index == sFeather && vspd < 0 
{vspd += 0.15;}
if sprite_index == sFeather && vspd >= 0 
{instance_create_depth(x,y,depth-1, oBlow); instance_destroy();}

x += hspd;
y += vspd;

if sprite_index == sFireflower_wooble || sprite_index == sMushbottom {
	c++;
	if c == 4 
	{image_angle += 90; c = 0;}
}