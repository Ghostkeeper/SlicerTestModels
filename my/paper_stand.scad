paper_thickness = 0.6;
thickness = 1;
paper_height = 230;

$fs = 0.4;
$fa = 1;

difference() {
	minkowski() {
		cube([paper_height + thickness * 2, paper_thickness, 5]);
		scale([1, 1, 0]) {
			cylinder(r=thickness, h=1);
		}
	}
	cube([paper_height, paper_thickness, 5]);
}

translate([-thickness, 0, 0]) {
	rotate([0, 0, -20]) {
		cube([thickness * 2, 80, 5]);
	}
}