difference() {
	cube([20, 10, 40]);
	translate([10, 0, 20]) {
		cube([10, 10, 10]);
	}
	translate([19.9, 0, 0]) {
		cube([0.1, 10, 10]);
	}
	translate([10, 0, 0]) {
		cube([10, 10, 10]);
	}
}