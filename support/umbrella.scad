translate([0, 0, 30]) {
	difference() {
		sphere(r = 20, $fn = 600);
		translate([0, 0, -10])
			sphere(r = 20, $fn = 600);
	}
}
cube([1, 1, 75]);