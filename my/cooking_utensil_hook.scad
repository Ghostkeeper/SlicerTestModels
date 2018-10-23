$fn = 150;

screw_outer_radius = 3.7;
screw_shaft_radius = 1.5;
pin_radius = 4.5;

difference() {
	hull() {
		cylinder(r=7.5, h=2);
		translate([20, 0, 0]) {
			cylinder(r=pin_radius, h=10);
		}
	}
	translate([0, 0, 3.3]) {
		cylinder(r=screw_outer_radius, h=10);
	}
	cylinder(r=screw_shaft_radius, h=10);
}
translate([0, 0, 10]) {
	rotate([90, 0, 0]) {
		rotate_extrude(angle=40, convexity=2, $fn=300) {
			translate([20, 0]) {
				circle(r=pin_radius);
			}
		}
	}
}
translate([0, 0, 10]) {
	rotate([0, -40, 0]) {
		translate([20, 0, 0]) {
			sphere(r=pin_radius);
		}
	}
}