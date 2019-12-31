$fs = 0.5;
$fa = 1;

difference() {
	union() {
		hull() {
			translate([-10, 0, 0]) {
				cylinder(r=20, h=0.01);
			}
			translate([10, 0, 0]) {
				cylinder(r=20, h=0.01);
			}
			translate([0, 0, 40]) {
				sphere(r=15);
			}
		}

		hull() {
			translate([0, 0, 40]) {
				sphere(r=15);
			}
			translate([0, 15, 15]) {
				sphere(r=10);
			}
		}
	}
	translate([-10, 15, 40]) {
		sphere(r=5);
	}
	translate([10, 15, 40]) {
		sphere(r=5);
	}
}