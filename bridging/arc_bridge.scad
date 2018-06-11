distance = 20;
size = 5;
ring_depth = 100;
minimum_ring_thickness = 1;
$fn = 180;

cube(size);
translate([size + distance, 0, 0])
	cube(size);

intersection() {
	translate([size + distance / 2, 0, -ring_depth]) {
		rotate([-90, 0, 0]) {
			difference() {
				cylinder(r = sqrt(pow(ring_depth + size + minimum_ring_thickness, 2) + pow(distance / 2 + size, 2)), h = size);
				cylinder(r = sqrt(pow(ring_depth + size, 2) + pow(distance / 2, 2)), h = size);
			}
		}
	}
	cube([size * 2 + distance, size, size + distance]);
}