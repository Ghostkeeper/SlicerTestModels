cube([10, 20, 3]);
translate([30, 0, 0]) {
	cube([10, 20, 3]);
	translate([0, 20, 0]) {
		cube([30, 30, 4]);
	}
}