#region Controls
kr = -1
kl = -1
kd = -1
ku = -1

kj = -1
ka = -1
kh = -1

kjp = -1
kap = -1
khp = -1

kar = -1
khr = -1 

krp = -1
klp = -1
kup = -1
kdp = -1
#endregion

spawned = false;
alarm[0] = 10;

hspd = 0;
vspd = 0;
grounded = false;
collidecode = false;
combo = 0
mycapeative = false;
in_cutscene = false;

swimmin = 0;
bubble = 60;

state = ps.normal;

if string_pos("Title",room_get_name(room)) != 0 
{state = ps.title;}

char = global.player;

spr = -1
ind = 0;
scale = 1
yoff = 0;
crouch = false;

holdjump = -1
jumpbuffer = 0;
releasedrunmidjump = false;
climb = 0;

gethit = 0;
dietimer = 0;
flagpoletimer = 0;
castleendingtrigger = false;
powerup = "s";
if instance_exists(oGame)
{powerup = oGame.savedpowerup;}

firetimer = 0;
firedraw = false;

starman = 0;
invincible = 0;

pipeinforoom = noone;

dancechance = random(100);

finishedrace = false;

// Wario Vars
shoulderbash = 0;

// Dawn Vars
retrochance = random(100)
doubleJumped = false;

// Sonic Vars
spinboost = 0;
spinclicks = 0;
spin = false
sdcheck = false;
sound = false;

// Feathy Vars
spintimer = 0
fly = false
pmach = 0;
pmet = 0

// Peppino Vars
taunttimer = 0
tauntstate = 0
pepdancin = 0

// Max Verstappen Multiplayer Var
insidecar = false;

if instance_exists(oBeanstalk) && instance_nearest(x,y,oBeanstalk).emerge = true && distance_to_object(instance_nearest(x,y,oBeanstalk)) <= 32
{state = ps.emerge; depth = instance_nearest(x,y,oBeanstalk).depth-10; x = instance_nearest(x,y,oBeanstalk).x+8; y = room_height+32; }