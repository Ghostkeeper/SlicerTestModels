$fn = 180;

module shape() {
	difference() {
		minkowski() {
			translate([10, 10, 0]) {
				square(150);
			}
			circle(10);
		}
		translate([80, 80]) {
			text("P", size=100, halign="center", valign="center");
		}
	}
}

linear_extrude(1) {
	shape();
}
linear_extrude(2) {
	difference() {
		shape();
		offset(-3) {
			shape();
		}
	}
}