import("deer-on-plaque.stl");

intersection() {
	union() {
		hull() {
			translate([0, -6, 0]) {
				sphere(r=15);
			}
			translate([0, -30, 5]) {
				sphere(r=7);
			}
		}

		hook_radius = 15;
		translate([0, -30, 5 + hook_radius]) {
			for(a = [0 : 150]) {
				rotate([-a, 0, 0]) {
					translate([0, 0, -hook_radius]) {
						sphere(r=7);
					}
				}
			}
		}
	}
	translate([-100, -100, 0]) {
		cube(200);
	}
}