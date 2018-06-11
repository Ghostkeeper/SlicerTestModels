width = 20;
height = 20;
toothsize = 0.2;

difference() {
	cube([width, height, 5]);
	rotate([0, 0, 45]) {
		cube([sqrt(2) * width, sqrt(2) * height, 5]);
	}
}
for(x = [0:toothsize:width - toothsize]) {
	translate([x, x, 0]) {
		cube([toothsize, toothsize, 5]);
	}
}