if other.kd 
{
	if other.state != ps.enterpipe {
		other.state = ps.enterpipe;
		other.pipeinforoom = troom; 
		sfx(sndWarp,1);
	}
		
	if (other.powerup != "s" && other.powerup != "sf") && other.char != "Dawn"
	{other.spr = ms("sMario_{}_crouch");}
	else if other.char = "Dawn"
	{other.spr = ms("sMario_{}_downpipe");}
}