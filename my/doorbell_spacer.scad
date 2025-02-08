width = 30;
height = 65;
depth = 13;
shelf = 17;
thickness = 1;

difference() {
	cube([width, height, depth]);
	translate([thickness, thickness, -1]) {
		cube([width - thickness * 2, height - thickness * 2, depth + 1 - thickness]);
	}
	translate([thickness, shelf, -1]) {
		cube([width - thickness * 2, height - shelf * 2, depth + 2]);
	}
}