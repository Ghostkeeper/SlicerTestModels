cube(5);

translate([2.5, 2.5, 0]) {
	for(i = [0:6]) {
		rotate([0, 0, i * 15]) {
			translate([-2.5, -2.5, 0]) {
				translate([25, 0, 0])
					cube([5, 5, 5 + i]);
				translate([0, 0, 5 + i])
					cube([30, 5, 1]);
			}
		}
	}
}