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

module pva_removal_station() {
	difference() {
		//The box.
		cube([inner_diameter + (print_play + thickness) * 2, inner_diameter + (print_play + thickness) * 2, height + print_play + top_thickness]);
		translate([thickness, thickness, -1]) { //Hollow box.
			cube([inner_diameter + print_play * 2, inner_diameter + print_play * 2, 1 + height + print_play]);
		}

		//Hole for knob.
		translate([thickness + print_play + inner_diameter / 2, -1, 0]) {
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
		translate([thickness + print_play + inner_diameter / 2, thickness + print_play * 2 + inner_diameter - 1, 0]) {
			hull() {
				rotate([-90, 0, 0]) {
					cylinder(r=cable_radius + print_play, h=thickness + 2);
					translate([0, -cable_height, 0]) {
						cylinder(r=cable_radius + print_play, h=thickness + 2);
					}
				}
			}
		}
	}
}

pva_removal_station();