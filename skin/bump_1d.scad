cube([30, 10, 10]);
intersection() {
	translate([15, 0, 10]) {
		rotate([-90, 0, 0]) {
			cylinder(r=2, h=10, $fn=180);
		}
	}
	cube([30, 10, 20]);
}