//https://forum.gamemaker.io/index.php?threads/can-i-make-sprites-accept-decimal-offsets.35940/post-221606
function draw_sprite_pivot(sprite, subimg, px, py, x, y, xscale, yscale, rot, colour, alpha) {
/// draw_sprite_pivot(sprite, subimg, px, py, x, y, xscale, yscale, rot, colour, alpha)
	var l_sprite = sprite;
	var l_subimg = subimg;
	var l_rx = px - sprite_get_xoffset(l_sprite);
	var l_ry = py - sprite_get_yoffset(l_sprite);
	var l_x = x;
	var l_y = y;
	var l_sx = xscale;
	var l_sy = yscale;
	var l_rot = rot;
	var l_col = colour;
	var l_a = alpha;
	l_x -= (lengthdir_x(l_rx, l_rot) + lengthdir_x(l_rx, l_rot - 90)) * l_sx;
	l_y -= (lengthdir_y(l_rx, l_rot) + lengthdir_y(l_rx, l_rot - 90)) * l_sy;
	draw_sprite_ext(l_sprite, l_subimg, l_x, l_y, l_sx, l_sy, l_rot, l_col, l_a);
}