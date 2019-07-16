sphere(r=20);
translate([50, 0, 0]) {
	sphere(r=20);
}
rotate([0, 90, 0]) {
	cylinder(r=5, h=50);
}
cylinder(r=5, h=30);
cube([10, 40, 2]);
translate([0, 40 - 2 * sqrt(2), 0]) {
	rotate([-45, 0, 0]) {
		cube([10, 2, 2]);
	}
}
translate([5, 30, -4]) {
	cylinder(r1=0, r2=3, h=4);
}