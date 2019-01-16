bottom_slope = 30; //Should be less than the overhang angle.

slope_width = sin(bottom_slope) * 20;
slope_height = cos(bottom_slope) * 20;

difference() {
	cube([5 + slope_width, 5, slope_height + 5 + 5]);
	translate([5, 0, 0]) {
		rotate([0, bottom_slope, 0]) {
			cube([slope_width, 5, 20]);
		}
	}
	translate([5, 0, slope_height]) {
		cube([slope_width, 5, 5]);
	}
}