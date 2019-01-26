use<gear.scad>;

//Physical.
m3_radius = 1.5;
m3_nut_radius = 3; //TODO: Measure!
m3_nut_thickness = 2; //TODO: Measure!
print_play = 0.2;
rod_radius = 2; //TODO: Measure!

//Preferences.
box_radius = 80;
box_height = 150;
thickness = 4;
box_grooves = 8;
box_groove_depth = 6;
teeth_diameter = 2;
teeth_width = 10;
lid_lip_length = 10;
rod_gear_radius = 5;
$fs = 1;
$fa = 0.1;

module m3_nut() {
	cylinder(h=m3_nut_thickness + 2 * print_play, r=m3_nut_radius + print_play, $fn=6);
}

module box() {
	difference() {
		union() {
			cylinder(r=box_radius + thickness, h=thickness + box_height);
			linear_extrude(height=teeth_width) {
				gear(inner_radius=box_radius + thickness, teeth_diameter=teeth_diameter, pressure_angle=30);
			}
			translate([0, 0, box_height + thickness - teeth_width - lid_lip_length * 2]) {
				linear_extrude(height=teeth_width) {
					gear(inner_radius=box_radius + thickness, teeth_diameter=teeth_diameter, pressure_angle=30);
				}
			}
		}
		translate([0, 0, thickness]) {
			cylinder(r=box_radius, h=box_height);
		}
		translate([-box_radius - thickness, 0, thickness + box_height - lid_lip_length]) {
			rotate([0, 90, 0]) {
				cylinder(h=(box_radius + thickness) * 2, r=m3_radius + print_play);
				translate([0, 0, thickness / 2 - m3_nut_thickness / 2 - print_play]) {
					hull() {
						m3_nut();
						translate([-m3_nut_radius, 0, 0]) {
							m3_nut();
						}
					}
				}
				translate([0, 0, thickness + box_radius * 2 + thickness / 2 - m3_nut_thickness / 2 - print_play]) {
					hull() {
						m3_nut();
						translate([-m3_nut_radius, 0, 0]) {
							m3_nut();
						}
					}
				}
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
	cylinder(r=box_radius + thickness, h=thickness);
	difference() {
		union() {
			translate([-box_radius / 2 - thickness * 2, 0, 0]) {
				cylinder(r=box_radius / 2, h=lid_lip_length * 2);
			}
			translate([box_radius / 2 + thickness * 2, 0, 0]) {
				cylinder(r=box_radius / 2, h=lid_lip_length * 2);
			}
		}
		cylinder(r=box_radius + thickness + print_play, h=lid_lip_length * 2);
		translate([-box_radius - thickness * 2, 0, thickness + lid_lip_length]) {
			rotate([0, 90, 0]) {
				cylinder(r=m3_radius + print_play, h=box_radius * 2 + thickness * 4);
			}
		}
	}
}

module rod_gear() {
	difference() {
		linear_extrude(height=teeth_width) {
			gear(inner_radius=rod_gear_radius, teeth_diameter=teeth_diameter, pressure_angle=30);
		}
		cylinder(r=rod_radius + print_play, h=teeth_width);
	}
}

box();
translate([box_radius * 2 + thickness * 2 + 20, 0, 0]) {
	lid();
}
translate([0, box_radius + thickness + 20, 0]) {
	rod_gear();
}