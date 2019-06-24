$fs = 0.2;
$fa = 1;

difference() {
	minkowski() {
		cube([40, 5, 5]);
		scale([1, 1, 0]) {
			cylinder(r=5, h=1);
		}
	}
	translate([38, 0, -1]) {
		minkowski() {
			cube([2, 5, 7]);
			scale([1, 1, 0]) {
				cylinder(r=4.7, h=1);
			}
		}
	}
}
translate([0, 0, 5]) {
	linear_extrude(height=1) {
		text("IM241.06", size=5);
	}
}