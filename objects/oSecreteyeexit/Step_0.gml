if (teleported) {
	oMario.x = x
	oMario.y = y+sprite_get_height(oMario.sprite_index)-12
	oMario.image_alpha = 0;
}

if (destroytimer > 0) {destroytimer--}

if (destroytimer = 0) {
	if (sprite_index != sSecreteye_oofb)
	{sprite_index = sSecreteye_oofb; image_index = 0;}
}

if (sprite_index = sSecreteye_openb && image_index >= 8)
{
	sfx(sndSecretexit,0);

	teleported = false;

	image_index = 0; sprite_index = sSecreteye_idleb; destroytimer = room_speed*3
}

if (!teleported && sprite_index == sSecreteye_idleb)
{
	if (mScale == 1 && oMario.state == -1) 
	{oMario.state = ps.normal; mScale = 2;}
	else if (mScale < 1) {mScale += 0.025; oMario.image_alpha = 0;}
}

if (sprite_index == sSecreteye_oofb && image_index > 4) {instance_destroy()}