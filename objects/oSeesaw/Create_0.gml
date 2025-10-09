event_inherited()


gspd = 0;
maxgspd = 1

type = noone 
op = noone
rope = noone

tile = 16;
limit = ystart-tile*4;
rx = x+tile*8;
ry = y+tile;

alarm[0] = 3;

fall = false;

if global.hardmode {x+=8}