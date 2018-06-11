difference() {
	cube([30, 12.2, 3]);
	translate([5.55, (12.2 - 5.5) / 2, 0]) {
		cube([18.9, 5.5, 3]);
	}
}