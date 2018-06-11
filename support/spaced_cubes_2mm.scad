cylinder(r=1, h=10);
for(x = [0:12:48]) {
	for(y = [0:12:48]) {
		translate([x - 29, y - 29, 10]) {
			cube(10);
		}
	}
}