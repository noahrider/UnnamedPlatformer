if (collision_object(obj_atlas, false, false) && global.action == 0) {
	global.action = 1;
	instance_create_depth(0, 0, 0, obj_winlevel);
}