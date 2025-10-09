oGame.loadscreen = -1

global.hiddenoneup = false;

global.secrets_found = 0;
global.demo = true;

for (var i = 0; i < 7; i++) 
{global.foundSecret[i] = false;}

oGame.savedpowerup = "s";
oGame.p2savedpowerup = "s";
global.score = 0;
global.p2_score = 0;
global.coins = 0;
global.p2_coins = 0;
global.level = 1;
global.time = -1;

global.level_score = 0;
global.level_coins = 0;
global.level_p2_score = 0;
global.level_p2_coins = 0;

global.freecam = false;
global.schutmode = false;
global.rtxmode = false;
global.commandenys = false;
global.scaled = false;

global.extra = false;

global.titleroom = global.titlerooms[global.titleroomSelected].room;
global.letterboxSprite = global.letterboxes[global.letterboxSelected].spr;