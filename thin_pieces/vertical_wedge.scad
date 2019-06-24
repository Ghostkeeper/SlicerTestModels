width = 5;
height = 200;

difference() {
	cube([10, width, height]);
	translate([0, -width, 0]) {
		rotate([-atan(width / height), 0, 0]) {
			cube([10, width, height + width]);
		}
	}
}