draw_self();

//draw_text(camerax()+20, cameray()+20, $"canJump: {canJump}")

if (global.settings.debug.showHitboxes) {
	var sx = (x - sprite_get_xoffset(sprite_index));
	var sy = (y - sprite_get_yoffset(sprite_index));
	draw_rectangle_solid(sx, sy, sx + sprite_width, sy + sprite_height, c_lime, true);
}