for(i = [1:5]) {
	translate([i * 10, 0, 0]) {
		cube([10, 10, 2 * i]);
	}
}