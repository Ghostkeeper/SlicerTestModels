radius = 15;
thickness = 0.4;

module rib() {
	rotate([90, 0, 0]) {
		rotate_extrude(angle=180, $fn=180) {
			translate([radius, 0, 0]) {
				circle(thickness);
			}
		}
	}
}

module cap() {
	hull() {
		difference() {
			union() {
				for(a = [0 : 60 : 120]) {
					rotate([0, 0, a]) {
						rib();
					}
				}
			}
			translate([-radius - 1, -radius - 1, 0]) {
				cube([radius * 2 + 2, radius * 2 + 2, radius / 2]);
			}
		}
	}
}

translate([0, 0, -radius / 2]) {
	difference() {
		cap();
		translate([0, 0, -thickness]) {
			cap();
		}
	}
}