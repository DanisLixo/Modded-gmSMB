if other.vspd < 0 && state != es.shellhit 
{
	vspd = -4; 
	if state != es.shell {state = es.shell; points(200,true);}
	var shellface = (other.bbox_right-8 < x? 1 : -1); 
	if moveshelled {hspd = 3*shellface;}
	shellcooldown = 10
}
else {moveshelled = false;}




