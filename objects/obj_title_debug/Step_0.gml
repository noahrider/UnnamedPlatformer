if (keyboard_check_pressed(vk_space)) {
	if (selected == 0) {
		room_goto_next();
	} else if (selected == 1) {
		room_goto(room_editor);
	} else if (selected == 2) {
		room_goto(testroom);
	}
}

if (keyboard_check_pressed(vk_up)) {
	selected -= 1;
	if (selected == -1) selected = (array_length(options) - 1);
}

if (keyboard_check_pressed(vk_down)) {
	selected += 1;
	if (selected == array_length(options)) selected = 0;
}