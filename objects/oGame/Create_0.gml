init();
loadsettings();
resize_screen();

if os_type == os_windows {instance_create_depth(x,y,depth,oNekoPresence);}

global.titleroom = global.titlerooms[global.titleroomSelected];
global.letterboxSprite = global.letterboxes[global.letterboxSelected];

dep = depth;

if os_type == os_android {texturegroup_load("phonecontroller");}

savedpowerup = "s";
p2savedpowerup = "s";

global.pind = 0
global.p2_pind = 0
global.retros = 0
global.hats = 0;

lastenv = e.underground
loadscreen = 20;
warned = false;

diec = 0;

fireworks = 0;
triggercastleflag = false;

global.prevroom = -1;

timeup = 0;

paused = 0

debugsel = 0;
debug = false;

destroy = 0
delay = 0

spawnx = -1;
spawny = -1;
pitch = 1

fpsDebug = false;