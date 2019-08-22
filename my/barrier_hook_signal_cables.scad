//Settings.
width = 20;
length = 22;
thickness = 3;
back_hook_length = 10;
down_hook_length = 6;
steel_thickness = 2;
cable1_radius = 6.2 / 2 + 0.4; //Some extra play.
cable2_radius = 3.7 / 2 + 0.4;
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
difference() {
	hull() {
		spaced_corner();
		translate([length + thickness, 0, 0]) {
			corner();
		}
	}
	translate([length + thickness / 2 + steel_thickness, -thickness / 2 - 1, 0]) {
		rotate([-90, 0, 0]) {
			translate([0, -width / 3, 0]) {
				cylinder(r=cable1_radius, h=thickness + 2);
			}
			translate([0, -width * 2 / 3, 0]) {
				cylinder(r=cable2_radius, h=thickness + 2);
			}
		}
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