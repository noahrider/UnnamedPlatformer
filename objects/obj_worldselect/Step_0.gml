if (image_alpha < 1 && fadein) {
	image_alpha += 0.05;
	if (image_alpha >= 1) {
		image_alpha = 1;
		fadein = false;
		menuBuffer = 3;
	}
}
if (image_alpha > 0 && fadeout) {
	image_alpha -= 0.05;
	if (image_alpha <= 0) {
		image_alpha = 0;
		fadeout = false;
		dosomething();
	}
}

//MENU BUFFER CHECK
if (menuBuffer > 0) menuBuffer--;
if (menuBuffer != 0) return;
	


if (keyboard_check_direct(vk_escape)) {
	menuBuffer = -1;
		fadeout = true;
		dosomething = function(){
			room_goto(room_intromenu);
		}
}
	

if (keyboard_check_pressed(vk_left)) {
	if (selected != 0) {
		menuBuffer = -1;
		fadeout = true;
		dosomething = function(){
			selected--;
			fadein = true;
		}
	}
}
if (keyboard_check_pressed(vk_right)) {
	if (selected != array_length(worlds) - 1) {
		menuBuffer = -1;
		fadeout = true;
		dosomething = function(){
			selected++;
			fadein = true;
		}
	}
}
if (keyboard_check_pressed(vk_up)) {
	if (selectedWorld > 0) selectedWorld--;
}
if (keyboard_check_pressed(vk_down)) {
	if (selectedWorld < array_length(worlds[selected].levelNames) - 1) selectedWorld++;
}

if (keyboard_check_pressed(vk_space)) {
	global.world = selected;
	fadeout = true;
	menuBuffer = -1;
	dosomething = function(){
		global.level.file = worlds[global.world].levelFileLocs[selectedWorld];
		for (var i = 0; i < array_length(worlds); i++) {
			global.levelList[i] = worlds[global.world].data[i];
		}
		global.levelnum = 0;
		room_goto(room_loadlevel);
	};
}