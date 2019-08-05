//Settings.
width = 20;
length = 40;
thickness = 3;
hook_length = 6;
steel_thickness = 1;
$fs = 0.2;
$fa = 1;

module corner() {
	cylinder(r = thickness / 2, h=width);
}
module spaced_corner() {
	intersection() {
		translate([thickness / 2, thickness / 2, 0]) {
			cylinder(r = thickness, h=width);
		}
		translate([-thickness / 2, -thickness / 2, 0]) {
			cube([thickness, thickness, width]);
		}
	}
}

hull() {
	spaced_corner();
	translate([0, hook_length, 0]) {
		corner();
	}
}
hull() {
	spaced_corner();
	translate([length + thickness, 0, 0]) {
		corner();
	}
}
translate([thickness + steel_thickness, 0, 0]) {
	hull() {
		corner();
		translate([0, -hook_length, 0]) {
			corner();
		}
	}
}
translate([length + thickness, 0, 0]) {
	hull() {
		corner();
		translate([0, hook_length, 0]) {
			corner();
		}
	}
}