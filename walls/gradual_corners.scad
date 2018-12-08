difference() {
	cube([40, 40, 40]);
	translate([0, 40, 0]) {
		linear_extrude(twist=90, height=40, $fn=3600) {
			square([40, 40]);
		}
	}
}