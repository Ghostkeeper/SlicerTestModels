gap_width = 21;
gap_height = 9;
size = 6;
thickness = 1;

$fa = 1;
$fs = 0.1;

module hole() {
	cube([gap_width - gap_height / 2, gap_height, size]);
	translate([0, gap_height / 2, 0]) {
		cylinder(r=gap_height / 2, h=size);
	}
	translate([gap_width - gap_height / 2, gap_height / 2, 0]) {
		cylinder(r=gap_height / 2, h=size);
	}
}

difference() {
	minkowski() {
		hole();
		scale([1, 1, 0]) {
			cylinder(r=thickness, h=1);
		}
	}
	hole();
}