// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function update_gun() {
	var _getGunId = global.gunID;
	
	if (global.gunskin != global.gunlist[_getGunId]) 
	{
		global.gunskin = global.gunlist[_getGunId];
	}
	
	return global.gunlist[_getGunId];
}