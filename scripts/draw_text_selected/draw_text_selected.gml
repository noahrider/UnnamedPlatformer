function draw_text_selected(x, y, string, condition, color = c_select) {
	var reset = draw_get_color();
	
	if (condition) draw_set_color(color);
	draw_text(x, y, string);
	draw_set_color(reset);
}