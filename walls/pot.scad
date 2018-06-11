module pot(
		rBottom = 60,
		rTop = 80,
		height = 140,
		wall = 5,
		fn = 120) {
	difference() {
		cylinder(h = height,r1 = rBottom,r2 = rTop,$fn = fn);
		cylinder(h = height - wall,r1 = rBottom - wall,r2 = rTop - wall,$fn = fn);
	}
}

pot();