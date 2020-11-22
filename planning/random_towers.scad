cube([35, 35, 2]);
for(x = [0:10:30]) {
	for(y = [0:10:30]) {
		translate([x, y, 0]) {
			cube([5, 5, rands(4, 30, 1)[0]]);
		}
	}
}