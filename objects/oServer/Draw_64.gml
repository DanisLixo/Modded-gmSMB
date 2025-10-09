/// @description Draw Total Players

var all_players = ds_list_size(total_players);

draw_set_font(global.fnt);

draw_text(16, 10, " - HOSTING!");
draw_text(32, 30, "World: " +string(global.world) +"\nLevel: "+string(global.level) + "\nArena: " + string(global.arena));

draw_set_halign(fa_center);

draw_text(SCREENW/2, SCREENH/2 - 16, "PLAYERS CONNECTED - " + string(all_players));

draw_set_font(fntComic)

draw_text(SCREENW/2, SCREENH-48, "To join, open another client");
draw_text(SCREENW/2, SCREENH-32, "Press ESCAPE to set gamemode or start game");

draw_set_halign(-1);
draw_set_font(-1);
