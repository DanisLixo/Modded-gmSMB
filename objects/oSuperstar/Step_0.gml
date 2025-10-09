c++;
image_yscale = image_xscale;

if !appeared {image_angle++;}
else {
	image_angle = 0;
	y += sin(current_time/800)*0.05;
}

if c > 12
{
	instance_create_depth(x-16,y,depth-1,o1UPSparkles).draw = "game"; c = 0;
}

if image_xscale < 1 {image_xscale += 0.1;}
if image_xscale > 1 {image_xscale -= 0.1;}
if image_xscale == 1 && !appeared {image_xscale = 1.4; appeared = true;}