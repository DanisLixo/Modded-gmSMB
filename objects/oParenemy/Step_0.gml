//nes_flicker()
bleed();

var _other = instance_place(x+facingdir,y,oParenemy);

if state = es.patrol
{
	if place_meeting(x+facingdir,y,oCol) 
	&& !place_meeting(x+facingdir,bbox_bottom+8,oSlope) 
	&& cheeptype == -1
	{facingdir = -facingdir;}
	
	if _other 
	&& (_other.state != es.die 
	&& _other.state != es.shellhit) 
	&& !instance_place(x,y,oParenemy)
	{_other.facingdir = -_other.facingdir; facingdir = -facingdir;}
}

if _other && _other.state = es.shellhit
&& state != es.die && state != es.stomp 
&& stomptype != 4
{
	instance_place(x+facingdir,y,oParenemy).shellcombo++
	points(instance_place(x+facingdir,y,oParenemy).shellcombo,true)
	sfx(sndKick,0);
	vspd = -2;
	if instance_place(x+facingdir,y,oParenemy).object_index = oFakeBowser {die = true;}
	else {state = es.die;}
	dieface = sign(instance_place(x+facingdir,y,oParenemy).hspd);
}

if shellcooldown > 0
{shellcooldown --;}

if state = es.stomp
{
	stomptimer --;
	if stomptimer < 0
	{
		if global.enymulti {
			var new_ = instance_create_depth(x-8,y-4,depth,object_index);
			new_.dup = true;
			new_.vspd = -4;
			
			new_ = instance_create_depth(x+8,y-4,depth,object_index);
			new_.dup = true;
			new_.vspd = -4;
			new_.facingdir = 1;
			
			multiply = false;
		}
		
		instance_destroy();
	}
}


if state = es.die
{
	if global.enymulti && multiply {
		var new_ = instance_create_depth(x-8,y-4,depth,object_index);
		new_.dup = true;
		new_.vspd = -4;
		
		new_ = instance_create_depth(x+8,y-4,depth,object_index);
		new_.dup = true;
		new_.vspd = -4;
		new_.facingdir = 1;
		
		multiply = false;
	}
	
	hspd = dieface*1.5;
	vspd += 0.15;
	image_yscale = -abs(image_yscale);
	
	if stomptype < 3 and cheeptype = -1 {x += hspd;}
	y += vspd;
}


if !is_onArena()
{
	var cx = camera_get_view_x(view_camera[0])
	if x-16 < cx + SCREENW && state = es.frozen
	{state = es.patrol;}
}

var m = instance_place(x+8*facingdir,y,oMario);

if m && global.moveEnys = true && m.state = ps.nah
{
	facingdir = -facingdir
	//x += hspd; // I like this one specifically, he simply stops the enemy (no objectfication).
	sfx(sndBump,0);
}