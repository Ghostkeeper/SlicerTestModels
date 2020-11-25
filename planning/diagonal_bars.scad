difference() {
	cube([90, 90, 1]);
	translate([10, 10, -1]) {
		rotate([0, 0, 45]) {
			cube([100, 2, 3]);
		}
		translate([10, 2, 0]) {
			rotate([0, 0, 45]) {
				cube([80, 2, 3]);
			}
		}
	}
}