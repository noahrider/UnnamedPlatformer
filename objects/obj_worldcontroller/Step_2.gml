///@description Camera

var at;
at = obj_atlas;
if (!instance_exists(at)) return;
	
var idealw = 640;
var idealh = 480;

cameraw_set(idealw * ((docamsize) ? camsize : cameraw()/idealw));
camerah_set(idealh * ((docamsize) ? camsize : camerah()/idealh));
camerax_set(clamp(
	round(at.x - cameraw() / 2 + at.sprite_width/2),
	0,
	room_width - cameraw()
));
cameray_set(clamp(
	round(at.y - camerah() / 2 + at.sprite_height/2),
	0,
	room_height - camerah()
));
x = camerax();
y = cameray();