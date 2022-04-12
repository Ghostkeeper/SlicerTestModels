rotate([90, 0, 0]) {
	difference() {
		cylinder(h=10, r=50, $fn=360);
		translate([0, 0, -1])
			cylinder(h=12, r=45, $fn=360);
		translate([-50, -50, -1])
			cube([100, 50, 12]);
	}
}
translate([-50, -10, -10]) {
	cube([5, 10, 10]);
}
translate([45, -10, -10]) {
	cube([5, 10, 10]);
}