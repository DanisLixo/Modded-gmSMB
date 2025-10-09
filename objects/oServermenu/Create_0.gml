changemode = false;
c = 0
cmsel = 0;
cmsec = 0;

cmoptions = ds_grid_create(2,9)
cmbool = ds_grid_create(2,9)
cmvalue = ds_grid_create(2,9)
addcm = function(sec,pos,label,isforbool = false, value = "nothin")
{
	if isforbool {cmbool[# sec,pos] = label}
	else {cmoptions[# sec,pos] = label} 
	cmvalue[# sec,pos] = value;
}

addcm(0,0,"Guns");						addcm(0,0,"schutmode", true)
addcm(0,1,"Dark mode");					addcm(0,1,"rtxmode", true)
addcm(0,2,"Commander");					addcm(0,2,"commandenys", true)
addcm(0,3,"PvP");						addcm(0,3,"pvp", true)
addcm(0,4,"Hard mode")					addcm(0,4,"hardmode", true)
addcm(0,5,"Characters abilities");		addcm(0,5,"abilities", true)
addcm(0,6,"Arena time limit - ");		addcm(0,6,"time", true, "gtime") gtime = 0;
addcm(0,7,"Race");						addcm(0,7,"race", true)
addcm(0,8,"Nothing");					addcm(0,8,-1, true)

addcm(1,0,"Challenge");					addcm(1,0,"challenge", true)
addcm(1,1,"Collision");					addcm(1,1,"playercol", true)
addcm(1,2,"Begin on extra");			addcm(1,2,"extra", true)
addcm(1,3,"Arena WIP - ");				addcm(1,3,"arena", true, "ga") ga = 0
addcm(1,4,"World - ");					addcm(1,4,"world", true, "gwor") gwor = 1
addcm(1,5,"Level - ");					addcm(1,5,"level", true, "glev") glev = 1
addcm(1,6,"Teleport to level")			addcm(1,6,"teleport_tolvl", true)
addcm(1,7,"Begin game")					addcm(1,7,-1, true)
addcm(1,8,"Disconnect")					addcm(1,8,-1, true)

nothin = -1

global.teleport_tolvl = true;