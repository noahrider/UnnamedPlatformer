if (mode == MODE.BUILD) {
	if (objectToPlace != noone) {
		var sprite = object_get_sprite(objectToPlace);
		if (variable_struct_exists(objectPlaceStruct, "sprite_index") && !is_mouse_over_debug_overlay()) {
			sprite = objectPlaceStruct.sprite_index;
		}
		draw_sprite_ext(sprite, 0, mouse_x, mouse_y, 1, 1, 0, c_white, settings.snapToGrid ? 0.7 : 1);
		if (settings.snapToGrid) draw_sprite_ext(sprite, 0, floor(mouse_x / 16) * 16, floor(mouse_y / 16) * 16, 1, 1, 0, c_white, 1);
	}
} else if (mode == MODE.EDIT) {
	if (keyboard_check_direct(vk_shift)) {
		draw_rectangle_solid(mouse_x - 4, mouse_y - 4, mouse_x + 4, mouse_y + 4, c_blue, true)
	}
} else if (mode == MODE.DELETE) {
	
}