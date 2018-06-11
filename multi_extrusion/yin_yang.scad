$fa = 1;
$fs = 0.1;

module yin(radius, height) {
	difference() {
		union() {	
			difference() {
				cylinder(r=radius, h=height);
				translate([-radius, 0, -1]) {
					cube([radius * 2, radius, height + 2]);
				}
				translate([radius / 2, 0, -1]) {
					cylinder(r=radius / 2, h=height + 2);
				}
			}
			translate([-radius / 2, 0, 0]) {
				cylinder(r=radius / 2, h=height);
			}
			translate([radius / 2, 0, 0]) {
				cylinder(r=radius / 8, h=height);
			}
		}
		translate([-radius / 2, 0, -1]) {
			cylinder(r=radius / 8, h=height + 2);
		}
	}
}

color([0.9, 0.9, 0.9]) {
	yin(20, 5);
}
color([0.2, 0.2, 0.2]) {
	rotate([0, 0, 180]) {
		yin(20, 5); //Yang.
	}
}