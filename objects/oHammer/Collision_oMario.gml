if other.state = ps.nah
{
	if !clashroyale {
		vspd -= 8; 
		facingdir = -facingdir; 
		clashroyale = true; 
	}
	exit;
}

if throwed 
{instance_place(x,y,other).gethit = 1}