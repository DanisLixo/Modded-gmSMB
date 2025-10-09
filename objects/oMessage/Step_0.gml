var cameraposx = (room_width/2)-camera_get_view_width(view_camera[0])/2;
camera_set_view_pos(view_camera[0],cameraposx,0);

if !pressedEnter {image_index = 0;}
else 
{
	if !global.demo {audio_stop_sound(musOW_c3);}
	image_index = 1;
	alarn++;
	if alarn mod 10 == 0 {
		ind++;
		if ind > 2 {ind = 0;}
	}
	if alarn > 104 {room_goto(rmTitle)}
}
if (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(global.menukj) || (os_type == os_android && mouse_check_button_pressed(mb_left))) {
	if pressedEnter {room_goto(rmTitle)}
	else {pressedEnter = true; sfx(sndTitleconfirm_dx,0);}
}