//A heart-shaped pendant with custom text on each side.

resolution = 2; //Lower results in greater resolution.
size = 20; //Determines the total scale of the model.
hole_diameter = 2;
front_text = "H";
back_text = "R";

//Calculations.
alength = 180 / resolution + 1; //Number of coordinates in the A polar coordinate.
blength = 360 / resolution + 1; //Number of coordinates in the B polar coordinate.
recipsize = 180 / size; //Reciprocal of the size, to reach the desired size when A=180.

function cardioid(x) = cos(x) * x / recipsize;
function sardioid(x) = sin(x) * x / recipsize;
function halfcircle(x) = sin(x) * size;
function alternating(x) = cos(x * 2) / 2 + 0.5;
function coord(a, b) = [cos(b) * sardioid(a), sin(b) * halfcircle(a), alternating(b) * cardioid(a) + (1 - alternating(b)) * (cos(a) / 2 - 0.5) * size];

points = [for(a = [0:resolution:180]) each [for(b = [0:resolution:360]) coord(a, b)]];
faces = [for(a = [0:alength - 2]) each [for(b = [0:blength - 2]) [a * blength + b, (a + 1) * blength + b, (a + 1) * blength + b + 1, a * blength + b + 1]]];

difference() {
	scale([1, 0.25, 1]) { //Flatten by 25% to create a flatter surface.
		polyhedron(points, faces, 3); //Main mesh body.
	}

	//Holes for the cord.
	translate([size / 4, -size, size / 12]) {
		rotate([-90, 0, 0]) {
			cylinder(h=size * 2, r=hole_diameter / 2, $fn=360/resolution);
		}
	}
	translate([-size / 4, -size, size / 12]) {
		rotate([-90, 0, 0]) {
			cylinder(h=size * 2, r=hole_diameter / 2, $fn=360/resolution);
		}
	}

	//Text.
	translate([0, size / 4, -size / 2]) {
		rotate([90, 0, 0]) {
			linear_extrude(size / 8) {
				mirror([1, 0, 0]) {
					#text(front_text, size=size / 2, valign="center", halign="center");
				}
			}
		}
	}
	translate([0, -size / 4 + size / 8, -size / 2]) {
		rotate([90, 0, 0]) {
			linear_extrude(size / 8) {
				#text(back_text, size=size / 2, valign="center", halign="center");
			}
		}
	}
}