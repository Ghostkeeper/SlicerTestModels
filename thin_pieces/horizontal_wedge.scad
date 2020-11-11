difference() {
	cube([40, 40, 40]);
	translate([0, 0, -1]) {
		rotate([0, 0, -10]) {
			cube([400, 400, 400]);
		}
	}
}