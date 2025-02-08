part_nr = 0; //0 for the anemometer cups, 1 for the part that rests on the head.

thickness = 1;
cup_size = 40;
span = 60;
bearing_height = 7;
bearing_outer = 22;
bearing_inner = 7.8;
clearance = 20;
head_radius = 100;
rib_length = 50;
$fn = 360;

module cup() {
	difference() {
		sphere(r=cup_size / 2);
		sphere(r=cup_size / 2 - thickness);
		translate([0, -cup_size / 2 - 1, -cup_size / 2 - 1]) {
			cube([cup_size / 2 + 1, cup_size + 2, cup_size + 2]);
		}
	}
}
if(part_nr == 0) {
	for(a = [0:120:240]) {
		rotate([0, 0, a]) {
			translate([-thickness / 2, bearing_outer / 2, -(bearing_height + thickness) / 2]) {
				cube([thickness, span - bearing_outer / 2 + thickness, bearing_height + thickness]);
			}
			translate([thickness / 2, span + cup_size / 2, 0]) {
				cup();
			}
		}
	}
	translate([0, 0, -(bearing_height + thickness) / 2]) {
		difference() {
			cylinder(h=bearing_height + thickness, r=bearing_outer / 2 + thickness);
			translate([0, 0, -1]) {
				cylinder(h=bearing_height + 1, r=bearing_outer / 2);
				cylinder(h=bearing_height + thickness + 2, r=bearing_outer / 2 - thickness);
			}
		}
	}
}
else {
	cylinder(h=clearance + bearing_height, r=bearing_inner / 2);
	translate([0, 0, clearance - thickness]) {
		cylinder(h=thickness, r=bearing_inner / 2 + thickness);
	}
	translate([0, 0, clearance - thickness * 2]) {
		cylinder(h=thickness, r1=bearing_inner / 2, r2=bearing_inner / 2 + thickness);
	}
	for(a = [0:120:240]) {
		rotate([0, 0, a]) {
			translate([-bearing_inner / 2, 0, -head_radius]) {
				intersection() {
					rotate([0, 90, 0]) {
						difference() {
							cylinder(h=bearing_inner, r=head_radius + thickness);
							translate([0, 0, -1]) {
								cylinder(h=bearing_inner + 2, r=head_radius);
							}
						}
					}
					difference() {
						cylinder(h=head_radius + thickness, r=rib_length);
						translate([-1, -rib_length - 1, 0]) {
							cube([bearing_inner + 2, rib_length + 1, head_radius + thickness]);
						}
					}
				}
			}
		}
	}
}