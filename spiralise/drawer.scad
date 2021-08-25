$fa = 1;
$fs = 0.4;

intersection() {
	union() {
		rotate([0, 90, 0]) {
			cylinder(r=150, h=5);
			translate([0, 0, 5]) {
				difference() {
					cylinder(r=145, h=90);
					translate([10, -162, 10]) {
						cube(20);
					}
					translate([10, -162, 60]) {
						cube(20);
					}
				}
			}
			translate([0, 0, 95]) {
				cylinder(r=150, h=5);
			}
		}
		translate([50, 0, 0]) {
			rotate([100, 0, 0]) {
				cylinder(r=10, h=145, $fn=4);
			}
			rotate([110, 0, 0]) {
				cylinder(r=10, h=145, $fn=4);
			}
			rotate([120, 0, 0]) {
				cylinder(r=10, h=145, $fn=4);
			}
		}
	}
	translate([0, -150, -100]) {
		cube([150, 150, 100]);
	}
}