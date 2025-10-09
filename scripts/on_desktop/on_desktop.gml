// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function on_desktop(){
	if (os_type == os_windows || os_type == os_linux || os_type == os_macosx) 
	{return true;}
	
	return false;
}