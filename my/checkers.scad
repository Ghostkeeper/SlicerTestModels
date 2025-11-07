$fs = 0.2;
$fa = 1;

difference() {
	union() {
		cylinder(h=9, r=20);
		translate([0, 0, 9]) {
			cylinder(h=1, r1=20, r2=19);
		}
	}
	translate([0, 0, 8]) {
		cylinder(h=3, r=16);
	}
}