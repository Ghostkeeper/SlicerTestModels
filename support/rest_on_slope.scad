cube([10, 10, 50]);
translate([10, 0, 0]) {
	multmatrix(m = [[1, 0, -1], [0, 1, 0], [0, 0, 1]]) {
		cube(10);
	}
}
translate([0, 0, 30]) {
	multmatrix(m = [[1, 0, 0.5], [0, 1, 0], [0, 0, 1]]) {
		cube([10, 10, 20]);
	}
}