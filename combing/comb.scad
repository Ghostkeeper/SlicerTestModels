cube([59, 3, 3]);
for(x = [0 : 4 : 56]) {
	translate([x, 0, 0]) {
		cube([3, 20, 3]);
	}
}