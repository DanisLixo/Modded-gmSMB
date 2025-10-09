// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
/// @desc Gets a custom sprite from a character if they have it.
/// @param {any} spriteString The string or asset for the sprite
/// @param {string} [character]=global.player which character has this sprite.
/// @returns {asset} Description
function custom_sprite(spriteString, character = global.player){
	if (!is_string(spriteString)) 
	{spriteString = sprite_get_name(spriteString);};
	
	var mySprite = spriteString+"_"+character;
	var sprite;
	
	if asset_get_index(mySprite) != -1
	{sprite = asset_get_index(mySprite);}
	else if ds_map_find_value(global.moddedSprites, mySprite) != undefined
	{sprite = ds_map_find_value(global.moddedSprites, mySprite)}
	else
	{sprite = asset_get_index(spriteString)}
	
	return sprite;
}