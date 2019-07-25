//Measurements.
inner_diameter = 175;
height = 71;
knob_radius = 23.75 / 2;
knob_height = 23.75 + knob_radius;
cable_radius = 5.8 / 2;
cable_height = 20.4 + cable_radius;

//Settings.
print_play = 0.3;
thickness = 6;
top_thickness = 1;
bottom_curve_height = 11; //Measured from a UM3.
bottom_curve_radius = 60;
feet_width = 35;

//Calculations.
total_width = inner_diameter + (print_play + thickness) * 2;
curve_centre_x = feet_width + sqrt(-bottom_curve_height * (bottom_curve_height - 2 * bottom_curve_radius));
echo(curve_centre_x);

module pva_removal_station() {
	difference() {
		//The box.
		cube([total_width, total_width, height + print_play + top_thickness]);
		translate([thickness, thickness, -1]) { //Hollow box.
			cube([inner_diameter + print_play * 2, inner_diameter + print_play * 2, 1 + height + print_play]);
		}

		//Hole for knob.
		translate([total_width / 2, -1, 0]) {
			hull() {
				rotate([-90, 0, 0]) {
					cylinder(r=knob_radius + print_play, h=thickness + 2);
					translate([0, -knob_height, 0]) {
						cylinder(r=knob_radius + print_play, h=thickness + 2);
					}
				}
			}
		}

		//Hole for cable.
		translate([total_width / 2, total_width - thickness - 1, 0]) {
			hull() {
				rotate([-90, 0, 0]) {
					cylinder(r=cable_radius + print_play, h=thickness + 2);
					translate([0, -cable_height, 0]) {
						cylinder(r=cable_radius + print_play, h=thickness + 2);
					}
				}
			}
		}

		//Curved bottom sides.
		translate([curve_centre_x, -1, bottom_curve_height - bottom_curve_radius]) {
			rotate([-90, 0, 0]) {
				hull() {
					cylinder(r=bottom_curve_radius, h=total_width + 2);
					translate([total_width - curve_centre_x * 2, 0, 0]) {
						cylinder(r=bottom_curve_radius, h=total_width + 2);
					}
				}
			}
		}
		translate([-1, curve_centre_x, bottom_curve_height - bottom_curve_radius]) {
			rotate([0, 90, 0]) {
				hull() {
					cylinder(r=bottom_curve_radius, h=total_width + 2);
					translate([0, total_width - curve_centre_x * 2, 0]) {
						cylinder(r=bottom_curve_radius, h=total_width + 2);
					}
				}
			}
		}
	}
}

pva_removal_station();