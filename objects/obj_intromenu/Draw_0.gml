draw_self();

var xx = optionXOff;
var yy = 145;

draw_text_selected(xx + 5, yy, "START", (selected == 0));
draw_text_selected(xx + 72, yy, "EDIT", (selected == 1));
draw_text_selected(xx + 120, yy, "QUIT", (selected == 2));