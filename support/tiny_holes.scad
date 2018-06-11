sheet_size = 40;
sheet_thickness = 5;
hole_size = 0.1;
hole_spacing = 1;

difference() {
	cube([sheet_size, sheet_size, sheet_thickness]);
	for(x = [0:hole_spacing:sheet_size]) {
		for(y = [0:hole_spacing:sheet_size]) {
			translate([x, y, 0]) {
				cube([hole_size, hole_size, sheet_thickness]);
			}
		}
	}
}