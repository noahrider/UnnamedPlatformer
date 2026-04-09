if (collision_object(obj_atlas, false, false) && global.action == 0) {
	if (room != room_editor) {
		global.action = 1;
		instance_create_depth(0, 0, 0, obj_winlevel);
	} else {
		obj_editor.preview = false;
		global.timescale = 0;
		global.action = 1;
	}
}