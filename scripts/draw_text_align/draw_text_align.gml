function draw_text_align(x, y, string, halign = fa_center, valign = fa_top) {
	var hreset = draw_get_halign();
	var vreset = draw_get_valign();
	
	draw_set_halign(halign);
	draw_set_valign(valign);
	
	draw_text(x, y, string);
	
	draw_set_halign(hreset);
	draw_set_valign(vreset);
}