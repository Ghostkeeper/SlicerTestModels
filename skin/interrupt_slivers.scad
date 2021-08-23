difference() {
	cube([20, 20, 3]);
	translate([10, 5, 1.5]) {
		rotate([0, 0, 90]) {
			cube([5, 0.45, 5], center=true);
		}
	}
	translate([5, 10, 1.5]) {
		rotate([0, 0, 90]) {
			cube([5, 0.45, 5], center=true);
		}
	}
	translate([15, 15, 1.5]) {
		rotate([0, 0, 90]) {
			cube([5, 0.45, 5], center=true);
		}
	}
}