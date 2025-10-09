if teleporting 
{
	oMario.x = x
	oMario.y = y
	oMario.image_alpha = 0;
	timer--
	global.time++
	
	mScale -= (mScale > 0)? 0.025 : 0;
}

if image_index >= 8 && !idle 
{
	sprite_index = sSecreteye_idlea;
	idle = true;
}

if image_index >= 6 && sprite_index = sSecreteye_idleb {sprite_index = sSecreteye_oofb;}
if sprite_index = sSecreteye_oofa && image_index >= 8 {image_alpha = 0;}

if timer = 0 {
	room_goto(troom); 
}