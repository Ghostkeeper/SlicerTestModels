$fn=180;

difference() {
	hull() {
		cylinder(r1=30, r2=25, h=10);
		translate([30, 0, 9.9]) {
			cylinder(r=0.1, h=0.1);
		}
	}
	for(i = [0:2]) {
		translate([i * 15 - 15, 0, 5]) {
			cylinder(r=3, h=6);
		}
	}
	for(i = [0:1]) {
		translate([i * 15 - 8, 0, 5]) {
			cylinder(r=3, h=6, $fn=3);
		}
	}
}