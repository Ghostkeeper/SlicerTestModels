thickness = 2;
width = 200;
height = 150;

difference() {
	cube([thickness * 2 + width, thickness + width, thickness * 2 + height]);
	translate([thickness, -1, thickness]) {
		cube([width, width + 1, height]);
	}
}