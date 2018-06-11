bottom_slope = 60;
top_slope = 30;

difference() {
	cube([10, 10, 30]);
	translate([5, 0, 12])
		cube([5, 10, 10]);
	translate([5, 0, 12])
		rotate([0, bottom_slope, 0])
			cube([20, 10, 10]);
	translate([5, 0, 22])
		rotate([0, -top_slope, 0])
			translate([0, 0, -10])
				cube([20, 10, 10]);
}