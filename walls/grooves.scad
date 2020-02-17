$fs = 0.3;
$fa = 1;

difference() {
	union() {
		multmatrix([[1, 0, 0.2], [0, 1, 0], [0, 0, 1]]) {
			cube(40);
		}
		cube(40);
		translate([-1, -1, 0]) {
			cube([16, 16, 41]);
		}
		translate([-1, 16, 0]) {
			cube([16, 25, 41]);
		}
		translate([16, -1, 0]) {
			cube([24, 16, 41]);
		}
		translate([16, 16, 0]) {
			cube([24, 25, 41]);
		}
		multmatrix([[1, 0, 0.2], [0, 1, 0], [0, 0, 1]]) {
			translate([16, -1, 0]) {
				cube([25, 16, 41]);
			}
			translate([16, 16, 0]) {
				cube([25, 25, 41]);
			}
		}
	}
	translate([-2, -2, 20]) {
		cube([2, 2, 22]);
	}
	translate([15.5, 15.5, 0]) {
		cylinder(r=3, h=42);
	}
}