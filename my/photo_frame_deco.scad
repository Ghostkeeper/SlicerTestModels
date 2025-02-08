width = 90; //Width of the photo.
height = 125; //Height of the photo.
thickness = 0.7; //Thickness of the photo (or at least, the amount of space made for it).
frame_width = 15; //Width of the rim around the photo.
frame_thickness = 4; //Thickness of the frame.
inset = 3; //Width of the inset that holds the photo inside of the frame.
relief = 0.2; //Depth of the pattern around the frame.
num_shapes_x = 9; //Number of shapes around the horizontal sides.
num_shapes_y = 12; //Number of shapes around the vertical sides.
screw_radius = 4; //Radius of the screw hole.
screw_depth = 3; //Depth of the screw hole.
$fs = 0.2;
$fa = 1;

module cat() {
	linear_extrude(relief + 1) {
		scale([1, 0.8, 1]) {
			circle(r=frame_width / 4);
		}
		polygon([[-frame_width / 4, frame_width / 4], [-frame_width / 5, 0], [0, frame_width / 6]]);
		polygon([[frame_width / 4, frame_width / 4], [frame_width / 5, 0], [0, frame_width / 6]]);
	}
}
module heart() {
	linear_extrude(relief + 1) {
		translate([-frame_width / 9, 0, 0]) {
			hull() {
				circle(r=frame_width / 8);
				translate([frame_width / 9, -frame_width / 4, 0]) {
					circle(r=0.01);
				}
			}
		}
		translate([frame_width / 9, 0, 0]) {
			hull() {
				circle(r=frame_width / 8);
				translate([-frame_width / 9, -frame_width / 4, 0]) {
					circle(r=0.01);
				}
			}
		}
	}	
}
module shape() {
	cat();
}

difference() {
	union() {
		//Main body of the frame.
		cube([width + frame_width * 2, height + frame_width * 2, frame_thickness / 2]);
		translate([frame_thickness / 2, frame_thickness / 2, 0]) {
			cube([width + frame_width * 2 - frame_thickness, height + frame_width * 2 - frame_thickness, frame_thickness]);
		}

		//Four rounded bezels around the edge.
		intersection() {
			translate([frame_thickness / 2, 0, frame_thickness / 2]) {
				rotate([-90, 0, 0]) {
					cylinder(h=height + frame_width * 2, r=frame_thickness / 2);
				}
			}
			rotate([0, 0, 45]) {
				cube([(height + frame_width * 2) / sqrt(2), (height + frame_width * 2) / sqrt(2), frame_thickness + 1]);
			}
		}
		intersection() {
			translate([0, height + frame_width * 2 - frame_thickness / 2, frame_thickness / 2]) {
				rotate([0, 90, 0]) {
					cylinder(h=width + frame_width * 2, r=frame_thickness / 2);
				}
			}
			translate([0, height + frame_width * 2, 0]) {
				rotate([0, 0, -45]) {
					cube([(width + frame_width * 2) / sqrt(2), (width + frame_width * 2) / sqrt(2), frame_thickness + 1]);
				}
			}
		}
		intersection() {
			translate([width + frame_width * 2 - frame_thickness / 2, 0, frame_thickness / 2]) {
				rotate([-90, 0, 0]) {
					cylinder(h=height + frame_width * 2, r=frame_thickness / 2);
				}
			}
			translate([width + frame_width * 2, 0, 0]) {
				rotate([0, 0, 45]) {
					cube([(height + frame_width * 2) / sqrt(2), (height + frame_width * 2) / sqrt(2), frame_thickness + 1]);
				}
			}
		}
		intersection() {
			translate([0, frame_thickness / 2, frame_thickness / 2]) {
				rotate([0, 90, 0]) {
					cylinder(h=width + frame_width * 2, r=frame_thickness / 2);
				}
			}
			rotate([0, 0, -45]) {
				cube([(width + frame_width * 2) / sqrt(2), (width + frame_width * 2) / sqrt(2), frame_thickness + 1]);
			}
		}
	}

	//Hole in the frame to view and hold the photo.
	translate([frame_width, frame_width, -1]) {
		cube([width, height, frame_thickness + 2]);
	}
	translate([frame_width - inset, frame_width - inset, -1]) {
		cube([width + inset * 2, height + inset * 2, 2.2 + thickness]); //Add 0.2mm to thickness for back lip.
	}

	//Shapes around the frame.
	for(y = [frame_width / 2 : (height + frame_width) / (num_shapes_y - 1) : frame_width * 1.5 + height]) {
		translate([frame_width / 2, y, frame_thickness - relief]) {
			shape();
		}
		translate([frame_width * 1.5 + width, y, frame_thickness - relief]) {
			shape();
		}
	}
	for(x = [frame_width / 2 + (width + frame_width) / (num_shapes_x - 1) : (width + frame_width) / (num_shapes_x - 1) : frame_width * 1.5 + width - (width + frame_width) / (num_shapes_x - 1)]) {
		translate([x, frame_width / 2, frame_thickness - relief]) {
			shape();
		}
		translate([x, frame_width * 1.5 + height, frame_thickness - relief]) {
			shape();
		}
	}

	//Screw hole.
	translate([frame_width + width / 2, frame_width * 1.5 + height, 0]) {
		hull() {
			cylinder(screw_depth, r=screw_radius);
			multmatrix([[1, 0, 0, 0], [0, 1, 1, 0], [0, 0, 1, 0], [0, 0, 0, 1]]) { //Skew Y towards Z.
				cylinder(screw_depth, r=screw_radius);
			}
		}
	}
}

//Back lips to hold the photo to the frame.
translate([frame_width - inset, frame_width - inset, 0]) {
	cylinder(r=inset * 2, h=0.2);
}
translate([frame_width - inset, frame_width + height + inset, 0]) {
	cylinder(r=inset * 2, h=0.2);
}
translate([frame_width + width + inset, frame_width + height + inset, 0]) {
	cylinder(r=inset * 2, h=0.2);
}
translate([frame_width + width + inset, frame_width - inset, 0]) {
	cylinder(r=inset * 2, h=0.2);
}