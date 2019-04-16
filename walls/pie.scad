intersection() {
	difference() {
		cylinder(r=10, h=10);
		rotate([0, 0, 30]) {
			cube(10);
		}
	}
	cube(10);
}