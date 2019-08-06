//Settings.
calendar_radius = 15.2; //Has 0.2mm play!
thickness = 3;
width = 20;
extra_spacing = 1;
steel_thickness = 2;
length = thickness + steel_thickness + extra_spacing + calendar_radius;
back_hook_length = 10;
down_hook_length = 6;
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
	translate([length - thickness, -thickness / 2, 0]) {
		cube([thickness, thickness, width]);
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
translate([length, -thickness / 2, calendar_radius + thickness]) {
	rotate([-90, 0, 0]) {
		difference() {
			cylinder(r=calendar_radius + thickness, h=thickness * 2);
			translate([0, 0, thickness]) {
				cylinder(r=calendar_radius, h=thickness + 1);
			}
		}
	}
}