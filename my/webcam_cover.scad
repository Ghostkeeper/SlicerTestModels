//Measurements.
front_radius = 63 / 2;
height = 28;
total_radius = 94 / 2;
thickness = 29;
thinness = 25;
wire_z = height - 15;
wire_x = total_radius - 32;
wire_radius = 8 / 2; //Way more play, to allow flexing the cable.

//Settings.
play = 0.5;
thick = 1;
$fs = 0.5;
$fa = 1;

//Implementation.
difference() {
	union() {
		intersection() {
			scale([1, (thinness / 2 + thick + play) / (total_radius + thick + play), 1]) {
				cylinder(r=total_radius + thick + play, h=height + thick + play);
			}
			translate([0, -thinness / 2 - thick - play, height / 2]) {
				rotate([-90, 0, 0]) {
					hull() {
						cylinder(r=total_radius + thick + play, h=thinness + (thick + play) * 2);
						translate([0, height, 0]) {
							cylinder(r=total_radius + thick + play, h=thinness + (thick + play) * 2);
						}
					}
				}
			}
		}
		intersection() {
			translate([0, 0, height / 2]) {
				rotate([-90, 0, 0]) {
					hull() {
						cylinder(r=front_radius + thick + play, h=thickness / 2 + thick + play);
						translate([0, height, 0]) {
							cylinder(r=front_radius + thick + play, h=thickness / 2 + thick + play);
						}
					}
				}
			}
			translate([-front_radius - thick - play, 0, 0]) {
				cube([front_radius * 2 + (thick + play) * 2, thickness / 2 + thick + play, height + thick + play]);
			}
		}
	}

	//Hollow out the inside.
	union() {
		intersection() {
			translate([0, 0, -1]) {
				scale([1, (thinness / 2 + play) / (total_radius + play), 1]) {
					cylinder(r=total_radius + play, h=height + play + 1);
				}
			}
			translate([0, -thinness / 2 - play, height / 2]) {
				rotate([-90, 0, 0]) {
					hull() {
						cylinder(r=total_radius + play, h=thinness + play * 2);
						translate([0, height, 0]) {
							cylinder(r=total_radius + play, h=thinness + play * 2);
						}
					}
				}
			}
		}
		intersection() {
			translate([0, 0, height / 2]) {
				rotate([-90, 0, 0]) {
					hull() {
						cylinder(r=front_radius + play, h=thickness / 2 + play);
						translate([0, height, 0]) {
							cylinder(r=front_radius + play, h=thickness / 2 + play);
						}
					}
				}
			}
			translate([-front_radius - play, 0, -1]) {
				cube([front_radius * 2 + play * 2, thickness / 2 + play, height + play + 1]);
			}
		}
	}

	//Space for the wire.
	translate([-wire_x, -thinness / 2 - thick - play, wire_z]) {
		rotate([-90, 0, 0]) {
			hull() {
				cylinder(r=wire_radius, h=thick * 2);
				translate([0, height, 0]) {
					cylinder(r=wire_radius, h=thick * 2);
				}
			}
		}
	}
}