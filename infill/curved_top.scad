$fs = 0.2;
$fa = 1;

intersection() {
	translate([40, 0, -100]) {
		rotate([-90, 0, 0]) {
			cylinder(r=120, h=5);
		}
	}
	cube([80, 5, 1000]);
}