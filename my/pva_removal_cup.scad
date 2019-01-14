//Measurements.
cup_radius = 81.4 / 2;
cavity_height = 18.3;
socket_width = 9;
socket_height = 11;

//Settings.
play = 0.2;
total_height = cavity_height + 30;
thickness = 2;
$fs = 0.2;
$fa = 1;

//Don't change below!
difference() {
	cylinder(r=cup_radius + 2 + play, h=total_height);
	translate([0, 0, thickness]) {
		cylinder(r = cup_radius + play, h=total_height - thickness);
	}
	translate([0, -socket_width / 2 - play, thickness + cavity_height - socket_height - play]) {
		cube([cup_radius + thickness + play, socket_width + 2 * play, socket_height + 2 * play]);
	}
}