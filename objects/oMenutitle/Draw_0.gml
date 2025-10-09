var sprite = sTitle2
if global.titleroom = rmTitle_MK 
{sprite = sTitle}
if global.titleroom = rmTitle_new
{sprite = sTitlex2}

draw_sprite(sprite,oGame.image_index,x,y+16);

if global.player = "Max Verstappen" 
{draw_sprite_ext(sOmaga,0,x-88,y+68,0.8,1.8,0,c_white,1);}