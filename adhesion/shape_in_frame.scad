$fn=180;

linear_extrude(1) {
	difference() {
		square(40);
		translate([3, 3, 0]) {
			square(34);
		}
	}
	translate([20, 7, 0]) {
		circle(2);
	}
}