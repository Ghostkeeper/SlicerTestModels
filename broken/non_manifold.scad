size = 10;

cube(size);
translate([size, size, 0])
	cube(size);
translate([size, -size,0])
	cube(size);
translate([-size, size, 0])
	cube(size);
translate([-size, -size, 0])
	cube(size);