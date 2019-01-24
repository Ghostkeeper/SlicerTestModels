//Physical.
m3_radius = 1.5;
m3_nut_radius = 3;
m3_nut_thickness = 2;
print_play = 0.2;

//Preferences.
box_radius = 80;
box_height = 150;
box_thickness = 4;
box_grooves = 8;
box_groove_depth = 6;
lid_lip_length = 10;
$fs = 1;
$fa = 5;

module m3_nut() {
	cylinder(h=m3_nut_thickness, r=m3_nut_radius, $fn=6);
}

module box() {
	difference() {
		cylinder(r=box_radius + box_thickness, h=box_thickness + box_height);
		translate([0, 0, box_thickness]) {
			cylinder(r=box_radius, h=box_height);
		}
		translate([-box_radius - box_thickness, 0, box_thickness + box_height - lid_lip_length]) {
			rotate([0, 90, 0]) {
				cylinder(h=(box_radius + box_thickness) * 2, r=m3_radius);
				translate([0, 0, box_thickness / 2 - m3_nut_thickness / 2]) {
					hull() {
						m3_nut();
						translate([-m3_nut_radius, 0, 0]) {
							m3_nut();
						}
					}
				}
				translate([0, 0, box_thickness + box_radius * 2 + box_thickness / 2 - m3_nut_thickness / 2]) {
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
	linear_extrude(height=box_height + box_thickness, twist=120) {
		for(i = [0 : box_grooves]) {
			rotate([0, 0, i / box_grooves * 360]) {
				translate([box_radius - box_groove_depth, -box_groove_depth / 2]) {
					square([box_groove_depth + box_thickness / 2, box_groove_depth]);
				}
			}
		}
	}
}

box();