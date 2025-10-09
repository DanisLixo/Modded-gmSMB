if !global.checkpoints {exit;}

if oGame.spawnx = x and oMario.state != ps.exitpipe 
{global.killenys = true;}

if instance_exists(oMario)
{
	if oGame.spawnx > -1 && oMario.state != ps.exitpipe 
	{
		oMario.x = oGame.spawnx; 
		if instance_exists(oLuigi) {oLuigi.x = oGame.spawnx+16;}
	}
	if oGame.spawny > -1 && oMario.state != ps.exitpipe 
	{
		oMario.y = oGame.spawny; 
		if instance_exists(oLuigi) {oLuigi.y = oGame.spawny;}
	}
}