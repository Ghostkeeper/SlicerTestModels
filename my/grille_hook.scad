//Hook to pull the grille from my bathroom floor.

$fn = 120;

linear_extrude(2) {
	square([140, 20]);
	translate([140, 10]) {
		circle(r=10);
	}
	translate([-20, 10]) {
		square([20, 10]);
	}
	intersection() {
		translate([-30, 10]) {
			square(10);
		}
		translate([-20, 10]) {
			circle(r=10);
		}
	}
	translate([-20, 0]) {
		multmatrix([[1, -1, 0, 0], [0, 1, 0, 0], [0, 0, 1, 0], [0, 0, 0, 1]]) {
			difference() {
				square([30, 10]);
				translate([10, 0]) {
					square(10);
				}
			}
		}
	}
}