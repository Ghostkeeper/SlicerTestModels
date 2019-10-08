//Spool holder holder for the UM3.

//Measurements.
total_width = 49.8;
plate_width = 6;
lip_height = 3.2;
gaps_radius = 52 / 2;
gaps_hor_height = 14;
gaps_hor_width = 6;
gaps_ver_height = 16;
gaps_ver_width = 34;
clips_gap = 4;
clips_extend = 8;
thickness = 6.5;

//Settings.
lip_size = 1;
print_play = 0.2;
width = 60;
backplate_height = 200;
$fs = 0.4;
$fa = 1;

//Top side.
translate([plate_width + print_play * 2, -thickness, 0]) {
	cube([total_width - plate_width + thickness, thickness, width]);
}
translate([0, -lip_height - thickness, 0]) {
	hull() {
		cube([plate_width + print_play * 2, thickness, width]);
		translate([0, lip_height, 0]) {
			cube([total_width + print_play * 2 + thickness, thickness - lip_height, width]);
		}
	}
}
//Lip to prevent sliding.
translate([total_width + print_play * 2, 0, 0]) {
	cube([thickness, plate_width + lip_size * sqrt(2) - print_play, width]);
	translate([0, plate_width - print_play, 0]) {
		rotate([0, 0, 45]) {
			cube([lip_size, lip_size, width]);
		}
	}
}

//Backplate.
translate([-thickness - clips_gap, -lip_height - thickness, 0]) {
	difference() {
		cube([thickness + clips_gap, backplate_height, width]);
		translate([thickness, backplate_height - width / 2, width / 2]) {
			rotate([0, 90, 0]) {
				cylinder(r=gaps_radius + clips_extend + print_play, h=clips_gap + 1);
			}
		}
		translate([-1, backplate_height - width / 2, width / 2]) {
			rotate([0, 90, 0]) {
				intersection() {
					difference() {
						cylinder(r=gaps_radius + print_play, h=thickness + 2);
						cylinder(r=gaps_radius - gaps_hor_width, h=thickness + 2);
					}
					translate([-gaps_radius - print_play, -gaps_hor_height / 2, 0]) {
						cube([(gaps_radius + print_play) * 2, gaps_hor_height, thickness + 2]);
					}
				}
				intersection() {
					cylinder(r=gaps_radius + print_play, h=thickness + 2);
					translate([-gaps_ver_width / 2, -gaps_radius - print_play, 0]) {
						cube([gaps_ver_width, gaps_ver_height + print_play, thickness + 2]);
					}
				}
			}
		}
	}
}