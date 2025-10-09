/// @self
/// @description Returns if we are in arena mode.
function is_onArena() {
	if instance_exists(oIsArena) && global.arena != 0 
	{return true;}
	
	return false;
}