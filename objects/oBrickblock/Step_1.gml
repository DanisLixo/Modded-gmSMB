if !onview()
{exit;}

if global.environment = e.underground
{
	if instance_number(oBrickblock) < 35
	{image_index = 1; hitblockimage = 3;}
	else {image_index = 2; hitblockimage = 3;}
}
else
{image_index = 0; hitblockimage = 2;}





