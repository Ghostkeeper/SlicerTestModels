translate([-13, 14.5, 0]) {
	rotate([90, 0, 0]) {
		import("robot.stl");
	}
}

translate([0, 7, 40.6]) {
	rotate([90, 90, 0]) {
		rotate_extrude($fn=360, angle=270) {
			translate([14.5, 0, 0]) {
				circle(r=2.5, $fn=60);
			}
		}
	}
}