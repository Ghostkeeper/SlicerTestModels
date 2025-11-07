import("BasaltPencilHolder.stl");
translate([46.59, -4.6, 0]) {
	cylinder(r=10.4, $fn=6, h=155);
}
translate([54, 0, 150]) {
	rotate([-30, 90, 0]) {
		cylinder(r=2, $fn=6, h=10);
	}
}