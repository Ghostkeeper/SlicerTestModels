difference() {
	cylinder(r=20, h=5);
	translate([0, 0, -1]) {
		cylinder(r=17, h=7);
	}
	translate([0, -4, -1]) {
		cube([30, 8, 7]);
	}
}