cube([30, 20, 20]);
translate([30, 0, 10]) {
	cube([10, 20, 10]);
	multmatrix([
			[1, 0, 1, 0],
			[0, 1, 0, 0],
			[0, 0, 1, 0],
			[0, 0, 0, 1]]) {
		cube([10, 20, 10]);
	}
}
hull() {
	translate([-10, -10, 5]) {
		cube([30, 30, 20]);
	}
	translate([10, 10, 20]) {
		cube([20, 20, 20]);
	}
}