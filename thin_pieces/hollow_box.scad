thickness = 0.4;

difference() {
	cube([100, 100, 60]);
	translate([thickness, thickness, thickness]) {
		cube([100 - thickness * 2, 100 - thickness * 2, 100]);
	}
}