//Settings.
width = 20;
length = 45;
thickness = 3;
back_hook_length = 10;
down_hook_length = 6;
front_hook_length = 10;
front_incline = 14;
steel_thickness = 2;
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
	translate([0, back_hook_length, 0]) {
		corner();
	}
}
hull() {
	spaced_corner();
	translate([thickness + steel_thickness, 0, 0]) {
		corner();
	}
}
hull() {
	translate([thickness + steel_thickness, 0, 0]) {
		corner();
	}
	translate([thickness + length, front_incline, 0]) {
		corner();
	}
}
translate([thickness + steel_thickness, 0, 0]) {
	hull() {
		corner();
		translate([0, -down_hook_length, 0]) {
			corner();
		}
	}
}
translate([length + thickness, front_incline, 0]) {
	hull() {
		corner();
		translate([0, front_hook_length, 0]) {
			corner();
		}
	}
}