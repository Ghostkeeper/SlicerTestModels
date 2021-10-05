difference() {
	cylinder(h=3, r=20);
	translate([0, 0, -1]) {
		cylinder(h=5, r=17);
	}
}

translate([-6.5, 0, 0]) {
	cube(3);
}
translate([-1.5, 0, 0]) {
	cube(3);
}
translate([3.5, 0, 0]) {
	cube(3);
}