if (global.level.background != layer_background_get_blend(layer_background_get_id("Background"))) {
	layer_background_blend(layer_background_get_id("Background"), global.level.background);
}

with (all) {
	if (id == other.selectedObject) {
		image_blend = c_lime;
	} else {
		image_blend = c_white;
	}
}

if (keyboard_check_direct(vk_control)) {
	if (keyboard_check_pressed(ord("V"))) {
		pastedata = false;
		pastevalue = clipboard_get_text();
		afterpastefunc();
	}
	if (pastedata) return;
	//saving
	if (keyboard_check_pressed(ord("S"))) {
		if (projectName == "") {
			if (keyboard_check_direct(vk_shift)) {
				printf("Attempting to get raw user input for projectName");
				projectName = get_string("Provide the name of the level you want to save.", "");
			} else {
				projectName = get_save_filename_ext("*.upx", "", program_directory, "Select where you want to save this level.");
				if (projectName == "") projectName = (game_save_id + "project.upx");
			}
		}
		printf("saving project to {:1}", projectName);
		if (!string_ends_with(projectName, ".upx")) projectName += ".upx";
		scr_editor_savelevel(projectName);
	}
}

if (pastedata) return;

if (!canPlace && !mouse_check_button_released(mb_left)) {
	canPlace = true;
	mouseHoldTime = 0;
}
if (mouse_check_button(mb_left) && !is_mouse_over_debug_overlay()) {
	//object placement
	var objSelect = collision_rectangle(mouse_x - 4, mouse_y - 4, mouse_x + 4, mouse_y + 4, obj_upobject, false, false);
	if (mode == MODE.BUILD) {
		mouseHoldTime++;
		if (mouseHoldTime > 1 && mouseHoldTime < seconds(1)) {
			if (canPlace) canPlace = false;
			return;
		}
		if (objectToPlace != noone && canPlace && objSelect == noone) {
			var xx = mouse_x;
			var yy = mouse_y;
			if (settings.snapToGrid) {
				xx = (floor(xx / 16) * 16);
				yy = (floor(yy / 16) * 16);
			}
			if (objectToPlace == obj_spawnpoint) instance_destroy(obj_spawnpoint);
			if (objectToPlace == obj_goalpost) instance_destroy(obj_goalpost);
				
			var object = instance_create_depth(xx, yy, 0, objectToPlace, objectPlaceStruct);
			object.objectKey = scr_get_object_key(objectToPlace);
		}
	} else if (mode == MODE.EDIT) {
		if (objSelect != noone) {
			selectedObject = objSelect;
		}
	} else if (mode == MODE.DELETE) {
		if (objSelect != noone) {
			instance_destroy(objSelect);
		}
	}
}

if (mode == MODE.BUILD) {
	
} else if (mode == MODE.EDIT) {
} else if (mode == MODE.DELETE) {
	do {
		if (!keyboard_check_direct(vk_control)) continue;
		if (!keyboard_check_direct(vk_shift)) continue;
		if (!keyboard_check_direct(vk_alt)) continue;
		if (keyboard_check_pressed(vk_backspace)) {
			if (show_question("Are you sure you want to delete EVERY object in the level?\n(THIS CANNOT BE UNDONE!!!!!)")) {
				instance_destroy(obj_upobject);
			}
		}
	} until (true);
}

if (keyboard_check_pressed(vk_f1)) {
	if (os_is_network_connected()) {
		//url_open();
	} else {
		
	}
}

//editor menu
if (keyboard_check_pressed(vk_tab)) {
	if (firstTime && false) {
		ini_open("up.ini");
		ini_write_real("Editor", "firstTime", false);
		ini_close();
		firstTime = false;
		var helpmsg = "";
		helpmsg += "Howdy! This seems like your first time using the editor. \n";
		helpmsg += "To start, open the 'Views' tab, and from there, select anything that starts with 'Editor'. \n";
		helpmsg += "We highly discourage opening the 'Debug' tab, as this is only for if you know what you are doing! \n";
		helpmsg += "Happy making! \n";
		helpmsg += "(you will not see this message again.)";
		show_message(helpmsg);
	}
	ToggleEditorMenu();
}

//preview/play
if (keyboard_check_pressed(ord("P"))) {
	preview = !preview;
	
	if (preview) {
		if (!instance_exists(obj_spawnpoint)) {
			show_message("You need a spawnpoint to play the level!");
			preview = false;
			return;
		}
		global.timescale = 1;
		global.action = 0;
		if (keyboard_check_direct(vk_shift)) {
			obj_atlas.x = obj_spawnpoint.x;
			obj_atlas.y = obj_spawnpoint.y;
		}
	} else {
		global.timescale = 0;
		global.action = 1;
	}
}