difference() {
	cube([20, 10, 10]);
	translate([10, -1, 5]) {
		scale([1, 1, 2]) {
			rotate([0, -45, 0]) {
				cube(12);
			}
		}
	}
}