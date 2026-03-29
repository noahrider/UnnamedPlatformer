draw_text_align(160, 20, $"UP ({VERSION})");

for (var i = 0; i < array_length(options); i++) {
	draw_set_color(selected == i ? c_select : c_white);
	draw_text(120, 100 + (20 * i), options[i]);
	draw_set_color(c_white);
}