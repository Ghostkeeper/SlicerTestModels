translate([0, 0, 30]) {
	difference() {
		sphere(r=20, $fn=300);
		translate([0, 0, -10])
			sphere(r=20, $fn=300);
	}
}
cube([1, 1, 75]);