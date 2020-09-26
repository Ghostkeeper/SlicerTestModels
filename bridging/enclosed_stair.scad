module stair() {
	for(i = [0:6]) {
		translate([i * 5, 0]) {
			square([5, 5 * i]);
		}
	}
}

difference() {
	linear_extrude(height=6) {
		minkowski() {
			stair();
			circle(r=2, $fn=100);
		}
	}
	linear_extrude(height=5) {
		stair();
	}
}