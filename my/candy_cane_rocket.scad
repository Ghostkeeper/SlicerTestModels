$fs = 0.1;
$fa = 1;

cylinder(r=5, h=100);
translate([20, 0, 100]) {
	difference() {
		rotate([90, 0, 0]) {
			rotate_extrude(convexity = 2) {
				translate([-20, 0, 0]) {
					circle(r=5);
				}
			}
		}
		translate([-25, -5, -25]) {
			cube([50, 10, 25]);
		}
	}
}
translate([40, 0, 90]) {
	cylinder(r=5, h=10);
}
translate([40, 0, 80]) {
	cylinder(r1=0, r2=8, h=10);
}
difference() {
	union() {
		rotate([45, 0, 0]) {
			cube([0.6, 40, 40], center=true);
		}
		rotate([45, 0, 90]) {
			cube([0.6, 40, 40], center=true);
		}
	}
	translate([-100, -100, -100]) {
		cube([200, 200, 100]);
	}
}