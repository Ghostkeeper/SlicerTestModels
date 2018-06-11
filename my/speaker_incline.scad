incline = 14; //Incline of the speaker in degrees.
length = 224; //Length of the speaker in millimetres.
width = 40; //Width of the footing.
wider_base = 10; //The base can be a bit wider.
thickness_base = 10;

$fa = 1;
$fs = 0.1;
/////////////////

height = sin(incline) * length;

difference() {
	minkowski() {
		translate([0, -sin(incline) * height, 0]) {
			cube([width, sin(incline) * height + cos(incline) * length, height + thickness_base]);
		}
		translate([0, 0, -height - thickness_base]) {
			cylinder(h=height + thickness_base, r1=wider_base, r2=0);
		}
	}
	translate([-wider_base, -wider_base - sin(incline) * height, -height - thickness_base]) {
		cube([width + wider_base * 2, sin(incline) * height + cos(incline) * length + wider_base * 2, height + thickness_base]);
	}
	translate([-wider_base, 0, thickness_base]) {
		rotate([incline, 0, 0]) {
			cube([width + wider_base * 2, length, length]);
		}
	}
}