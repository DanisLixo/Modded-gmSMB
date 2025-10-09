x = view_wport[0]/2;
y = view_hport[0]/2;
image_xscale -= 0.0005
image_yscale -= 0.0005

if memesdemaise = false {image_alpha += 0.01}
else {
	alarm_is_mid++
	image_alpha -= 0.01
	if image_alpha <= 0.02 {
		image_xscale += 0.0005
		image_yscale += 0.0005
		image_alpha += 0.01
		room_goto(rmWarning)
	}
}
if image_alpha >= 1 {
	image_alpha = 1
	if memesdemaise = false {alarm_is_mid++}
}

if alarm_is_mid >= 60*2.5 {
	memesdemaise = true
}

if (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(global.menukj) || (os_type == os_android && mouse_check_button_pressed(mb_left)))
{room_goto(rmWarning)}