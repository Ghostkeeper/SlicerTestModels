difference() {
	cylinder(r=10, h=3);
	scale([0.5, sqrt(2), 1]) {
		rotate([0, 0, 45]) {
			cube([10, 10, 3]);
		}
	}
}