$fn=3000;

difference() {
	cube([20, 20, 11]);
	translate([10, 10, 11]) {
		sphere(10);
	}
}