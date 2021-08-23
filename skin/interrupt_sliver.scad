difference() {
	cube([20, 20, 3]);
	translate([10, 10, 1.5]) {
		rotate([0, 0, 90]) {
			cube([15, 0.45, 5], center=true);
		}
	}
}