include <fillet.scad>

$fn = 180;

fillet(r=50, steps=120) {
	cube([180, 10, 2]);
	cube([10, 70, 2]);
	translate([170, 0, 0]) {
		cube([10, 70, 2]);
	}
}
multmatrix([[1, 0, 0, 0], [0, 1, -1, 0], [0, 0, 1, 0], [0, 0, 0, 1]]) {
	cube([180, 2, 5]);
}

module rest() {
	multmatrix([[1, 0, 0, 0], [0, 1, 1, 0], [0, 0, 1, 0], [0, 0, 0, 1]]) {
		cube([10, 2, 100 / sqrt(2)]);
	}
	intersection() {
		translate([0, 17, 8]) {
			rotate([0, 90, 0]) {
				difference() {
					cylinder(h=10, r=10);
					cylinder(h=11, r=8);
				}
			}
		}
		cube([10, 17, 7]);
	}
}

translate([15, 2, 2]) {
	rest();
}
translate([155, 2, 2]) {
	rest();
}