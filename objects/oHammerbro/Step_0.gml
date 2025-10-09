if mario_freeze()	{exit;}

event_inherited();

hspd = 0.3*c
facingdir = sign(instance_nearest(x,y,oMario).x-x)
 		
if x < xstart-16 {
	c = 1;
}
else if x > xstart {
	c = -1;
}

if onview() and state == es.patrol {
	jumptimer--
	if hammertimer > 0 {hammertimer--}
	if aightcomehere > 0 {aightcomehere--}
}

if state = es.patrol {
	
	if jumptimer >= 0 {
		collide();
		
		jump = "big";
		
		if jumptimer = 0 {
			if actual < lowest && canjumplow {jump = choose("tiny", "big");}
			else if actual >= lowest {jump = "big";}
			else if actual < 80 {jump = "tiny";}
			
			if jump == "big" {vspd = -8;}
			if jump == "tiny" {vspd = -4;}
			jumptimer = -1;
		}
		if instance_place(x,y+4,oCol) || instance_place(x,y+4,oSemicol)
		{actual = bbox_bottom}
	}
	else {
		if vspd < -4 || jumptimer < -30 {vspd += 0.4; y += vspd;}
		else {collide();}
		
		jumptimer--;
		
		if (jump == "tiny" 
		&& (instance_place(x,bbox_top-vspd,oCol) || instance_place(x,bbox_top-vspd,oSemicol)) 
		&& jumptimer < -30)
		|| jump == "big"
		{jump = "";}
		
		if vspd > 0 and jump == ""  && !(instance_place(x,y,oCol) || instance_place(x,y,oSemicol)) {
			jumptimer = 180; //vspd = 0;
		}
	}
}
if state = es.die {
	if bboxturn {y = bbox_top-20; bboxturn = false; /*points(1000,true)*/}
	hspd = dieface*1.5;
	image_index = 0;
	if blocked {x += hspd;}
}


if hammertimer <= 15 and state = es.patrol {
	var hammer = noone;
	spr = sHammerbro_ready;
	if hammertimer = 15 
	{hammer = instance_create_depth(x,bbox_top-4,depth-1,oHammer); streak++;}
	if instance_exists(hammer) {
		hammer.facingdir = oMario.x > x? 1 : -1;
		hammer.holder = id;
		hammer.alarm[0] = 10;
		if hammertimer == 0 {
			spr = sHammerbro; 
			if streak < 2 {hammertimer = choose(45,45,120);} else {hammertimer = 120;}
		}
	} else {
		spr = sHammerbro; 
		if streak < 2 {hammertimer = choose(45,45,120);} else {hammertimer = 120;}
	}
	if hammertimer == 120 
	{
		streak = 0;
	}
}

if aightcomehere <= 500 and aightcomehere != -1 {
	if aightcomehere <= 0 || instance_nearest(x,y,oMario).x > x {aightcomehere = -1; xstart = x}
	c = sign(instance_nearest(x,y,oMario).x-x)*1.75; 
	if instance_place(x+facingdir*16,y,oCol) {jumptimer = -1; vspd = -10;} else {jumptimer = 50; lowest = bbox_bottom;}
}

if place_meeting(x,y,oBullet) {state = es.die; instance_destroy(oBullet)}