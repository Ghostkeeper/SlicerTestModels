rotate([-90, 0, 0]) {
	difference() {
		union() {
			cylinder(r=20, h=80);
			hull() {
				translate([0, 0, 100]) {
					sphere(r=40);
				}
				translate([0, 0, 130]) {
					sphere(r=30);
				}
			}
		}
		translate([0, 0, -1]) {
			cylinder(r=18, h=82);
		}
		hull() {
			translate([0, 0, 100]) {
				sphere(r=38);
			}
			translate([0, 0, 130]) {
				sphere(r=28);
			}
		}
		translate([-40, 0, -1]) {
			cube([80, 40, 200]);
		}
		for(z = [75:5:145]) {
			for(x = [-25:5:25]) {
				translate([x, 0, z]) {
					rotate([90, 0, 0]) {
						cylinder(r=2, h=100);
					}
				}
			}
		}
	}
}