$fs = 0.1;
$fa = 1;

difference() {
	cube([50, 10, 5]);
	for(i = [0:4]) {
		translate([i * 10 + 5, 5, 0]) {
			cylinder(r=3, h=5);
		}
	}
}