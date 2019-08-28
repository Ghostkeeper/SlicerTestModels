difference() {
	hull() {
		cylinder(r=10, h=2);
		translate([30, 0, 0]) {
			cylinder(r=10, h=2);
		}
	}
	cylinder(r=2, h=3);
}
translate([4, -4, 2])
	scale([0.8, 0.8, 1])
		linear_extrude(height=1)
			text("Ghost");