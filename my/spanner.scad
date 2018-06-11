difference() {
	union() {
		cube([100, 20, 10]);
		translate([0, 10, 0])
			cylinder(r=10, h=10, $fn=60);
		translate([100, 10, 0])
			difference() {
				rotate([0, 0, 360/12])
					cylinder(r=10, h=10, $fn=6);
				translate([3, -10, 0])
					cube([20, 20, 10]);
			}
		translate([102, 10, 0])
			cylinder(r=9.3, h=10, $fn=4);
	}
	translate([50, -200, 0])
		cylinder(r=205, h=10, $fn=360);
	translate([50, 220, 0])
		cylinder(r=205, h=10, $fn=360);
	translate([102, 10, 0])
		cylinder(r=9, h=10, $fn=4);
}