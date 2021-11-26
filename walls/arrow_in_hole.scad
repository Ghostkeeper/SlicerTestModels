difference() {
	cube([20, 20, 5]);
	difference() {
		translate([8, 10, -1]) {
			cylinder(r=8, h=7, $fn=3);
		}
		translate([3.7, 10, -2]) {
			scale([0.4, 1, 1]) {
				cylinder(r=8, h=9, $fn=4);
			}
		}
	}
}