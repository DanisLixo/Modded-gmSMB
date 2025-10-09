menuind += 0.1

menu_background();

#region text draw

xx = SCREENW / 2;
yy = 64;
tsep = 16;

draw_set_halign(fa_center)

if global.titleroom == rmTitle_old 
{
	xx -= 88;

	draw_set_halign(fa_left)
}

var text = "";
draw_set_font(global.fnt);

for (var i = 0; i < optionsnum[section]; i++;)
{
	if menu[# section, i] = "USERNAME - "
	{
		var userlimit = (string_length(global.username) > 15)? 1-((string_length(global.username)-15)*0.025) : 1
		text = menu[# section, i]
		draw_set_font(fntComic)
		draw_text_transformed(xx+(8*11),yy+(i*tsep)-4,global.username, userlimit, 1, 0)
		draw_set_font(global.fnt)
	}
	else if menu[# section, i] = "BACK"
	{
		text = "  " + menu[# section, i]; 
		
		if draw_get_halign() == fa_left
		{draw_sprite(sBacksel,0,xx,yy+(i*tsep));}
		else 
		{draw_sprite(sBacksel,0,xx - (string_width(text) / 2), yy + (i*tsep));}
	}
	else if menu[# section, i] = "PLYRS VISIBILITY"
	{text = menu[# section, i]+" * "+string(round(global.onlinealpha*100))}
	else if menu[# section, i] = "MAX PLAYERS - "
	{text = menu[# section, i]+string_upper(global.maxplayers);}
	else if menu[# section, i] = "SET IP - "
	{
		text = menu[# section, i]
		draw_set_font(fntComic)
		draw_text(xx+(8*10),yy+(i*tsep)-4,global.ip)
		draw_set_font(global.fnt)
	}
	else if menu[# section, i] = "SET PORT - "
	{
		text = menu[# section, i]
		draw_set_font(fntComic)
		draw_text(xx+(8*11),yy+(i*tsep)-4,global.port)
		draw_set_font(global.fnt)
	}
	else {text = string(menu[# section, i]);}
	var charlimit = 1
	if i == sel 
	{
		var mushx = (global.titleroom != rmTitle_old)? xx - (string_width(text) / 2) - 16 : xx - 16
		shader_set(shdColorswap) 
			apply_palette(sPalette_gold,global.environment+1,1); 
			draw_sprite(sMushsel,oGame.image_index, mushx,yy+(i*tsep));
		shader_reset();
	}
			
	if global.aspectRatio == "ORIGINAL" 
	{charlimit = (string_length(text) > 20)? 1-((string_length(text)-20)*0.025) : 1;}
	if global.aspectRatio == "WIDESCREEN"
	{charlimit = (string_length(text) > 35)? 1-((string_length(text)-35)*0.025) : 1;}
	draw_text_transformed(xx,yy+(i*tsep),text,charlimit,1,0);
}

draw_set_halign(-1)
draw_set_font(-1)

#endregion