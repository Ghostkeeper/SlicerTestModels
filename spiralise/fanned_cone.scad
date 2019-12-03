$fs = 0.4;
$fa = 1;

difference() {
	union() {
		for(r = [1:20]) {
			cylinder(r1=60 - r, r2=r, h=80 + r);
		}
		hull() {
			translate([-55, 0, 0]) {
				cylinder(r=5, h=100);
			}
			translate([55, 0, 0]) {
				cylinder(r=5, h=100);
			}
		}
	}
	cylinder(r1=10, r2=6, h=16);
}