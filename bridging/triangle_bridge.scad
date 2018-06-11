translate([0, 60, 0])
	cube([50, 3, 3]);

rotate([0, 0, 45])
	cube([sqrt(2) * 50, 3, 3]);

intersection() {
	translate([0, 0, 3])
		cube([60, 63, 1]);
	rotate([0, 0, 45])
		cube([sqrt(2) * 60, sqrt(2) * 60, 5]);
}