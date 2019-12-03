$fs = 0.4;
$fa = 1;

difference() {
	union() {
		for(r = [1:20]) {
			cylinder(r1=60 - r, r2=r, h=80 + r);
		}
		translate([0, 0, 50]) {
			cube([120, 2, 100], center=true);
		}
	}
	cylinder(r1=10, r2=6, h=16);
}