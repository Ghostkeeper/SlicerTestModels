$fs = 0.2;
$fa = 1;

difference() {
	cube([100, 10, 10]);
	for(i = [0:9]) {
		translate([5 + i * 10, 5, -1]) {
			cylinder(r=(i + 1) * 0.1, h=12);
		}
	}
}