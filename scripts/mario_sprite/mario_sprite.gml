// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function ms(spritestring, indexused = global.player)
{
	var pu = (object_get_parent(object_index) == oMario)? powerup : oGame.savedpowerup;
	
	if object_index == oLuigi || indexused = global.playertwo {
		pu = (object_get_parent(object_index) == oMario)? powerup : oGame.p2savedpowerup; 
		indexused = global.playertwo;
	}
	
	if indexused == "Max Verstappen" {spritestring = "sMaxVerstappen_{}_idle"}
	
	if (pu = "f" || pu = "c" || pu = "h" || pu = "t" || pu = "bs") {pu = "b";}
	if (pu = "sf") {pu = "s";}
	
	if object_get_parent(object_index) == oMario
	{
		indexused = char;
		
		if indexused == "Max Verstappen" && state == ps.pivot && powerup == "f" 
		{spritestring = "sMaxVerstappen_f_pivot"}
		
		if indexused = "Goldron"
		{return sGoldron;}
	}
	
	if indexused == "1pixelmario" {
		
		var pu = (object_get_parent(object_index) == oMario)? powerup : oGame.savedpowerup;
	
		if object_index == oLuigi || indexused = global.playertwo {
			pu = (object_get_parent(object_index) == oMario)? powerup : oGame.p2savedpowerup; 
			indexused = global.playertwo;
		}
		
		spritestring = "s1pixelmario_{}_idle"
	}
	if indexused == "Goldron" {return sGoldron_s}
	
	spritestring = string_replace(spritestring,"Mario",indexused);
	spritestring = string_replace(spritestring,"{}",pu)
	spritestring = string_replace(spritestring," ","")
	
	var pngSprite = "s" + indexused;
	pngSprite = string_replace(pngSprite," ","")
	
	if sprite_exists(asset_get_index(spritestring))
	{return asset_get_index(spritestring);}
	else if ds_map_find_value(global.moddedSprites, spritestring) != undefined {
		if ds_map_find_value(global.moddedSprites, pngSprite) 
		{return ds_map_find_value(global.moddedSprites, pngSprite)}
		else 
		{return ds_map_find_value(global.moddedSprites, spritestring)}
	} else {
		if sprite_exists(asset_get_index(pngSprite)) {return asset_get_index(pngSprite);}
		else if object_get_parent(object_index) = oMario and sprite_exists(spr) {return spr;}
		else {return superFUCKINGmario;}
	}
}