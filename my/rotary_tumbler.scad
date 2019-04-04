use<gear.scad>;

//Physical.
m3_radius = 1.5;
m3_nut_radius = 3.1;
m3_nut_thickness = 2.4;
print_play = 0.2;
movement_play = 0.2;
rod_radius = 3;

//Preferences.
box_radius = 60;
box_height = 150;
thickness = 3;
box_grooves = 8;
box_groove_depth = 6;
teeth_diameter = 2;
teeth_width = 10;
teeth_ramp = 0.2;
lid_lip_length = 10;
rod_gear_radius = 20;
holder_width = 10;
holder_extra_height = 20;
$fs = 0.4;
$fa = 0.1;

module m3_nut() {
	cylinder(r=m3_nut_radius + print_play, h=m3_nut_thickness + print_play * 2, $fn=6);
}

module box() {
	difference() {
		union() {
			cylinder(r=box_radius + thickness, h=thickness + box_height);

			linear_extrude(height=teeth_width, scale=1 + teeth_width / box_radius * teeth_ramp) {
				gear(inner_radius=box_radius + thickness, teeth_diameter=teeth_diameter, pressure_angle=30);
			}
			translate([0, 0, box_height + thickness - lid_lip_length * 2]) {
				mirror([0, 0, 1]) {
					linear_extrude(height=teeth_width, scale=1 + teeth_width / box_radius * teeth_ramp) {
						gear(inner_radius=box_radius + thickness, teeth_diameter=teeth_diameter, pressure_angle=30);
					}
				}
			}
		}
		translate([0, 0, thickness]) {
			cylinder(r=box_radius, h=box_height);
		}
		translate([-box_radius - thickness, 0, thickness + box_height - lid_lip_length]) {
			rotate([0, 90, 0]) {
				cylinder(h=(box_radius + thickness) * 2, r=m3_radius + print_play);
			}
		}
	}
	linear_extrude(height=box_height + thickness, twist=120) {
		for(i = [0 : box_grooves]) {
			rotate([0, 0, i / box_grooves * 360]) {
				translate([box_radius - box_groove_depth, -box_groove_depth / 2]) {
					square([box_groove_depth + thickness / 2, box_groove_depth]);
				}
			}
		}
	}
}

module lid() {
	difference() {
		union() {
			cylinder(r=box_radius + thickness * 3, h=thickness);
			cylinder(r=box_radius - print_play * 3, h=thickness + lid_lip_length * 2); //Need lots of extra play for blips here.
		}
		translate([0, 0, thickness]) {
			cylinder(r=box_radius - box_groove_depth, h=lid_lip_length * 2);
			linear_extrude(height=box_height + thickness, twist=120) {
				for(i = [0 : box_grooves]) {
					rotate([0, 0, i / box_grooves * 360]) {
						translate([box_radius - box_groove_depth - thickness, -box_groove_depth / 2 - print_play * 2]) {
							square([box_groove_depth + thickness, box_groove_depth + print_play * 4]);
						}
					}
				}
			}
		}
		twist_at_screwholes = lid_lip_length / (box_height + thickness * 3) * 120;
		rotate([0, 0, twist_at_screwholes * 2]) {
			translate([-box_radius, 0, thickness + lid_lip_length]) {
				rotate([0, 90, 0]) {
					cylinder(r=m3_radius + print_play, h=box_radius * 2);
					translate([0, 0, box_groove_depth / 2 - m3_nut_thickness / 2]) {
						hull() {
							m3_nut();
							translate([m3_nut_radius + print_play, 0, 0]) {
								m3_nut();
							}
						}
					}
					translate([0, 0, box_radius * 2 - box_groove_depth / 2 - m3_nut_thickness / 2]) {
						hull() {
							m3_nut();
							translate([m3_nut_radius + print_play, 0, 0]) {
								m3_nut();
							}
						}
					}
				}
			}
		}
	}
}

module rod_gear() {
	difference() {
		linear_extrude(height=teeth_width, scale=1 + teeth_width / rod_gear_radius * teeth_ramp) {
			gear(inner_radius=rod_gear_radius, teeth_diameter=teeth_diameter, pressure_angle=30);
		}
		cylinder(r=rod_radius + print_play + 0.1, h=teeth_width); //Sadly, print play is not the same everywhere. Add 0.1mm.
	}
}

module rod_holder(groove_height=0) {
	width = rod_radius * 2 + thickness * 2;
	difference() {
		cube([box_radius + width, holder_width, thickness]);
		translate([(box_radius + width) / 3, holder_width / 2, 0]) {
			cylinder(r=m3_radius, h=thickness); //No play here. Needs to be tight and cutting in the plastic.
		}
		translate([(box_radius + width) * 2 / 3, holder_width / 2, 0]) {
			cylinder(r=m3_radius, h=thickness);
		}
	}
	difference() {
		hull() {
			cube([width, holder_width, thickness]);
			translate([width / 2, 0, thickness + width / 2 + holder_extra_height + groove_height]) {
				rotate([-90, 0, 0]) {
					cylinder(r=width / 2, h=holder_width);
				}
			}
		}
		translate([width / 2, 0, thickness + width / 2 + holder_extra_height]) {
			rotate([-90, 0, 0]) {
				cylinder(r=rod_radius + print_play + movement_play, h=holder_width);
			}
		}
	}
	translate([box_radius, 0, 0]) {
		difference() {
			hull() {
				cube([width, holder_width, thickness]);
				translate([width / 2, 0, thickness + width / 2 + holder_extra_height + groove_height]) {
					rotate([-90, 0, 0]) {
						cylinder(r=width / 2, h=holder_width);
					}
				}
			}
			translate([width / 2, 0, thickness + width / 2 + holder_extra_height]) {
				rotate([-90, 0, 0]) {
					cylinder(r=rod_radius + print_play + movement_play, h=holder_width);
				}
			}
		}
	}
}

