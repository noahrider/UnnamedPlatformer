if (!is_debug_overlay_open()) {
	draw_text(5, 5, "Press [TAB] to open the editor menu!");
}


if (pastedata) {
	draw_set_alpha(0.7);
	draw_rectangle_solid(0, 0, 640, 480, c_black);
	draw_set_alpha(1);
	draw_text_align(320, 20, "Please paste in your data.");
}