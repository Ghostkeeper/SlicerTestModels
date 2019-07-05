cylinder(r1=30, r2=10, h=10, $fn=4);
rotate([0, 0, 45]) {
	translate([-5 * sqrt(2), -5 * sqrt(2), 10]) {
		difference() {
			cube(sqrt(2) * 10);
			cube([sqrt(2) * 9, sqrt(2) * 9, sqrt(2) * 10]);
		}
	}
}