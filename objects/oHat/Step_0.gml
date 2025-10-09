if !instance_exists(m) 
{
	var mario = instance_place(x,bbox_bottom+4,oMario)
	if mario {m = mario;}
	else {instance_destroy();}
}
else {
	image_alpha = m.image_alpha
	depth = m.depth-1
	x = m.x; y = m.bbox_top-2;
}

