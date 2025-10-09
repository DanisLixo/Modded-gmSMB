global.environment = e.overworld

global.level = 2;
global.world = 2;

if global.differentTransitions 
{
	oGame.loadscreen = -1;
	var rm = "rmCutscene_" + global.transitions[| irandom_range(0, ds_list_size(global.transitions)-1)];
	
	room_goto(asset_get_index(rm));
}
