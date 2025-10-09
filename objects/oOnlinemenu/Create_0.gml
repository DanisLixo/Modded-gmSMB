allowMoviment = false

alarm[0] = 2;

depth = -9999

menu = ds_grid_create(5,9)
optionsnum = array_create(5,0)

section = 0;
sel = 0;
	
menuind = 0

xx = 0
yy = 0

addmenu = function(sec,pos,label)
{
	menu[# sec,pos] = label
	optionsnum[sec] += 1;
}

addmenu(0,0,"JOIN")
addmenu(0,1,"HOST")
addmenu(0,2,"PLYRS VISIBILITY")
	
addmenu(1,0,"USERNAME - ")
addmenu(1,1,"SET IP - ")
addmenu(1,2,"SET PORT - ")
addmenu(1,3,"JOIN GAME")

addmenu(2,0,"SET PORT - ")
addmenu(2,1,"MAX PLAYERS - ")
addmenu(2,2,"HOST GAME")

for (var i = 0; i < ds_grid_width(menu); i++) { //easiest shit ever... you know, using this a year ago would be helpful... yeah...
    for (var j = 0; j < ds_grid_height(menu); j++) {
		if menu[# i, j] == 0 {
			addmenu(i,j,"BACK")
			break;
		}
	}
}