if (progress == 1) {
	time++;
	x = lerp(x, 0, time / seconds(2));
	optionXOff = lerp(optionXOff, 110, clamp(time - seconds(0.4), 0, seconds(2)) / seconds(2));
	if (optionXOff == 110 && alarm[1] == -1) {
		alarm[0] = 1;
		menuBuffer = 5;
	}
}
if (progress == 3) {
	time++;
	x = lerp(x, -sprite_width, time / seconds(2));
	optionXOff = lerp(optionXOff, 480, time / seconds(2));
	if (optionXOff == 480) {
		dosomething();
	}
}


//MENU BUFFER CHECK
if (menuBuffer > 0) menuBuffer--;
if (menuBuffer != 0) return;
	

if (keyboard_check_pressed(vk_left)) {
	selected--;
	if (selected == -1) selected = 2;
}
if (keyboard_check_pressed(vk_right)) {
	selected++;
	if (selected == 3) selected = 0;
}

if (keyboard_check_pressed(vk_space)) {
	if (selected == 0) { //START
		progress = 3;
		menuBuffer = -1;
		dosomething = function(){room_goto(room_worldselect)}
	} else if (selected == 1) { //EDIT
		progress = 3;
		menuBuffer = -1;
		dosomething = function(){room_goto(room_editor)}
	} else if (selected == 2) { //EXIT
		progress = 3;
		menuBuffer = -1;
		dosomething = function(){game_end();}
	}
}