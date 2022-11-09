height = 130;
brush_width = 10.7;

include <fillet.scad>;

difference() {
	fillet(r=20, steps=30) {
		cylinder(r1=30, r2=28, h=1, $fn=180);
		translate([-11, 0, 0]) {
			cylinder(r=4, h=height, $fn=180);
		}
		translate([-5, -brush_width / 2 - 1, height + 7]) {
			rotate([-90, 0, 0]) {
				cylinder(r=10, h=brush_width + 2, $fn=180);
			}
		}
	}
	translate([21, 0, 17]) {
		sphere(r=27, $fn=120);
	}
	translate([-5, -brush_width / 2 - 1, height + 7]) {
		rotate([-90, 0, 0]) {
			translate([2, -2, -1]) {
				cylinder(r=10, h=brush_width + 4, $fn=180);
			}
		}
	}
	translate([0, 0, height - 20]) {
		cylinder(r=brush_width / 2, h=40, $fn=180);
	}
}
