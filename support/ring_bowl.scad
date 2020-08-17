$fs = 0.4;
$fa = 1;

module ring(outer, inner) {
	translate([0, 0, -2]) {
		difference() {
			cylinder(r=outer, h=4);
			translate([0, 0, -1]) {
				cylinder(r=inner, h=6);
			}
		}
	}
}

intersection() {
	union() {
		ring(20, 18);
		rotate([90, 0, 0]) {
			ring(21, 18);
		}
		rotate([0, 90, 0]) {
			ring(21, 18);
		}
	}
	sphere(r=20);
	translate([0, 0, -2]) {
		cylinder(r=20, h=22);
	}
}