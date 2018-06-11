difference() {
	cube([50, 5, 30]);
	translate([5, 0, 0])
		cube([40, 5, 25]);
}
translate([10, 0, 25])
	rotate([0, 45, 0])
		cube(5);
translate([40, 0, 25])
	rotate([0, -135, 0])
		cube(5);