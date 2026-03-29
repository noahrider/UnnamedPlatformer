draw_sprite_pivot(sprite_index, image_index, 13.5, 13.5, x + 27, y + 27, image_xscale, image_yscale, image_angle, image_blend, image_alpha);

if (global.settings.debug.showHitboxes) {
	draw_rectangle_solid(x, y, x + sprite_width, y + sprite_height, c_red, true);
}