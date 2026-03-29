if (!global.debug) return;
var info = [];
if (d_InfoText._roominfo) array_push(info, $"{room_get_name(room)} ({real(room)})");
if (d_InfoText._fps) array_push(info, $"fps: {fps}"); //  ({round(fps_real)})

var menuy = 25;
draw_set_color(d_InfoText.color);
for (var i = 0; i < array_length(info); i++) {
	draw_set_halign(fa_right);
	draw_text(635, menuy + (20 * i), info[i]);
	draw_set_halign(fa_left);
}
draw_set_color(c_white);