for(x = [0:100]) {
	for(y = [0:100]) {
		translate([x * 4, y * 4, 0]) {
			cylinder(r1 = 0, r2 = 1, $fn = 3, h = 50);
		}
	}
}