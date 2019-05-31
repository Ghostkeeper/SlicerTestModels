$fn = 360;

hull() {
	cylinder(r=2, h=10);
	translate([100, 0, 0]) {
		cylinder(r=2, h=10);
		translate([0, 100, 0]) {
			cylinder(r=2, h=10);
		}
	}
	translate([0, 100, 0]) {
		cylinder(r=2, h=10);
	}
}