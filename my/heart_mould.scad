//A heart-shaped pendant with custom text on each side.

resolution = 2; //Lower results in greater resolution.
size = 35; //Determines the total scale of the model.
hole_diameter = 2;
front_text = "E";
//font = "Valentine";
font = "HelloCatround";
text_depth = 0.6;
thickness = 2;

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

module heart() {
	scale([1, 0.25, 1]) { //Flatten by 25% to create a flatter surface.
		polyhedron(points, faces, 3); //Main mesh body.
	}
}
module envelop() {
	//translate([-size * 0.6, -size / 4 - 1, -size - 1]) {
	translate([-size * 0.6 - thickness - 1, -size / 4, -size - thickness - 1]) {
		cube([size * 1.2 + thickness * 2 + 2, size / 4, size * 1.2 + thickness * 2 + 2]);
	}
}

difference() {
	hull() {
		translate([0, thickness, 0]) {
			heart();
		}
		translate([-thickness, 0, 0]) {
			heart();
		}
		translate([0, 0, -thickness]) {
			heart();
		}
		translate([thickness, 0, 0]) {
			heart();
		}
		translate([0, 0, thickness]) {
			heart();
		}
	}
	difference() {
		heart();
		//Text.
		difference() {
			translate([0, size / 2, -size / 2 + 2]) {
				rotate([90, 0, 0]) {
					linear_extrude(size / 2) {
						text(front_text, size=size / 3, valign="center", halign="center", font=font);
					}
				}
			}
			translate([0, -text_depth, 0]) {
				heart();
			}
		}
	}
	envelop();
}
