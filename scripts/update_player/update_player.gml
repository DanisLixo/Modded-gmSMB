// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function update_player(player = "p1") {
	var _getPlayerId = (player == "p1")? global.playerID : global.playertwoID;
	var playerPalette = (player == "p1")? "palettesprite" : "p2_palettesprite";
	
	var playerName = (player == "p1")? "playerName" : "playertwoName";
	
	if (player != global.charlist[_getPlayerId].id) 
	{
		player = global.charlist[_getPlayerId].id;
	}
	
	if sprite_exists(asset_get_index("sPalette_"+string_lower(player)))
	{
		if player = "Goomba"	{variable_global_set(playerPalette, asset_get_index("sPalette_goombaplayer"));}
		else	{variable_global_set(playerPalette, asset_get_index("sPalette_"+string_lower(player)));}
	}
	else
	{
		if ds_map_find_value(global.moddedSprites, "sPalette_"+string_lower(player)) != undefined
			{variable_global_set(playerPalette, ds_map_find_value(global.moddedSprites, "sPalette_"+string_lower(player)));}
		else {variable_global_set(playerPalette, sPalette_mario);}
	}
	
	variable_global_set(playerName, global.charlist[_getPlayerId].name);
	
	return player;
}