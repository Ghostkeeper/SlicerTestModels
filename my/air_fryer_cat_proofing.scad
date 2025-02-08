include <fillets_and_rounds.scad>

width = 35;
height = 135;
length = 56;
angle = 7;
thickness = 4;

thinner = 8;
round_radius = 50;
t = 1;
$fn = 40; //Any higher crashes CGAL.

//Calculations.
slope = tan(angle);
displacement = sin(angle) * height + 0.125; //Don't know why the 0.125 is necessary. Rounding errors?


module footprint() {
	polygon(concat([[0,0], [width, 0], [width, thickness]], [for (y = [1:round_radius]) [width - thinner / 2 + cos(y / round_radius * 180) * thinner / 2, y + thickness]], [[width - thinner, displacement + length], [thinner, displacement + length], [thinner, thickness + round_radius]], [for (y = [1:round_radius]) [thinner / 2 + cos(y / round_radius * 180) * thinner / 2, thickness + round_radius - y]]));
}

module shape() {
	intersection() {
		multmatrix([[1, 0, 0, 0], [0, 1, slope, 0], [0, 0, 1, 0], [0, 0, 0, 1]]) {
			linear_extrude(height) {
				footprint();
			}
			translate([width, displacement + length, height - displacement - length]) {
				rotate([90, 0, -90]) {
					rotate_extrude(angle=90) {
						rotate([0, 0, 90]) {
							translate([0, -length - displacement, 0]) {
								footprint();
								translate([0, -length - displacement, 0]) {
									square([width, length + displacement]);
								}
							}
						}
					}
				}
			}
		}
		cube([width, displacement + length, height]);
		multmatrix([[1, 0, 0, 0], [0, 1, slope, 0], [0, 0, 1, 0], [0, 0, 0, 1]]) {
			cube([width, displacement + length, height]);
		}
	}
}

difference() {
	minkowski() {
		shape();
		translate([-t, -t, 0]) {
			cube([t * 2, t, t]);
		}
	}
	shape();
}