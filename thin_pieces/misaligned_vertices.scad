difference() {
	cylinder(r=40, $fn=60, h=4);
	translate([0, 0, -1]) {
		cylinder(r=39, $fn=59, h=6);
	}
}