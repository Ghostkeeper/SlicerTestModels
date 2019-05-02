$fs = 0.3;
$fa = 1;

rotate_extrude(angle = 180) {
	translate([20, 0, 0]) {
		square([10, 5]);
	}
}
translate([25, 0, 0])
	cylinder(r=5, h=5);
translate([-25, 0, 0])
	cylinder(r=5, h=5);