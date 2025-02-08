//Measurements.
radius = 51.1 / 2;

//Settings.
play = 0.2;
thickness = 1;
ledge = 5;
length = 38.3;
$fs = 0.6;
$fa = 0.1;

//The design.
difference() {
	union() {
		cylinder(r1=radius + play + ledge, r2=radius + play + ledge + thickness / 2, h=thickness);
		cylinder(r=radius - play, h=thickness + length);
	}
	translate([0, 0, -1]) {
		cylinder(r=radius - play - thickness, h=length + thickness + 2);
	}
}