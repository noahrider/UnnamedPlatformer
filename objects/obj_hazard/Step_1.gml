var sx, sy, sw, sh;
if (!instance_exists(obj_atlas)) return;
with (obj_atlas) {
		sx = (x - sprite_get_xoffset(sprite_index));
		sy = (y - sprite_get_yoffset(sprite_index));
		sw = sprite_width;
		sh = sprite_height;
}

if (global.action == 0 && rectangle_in_rectangle(x, y, x + sprite_width, y + sprite_height, obj_atlas.bbox_left, obj_atlas.bbox_top, obj_atlas.bbox_right, obj_atlas.bbox_bottom)) {
	scr_death();
}