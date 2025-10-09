// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function update_tileset(){
	var tbr = layer_get_id("Tiles_brown")
	var tgr = layer_get_id("Tiles_green")
	var tbl = layer_get_id("Tiles_blue")
	
	switch(global.game) {
		case gm.SMB:
			global.fnt = FNT_SMB;
			var btile_id = layer_tilemap_get_id(tbr); 
			if btile_id != undefined 
			{tilemap_tileset(btile_id, tileBrown);}
			
			var gtile_id = layer_tilemap_get_id(tgr); 
			if gtile_id != undefined 
			{tilemap_tileset(gtile_id, tileGreen);}
			
			var bltile_id = layer_tilemap_get_id(tbl); 
			if bltile_id != undefined  
			{tilemap_tileset(bltile_id, tileBlue);}
		break;
		case gm.LL:
			global.fnt = FNT_LL;
			var btile_id = layer_tilemap_get_id(tbr); 
			if btile_id != undefined 
			{tilemap_tileset(btile_id, tileBrown_LL);}
			
			var gtile_id = layer_tilemap_get_id(tgr); 
			if gtile_id != undefined 
			{tilemap_tileset(gtile_id, tileGreen_LL);}
			
			var bltile_id = layer_tilemap_get_id(tbl); 
			if bltile_id != undefined  
			{tilemap_tileset(bltile_id, tileBlue_LL);}
		break;
		default:
			global.fnt = -1;
			var btile_id = layer_tilemap_get_id(tbr); 
			tilemap_tileset(btile_id, -1);
			var gtile_id = layer_tilemap_get_id(tgr); 
			tilemap_tileset(gtile_id, -1);
			var bltile_id = layer_tilemap_get_id(tbl); 
			tilemap_tileset(bltile_id, -1);
		break;
	}
}