angle = 50;

difference() {
	rotate([angle, 0, 0]) {
		cube(10);
	}
	translate([-1, -20, 0]) {
		cube(20);
	}
}
translate([0, 0, sin(angle) * 10]) {
	cube([10, 20, 6]);
}

translate([0, 15, -10]) {
	cube([10, 5, 20]);
}