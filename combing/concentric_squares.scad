extruder = 0;
spacing = 5;
size = 10;

if(extruder == 0) {
	cube(size, center=true);
	difference() {
		cube([5 * size + 4 * spacing, 5 * size + 4 * spacing, size], center=true);
		cube([3 * size + 4 * spacing, 3 * size + 4 * spacing, size + 2], center=true);
	}

	difference() {
		cube([3 * size + 2 * spacing, 3 * size + 2 * spacing, size], center=true);
		cube([size + 2 * spacing, size + 2 * spacing, size + 2], center=true);
	}
	difference() {
		cube([7 * size + 6 * spacing, 7 * size + 6 * spacing, size], center=true);
		cube([5 * size + 6 * spacing, 5 * size + 6 * spacing, size + 2], center=true);
	}
}