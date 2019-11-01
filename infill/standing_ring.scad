rotate([-90, 0, 0]) {
	difference() {
		cylinder(r=40, h=20);
		translate([0, 0, -1]) {
			cylinder(r=20, h=22);
		}
	}
}