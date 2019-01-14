layer_height = 0.1;

cube([3, 8, 2]);
translate([13, 0, 0]) {
	cube([3, 8, 2]);
}
translate([0, 0, 2]) {
	cube([16, 8, layer_height]);
}
difference() {
	translate([0, 0, 2 + layer_height]) {
		cube([16, 8, 3]);
	}
	translate([8, 4, 2 + layer_height]) {
		cylinder(r=2, h=3, $fn=30);
	}
}