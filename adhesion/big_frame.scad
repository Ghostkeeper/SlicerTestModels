module frame(width, height, thickness) {
	linear_extrude(height=5) {
		difference() {
			square([width, height]);
			translate([thickness, thickness]) {
				square([width - thickness * 2, height - thickness * 2]);
			}
		}
	}
}

frame(250, 150, 5);
frame(225, 125, 5);
frame(200, 100, 5);
frame(175, 75, 5);