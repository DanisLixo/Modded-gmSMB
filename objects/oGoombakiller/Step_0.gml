if goombaTarget == noone 
{goombaTarget = instance_nearest(oMario.x,oMario.y,oParenemy);}

if !instance_exists(goombaTarget) 
{instance_destroy();}

if instance_exists(oMario) && instance_exists(goombaTarget) && oMario.playDemo >= room_speed*7.5 && !killedHim
{
	x = goombaTarget.x;
	vspd = 4;
}

if instance_place(x,y,goombaTarget) && !killedHim
{sfx(sndBoom,1); killedHim = true; goombaTarget.state = es.stomp;}

if killedHim 
{
	if !onview() 
	{instance_destroy();}
	if instance_place(x,y+vspd,oCol) 
	{grounded = true;}
	if grounded 
	{disappear--;}
	
	collide();
} else {y += vspd;}
image_alpha = disappear%2;