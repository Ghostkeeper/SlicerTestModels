cup_rim_radius = 38 / 2; //Measured 37.0mm diameter.
cup_radius = 30 / 2; //Measured 29.6mm diameter.
rim_spacing = 5; //Measured 1.6mm thickness.
screw_radius = 1.5; //Guessed.

thickness = 1;
length = 205;
slope = 5;
screwplate_width = 10;
label_height = 8;
$fs = 0.2;

module screwplate() {
	difference() {
		cube([thickness * 2 + cup_rim_radius * 2, screwplate_width, thickness]);
		translate([thickness + cup_rim_radius, screwplate_width / 2, -1]) {
			cylinder(h=thickness + 2, r=screw_radius);
		}
	}
}

module column(title) {
	//Left side.
	cube([thickness + (cup_rim_radius - cup_radius), length, thickness]);
	hull() {
		cube([thickness, length, thickness]);
		rotate([slope, 0, 0]) {
			translate([0, 0, thickness * 2 + rim_spacing]) {
				cube([thickness, length, 0.01]);
			}
		}
	}

	//Right side.
	translate([thickness + cup_rim_radius + cup_radius, 0, 0]) {
		cube([thickness + (cup_rim_radius - cup_radius), length, thickness]);
		translate([cup_rim_radius - cup_radius, 0, 0]) {
			hull() {
				cube([thickness, length, thickness]);
				rotate([slope, 0, 0]) {
					translate([0, 0, thickness * 2 + rim_spacing]) {
						cube([thickness, length, 0.01]);
					}
				}
			}
		}
	}

	//Backplate.
	translate([0, length - thickness, 0]) {
		rotate([slope, 0, 0]) {
			cube([thickness * 2 + cup_rim_radius * 2, thickness, thickness + rim_spacing + sin(slope) * length + thickness]);
		}
	}

	//Screwplates.
	rotate([slope, 0, 0]) {
		translate([0, 0, thickness + rim_spacing]) {
			screwplate();
			translate([0, length - screwplate_width, 0]) {
				screwplate();
			}
		}
	}
}

module row() {
	screwplate();
	translate([0, length - screwplate_width, 0]) {
		screwplate();
	}
	
	//Bottom rim sliders.
	difference() {
		union() {
			translate([0, 0, -thickness - rim_spacing]) {
				rotate([-slope, 0, 0]) {
					cube([cup_rim_radius - cup_radius + thickness, length / cos(slope), thickness]);
				}
			}
			translate([thickness + cup_rim_radius + cup_radius, 0, -thickness - rim_spacing]) {
				rotate([-slope, 0, 0]) {
					cube([cup_rim_radius - cup_radius + thickness, length / cos(slope), thickness]);
				}
			}
		}
		translate([-1, length, -100]) {
			cube([thickness * 2 + cup_rim_radius * 2 + 2, thickness, 200]);
		}
	}

	//Sides.
	difference() {
		union() {
			hull() {
				cube([thickness, length, thickness]);
				translate([0, 0, -thickness - rim_spacing]) {
					rotate([-slope, 0, 0]) {
						cube([thickness, length / cos(slope), thickness]);
					}
				}
			}
			translate([thickness + cup_rim_radius * 2, 0, 0]) {
				hull() {
					cube([thickness, length, thickness]);
					translate([0, 0, -thickness - rim_spacing]) {
						rotate([-slope, 0, 0]) {
							cube([thickness, length / cos(slope), thickness]);
						}
					}
				}
			}
		}
		translate([-1, length, -100]) {
			cube([thickness * 2 + cup_rim_radius * 2 + 2, thickness, 200]);
		}
	}

	//Backplate.
	intersection() {
		translate([0, length - thickness, -rim_spacing - sin(slope) * length / cos(slope) - thickness]) {
			cube([thickness * 2 + cup_rim_radius * 2, thickness, rim_spacing + sin(slope) * length / cos(slope) + thickness * 2]);
		}
		translate([0, 0, -rim_spacing - thickness]) {
			rotate([-slope, 0, 0]) {
				cube([thickness * 2 + cup_rim_radius * 2, length * 2, 100]);
			}
		}
	}

	//Label holder.
	translate([0, -label_height - thickness, 0]) {
		difference() {
			cube([thickness * 2 + cup_rim_radius * 2, label_height + thickness, thickness]);
			translate([thickness, thickness, -1]) {
				cube([cup_rim_radius * 2, label_height, thickness + 2]);
			}
		}
	}
}

row();
translate([thickness + cup_rim_radius * 2, 0, 0]) {
	row();
}
translate([(thickness + cup_rim_radius * 2) * 2, 0, 0]) {
	row();
}
translate([(thickness + cup_rim_radius * 2) * 3, 0, 0]) {
	row();
}