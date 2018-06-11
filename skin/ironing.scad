difference() {
	minkowski() {
		cube([40, 20, 2]);
		scale([1, 1, 0]) {
			cylinder(r=2, h=1, $fn=60);
		}
	}
	translate([-1, 5, 1]) {
		linear_extrude(height=1) {
			text("Ironing");
		}
	}
}