module motor_holder() {
	//https://www.tinytronics.nl/shop/nl/robotica/motoren/motor/aslong-jgb37-3530-transmissiemotor-12v-dc-20rpm
	screws = 6;
	screw_distance = 31 / 2;
	screw_radius = m3_radius;
	off_centre = 7; //How far the axis is off the centre of the motor.
	hole_radius = 6;
	axis_height = thickness + rod_radius + thickness + holder_extra_height; //Same height as rods in rod holder.
	thick_radius = 37 / 2;
	thick_length = 29;
	thin_radius = 34.5 / 2;
	thin_length = 30;
	space = 20; //Space for wiring.
	connector_width = 9;
	connector_height = 11;
	connector_depth = 14.5;
	screw_platform_width = 20;

	radius = thick_radius + thickness + print_play;
	height = thick_length + thin_length + space + connector_depth;
	difference() {
		union() {
			cylinder(r=thick_radius + thickness + print_play, h=height);
			translate([-axis_height, -thick_radius - thickness - print_play, 0]) {
				cube([axis_height, (thick_radius + thickness + print_play) * 2, height]);
			}
		}
		cylinder(r=thin_radius + print_play, h=thin_length + space + connector_depth);
		translate([0, 0, thin_length + space + connector_depth]) {
			cylinder(r=thick_radius + print_play, h=thick_length);
		}
	}
	difference() {
		cylinder(r=thin_radius + thickness + print_play, h=thickness);
		translate([-connector_height / 2 - print_play, -connector_width / 2 - print_play, 0]) {
			cube([connector_height + print_play * 2, connector_width + print_play * 2, thickness]);
		}
	}
	translate([-axis_height, -thick_radius - thickness - print_play - screw_platform_width, 0]) {
		difference() {
			cube([thickness, (thick_radius + thickness + print_play + screw_platform_width) * 2, height]);
			translate([0, screw_platform_width / 2, height / 4]) {
				rotate([0, 90, 0]) {
					cylinder(r=m3_radius, h=thickness);
				}
			}
			translate([0, screw_platform_width / 2, height * 3 / 4]) {
				rotate([0, 90, 0]) {
					cylinder(r=m3_radius, h=thickness);
				}
			}
			translate([0, screw_platform_width * 3 / 2 + (thick_radius + thickness + print_play) * 2, height / 4]) {
				rotate([0, 90, 0]) {
					cylinder(r=m3_radius, h=thickness);
				}
			}
			translate([0, screw_platform_width * 3 / 2 + (thick_radius + thickness + print_play) * 2, height * 3 / 4]) {
				rotate([0, 90, 0]) {
					cylinder(r=m3_radius, h=thickness);
				}
			}
		}
	}

	translate([radius * 2 + 10, 0, 0]) {
		difference() {
			hull() {
				translate([0, axis_height, 0]) {
					cylinder(r=radius, h=thickness);
				}
				translate([-radius, 0, 0]) {
					cube([radius * 2, thickness, thickness]);
				}
			}
			translate([0, axis_height, 0]) {
				for(i = [1 : screws]) {
					rotate([0, 0, i * 360 / screws]) {
						translate([0, screw_distance, 0]) {
							cylinder(r=screw_radius, h=thickness);
						}
					}
				}
			}
			translate([-off_centre, axis_height, 0]) {
				cylinder(r=hole_radius + print_play + movement_play, h=thickness);
			}
		}
		difference() {
			translate([-radius, 0, 0]) {
				cube([radius * 2, thickness, 40]);
			}
			translate([0, axis_height - screw_distance, 0]) {
				cylinder(r=m3_radius * 2, h=thickness + 12); //This screw would clip. Leave some space for the cap of the screw.
			}
			translate([thickness + m3_radius - radius, 0, 10]) {
				rotate([-90, 0, 0]) {
					cylinder(r=m3_radius, h=thickness);
				}
			}
			translate([radius - thickness - m3_radius, 0, 10]) {
				rotate([-90, 0, 0]) {
					cylinder(r=m3_radius, h=thickness);
				}
			}
			translate([0, 0, 40 - thickness - m3_radius]) {
				rotate([-90, 0, 0]) {
					cylinder(r=m3_radius, h=thickness);
				}
			}
		}
	}
}

module motor_rod_adapter() {
	difference() {
		cylinder(r=rod_radius + thickness, h=thickness * 8);
		difference() {
			cylinder(r=rod_radius + print_play, h=thickness * 8);
			translate([-rod_radius - print_play, -rod_radius - print_play, 0]) {
				cube([rod_radius * 2 + print_play * 2, 0.5, thickness * 4]); //Motor has 0.5mm shaven off its shaft for extra grip.
			}
		}
	}
}

box();
translate([box_radius * 2 + thickness * 2 + 20, 0, 0]) {
	lid();
}
translate([0, box_radius + thickness + 40, 0]) {
	rod_gear();
}
translate([-box_radius * 2 - thickness - 20, 0, 0]) {
	rod_holder();
}
translate([0, -box_radius * 2 - 20, 0]) {
	motor_holder();
}
translate([box_radius + 20, box_radius + 20, 0]) {
	motor_rod_adapter();
}