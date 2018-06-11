$fs = 0.1;
$fa = 1;

extruder = 1;

module candycane() {
	linear_extrude(height = 100) {
		circle(r = 5);
	}
	translate([20, 0, 100]) {
		difference() {
			rotate([90, 0, 0]) {
				rotate_extrude(convexity = 2) {
					translate([-20, 0, 0]) {
						circle(r = 5);
					}
				}
			}
			translate([-25, -5, -25]) {
				cube([50, 10, 25]);
			}
		}
	}
	translate([40, 0, 80]) {
		linear_extrude(height = 20) {
			circle(r = 5);
		}
	}
}

intersection() {
	rotate([0, 45, 0]) {
		candycane();
	}
	translate([-5, -5, -5 + 10 * extruder]) {
		cube([200, 10, 10]);
		translate([0, 0, 20])
			cube([200, 10, 10]);
		translate([0, 0, 40])
			cube([200, 10, 10]);
		translate([0, 0, 60])
			cube([200, 10, 10]);
		translate([0, 0, 80])
			cube([200, 10, 10]);
	}
}