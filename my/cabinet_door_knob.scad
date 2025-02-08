$fn = 360;
radius = 15;

rotate_extrude() {
	difference() {
		union() {
			difference() {
				square([radius, 40]);
				translate([30 + radius, 20, 0]) {
					circle(34);
				}
				translate([radius - 3, 37, 0]) {
					square(3);
				}
			}
			translate([radius - 3, 37, 0]) {
				circle(3);
			}
		}
		translate([0, 60, 0]) {
			scale([radius / 10, 1, 1]) {
				circle(21.5);
			}
		}
	}
}