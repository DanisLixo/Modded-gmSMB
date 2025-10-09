allowMoviment = false;

alarm[0] = 2;

menu = ds_list_create();

timetoparty = rmLeveltransition;

sel = 1;

addmenu = function(pos,label)
{
	menu[| pos] = label;
}
	
addmenu(0,"EXTRA LEVELS")
addmenu(1,"   PLAYER GAME")
addmenu(2,"LEVEL SELECT")
addmenu(3,"NETWORK GAME")
addmenu(4,"OPTIONS")