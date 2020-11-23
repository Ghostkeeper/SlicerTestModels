difference() {
	cube([40, 10, 3]);
	translate([20, 1, -1]) {
		scale([1, 0.5, 1]) {
			rotate([0, 0, 45]) {
				cube([100, 100, 5]);
			}
		}
	}
}