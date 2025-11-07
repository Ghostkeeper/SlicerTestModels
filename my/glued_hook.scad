include <fillet.scad>;

width = 20;
height = 50;
hook_length = 30;
tip_width=5;
thickness = 2;
$fa = 1;
$fs = 0.2;

fillet(r=hook_length, steps=30) {
	translate([thickness / 2, thickness / 2, 0]) {
		minkowski() {
			cube([width - thickness, height - thickness, thickness]);
			scale([1, 1, 0]) {
				cylinder(h=1, r=thickness / 2);
			}
		}
	}
	translate([width / 2, thickness / 2, thickness]) {
		hull() {
			translate([-width / 2 + thickness / 2, 0, 0]) {
				sphere(thickness / 2);
			}
			translate([width / 2 - thickness / 2, 0, 0]) {
				sphere(thickness / 2);
			}
			translate([0, hook_length / 2, hook_length]) {
				sphere(tip_width / 2);
			}
		}
	}
}