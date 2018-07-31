cube([10, 10, 20]);
translate([0, 0, 20]) {
	multmatrix([ //Shear along X axis.
		[1, 0, -1, 0],
		[0, 1, 0, 0],
		[0, 0, 1, 0]
	]) {
		cube([10, 10, 20]);
	}
	multmatrix([ //Shear along X axis.
		[1, 0, 1, 0],
		[0, 1, 0, 0],
		[0, 0, 1, 0]
	]) {
		cube([10, 10, 20]);
	}
}