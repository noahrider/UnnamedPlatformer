function draw_rectangle_solid(x1, y1, x2, y2, color = draw_get_color(), outline = false) {
	var reset = draw_get_color();
	draw_set_color(color);
	draw_rectangle(x1, y1, x2, y2, outline);
	draw_set_color(reset);
}