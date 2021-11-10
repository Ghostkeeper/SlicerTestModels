difference() {
	cube(40);
	scale([0.5, 4 / sqrt(2), 4]) { //Left side.
		rotate([0, 0, 45]) {
			cube(10);
		}
	}
	translate([40, 0, 0]) {
		scale([0.5, 4 / sqrt(2), 4]) { //Right side.
			rotate([0, 0, 45]) {
				cube(10);
			}
		}
	}
	scale([4 / sqrt(2), 0.5, 4]) { //Front side.
		rotate([0, 0, -45]) {
			cube(10);
		}
	}
	translate([0, 40, 0]) {
		scale([4 / sqrt(2), 0.5, 4]) { //Back side.
			rotate([0, 0, -45]) {
				cube(10);
			}
		}
	}
}