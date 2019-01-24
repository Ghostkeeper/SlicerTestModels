//Physical.
m3_radius = 1.5;
print_play = 0.2;

//Preferences.
box_radius = 80;
box_height = 150;
box_thickness = 4;
box_grooves = 8;
box_groove_depth = 6;
$fs = 1;
$fa = 5;

module box() {
	difference() {
		cylinder(r=box_radius + box_thickness, h=box_thickness + box_height);
		translate([0, 0, box_thickness]) {
			cylinder(r=box_radius, h=box_height);
		}
		translate([-box_radius - box_thickness, 0, box_height - 10]) {
			rotate([0, 90, 0]) {
				cylinder(h=(box_radius + box_thickness) * 2, r=m3_radius);
			}
		}
	}
	linear_extrude(height=box_height + box_thickness, twist=100) {
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