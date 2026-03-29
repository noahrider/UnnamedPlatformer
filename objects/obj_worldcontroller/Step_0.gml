if (!instance_exists(obj_atlas)) return;

if (obj_atlas.y > room_width + 12 && global.action == 0) {
	scr_death();
}