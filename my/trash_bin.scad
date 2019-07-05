radius = 60;
height = 140;
thickness = 1;
chamfer = 10;
lid_adhesion = 20;
lip_length = radius * 0.8;
lip_width = radius * 0.4;
lip_play = 0.5;
play = 0.4;
hinge_radius = 1;
hinge_length = 10;
$fs = 0.5;
$fa = 1;

module bin() {
	difference() {
		cylinder(r=radius, h=height);
		translate([0, 0, thickness + chamfer]) {
			minkowski() {
				cylinder(r=radius - thickness - chamfer, h=height);
				sphere(r=chamfer);
			}
		}
	}
}

module lid_hull() {
	difference() {
		cylinder(r=radius - thickness - play, h=lid_adhesion);
		cylinder(r=radius - thickness * 2 - play, h=lid_adhesion);
	}
	translate([0, 0, lid_adhesion]) {
		difference() {
			sphere(r=radius);
			sphere(r=radius - thickness * 2);
			translate([-radius, -radius, -radius]) {
				cube([radius * 2, radius * 2, radius]);
			}
			translate([-lip_length, -lip_width, 0]) {
				cube([lip_length * 2, lip_width * 2, radius]);
			}
		}
		hinge_a = acos(lip_width / (radius - thickness));
		hinge_z = sin(hinge_a) * (radius - thickness);
		translate([0, lip_width, hinge_z]) {
			rotate([90, 0, 0]) {
				cylinder(r=hinge_radius, h=hinge_length);
			}
		}
		translate([0, -lip_width, hinge_z]) {
			rotate([-90, 0, 0]) {
				cylinder(r=hinge_radius, h=hinge_length);
			}
		}
	}
}

module lid() {
	intersection() {
		difference() {
			sphere(r=radius);
			difference() {
				sphere(r=radius - thickness * 2);
				//Two barriers for the lid to roll over.
				translate([-hinge_radius - thickness * 2 - play, -lip_width, 0]) {
					cube([thickness * 2, lip_width * 2, radius]);
				}
				translate([hinge_radius + play, -lip_width, 0]) {
					cube([thickness * 2, lip_width * 2, radius]);
				}
			}
			sphere(r=radius - thickness * 4);
			hinge_a = acos(lip_width / (radius - thickness));
			hinge_z = sin(hinge_a) * (radius - thickness);
			translate([0, lip_width - play, hinge_z]) {
				rotate([90, 0, 0]) {
					cylinder(r=hinge_radius + play, h=hinge_length);
				}
			}
			translate([0, -lip_width + play, hinge_z]) {
				rotate([-90, 0, 0]) {
					cylinder(r=hinge_radius + play, h=hinge_length);
				}
			}
		}
		translate([-lip_length + play + lip_play, -lip_width + play + lip_play, 0]) {
			cube([lip_length * 2 - play * 2 - lip_play * 2, lip_width * 2 - play * 2 - lip_play * 2, radius]);
		}
	}
}

bin();
translate([radius * 2 + 20, 0, 0]) {
	lid_hull();
}
translate([radius * 4 + 40, 0, 0]) {
	lid();
}