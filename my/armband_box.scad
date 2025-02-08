armband_radius = 60 / 2;
box_radius = 80 / 2;
thickness = 2;
outdent = 5;
outdent_slope = 1;
height = 20;
pattern = 0.4;
play = 0.2;
$fn = 180;

difference() {
	cylinder(r = box_radius, h = height);
	translate([0, 0, thickness]) {
		cylinder(r = box_radius - thickness, h = height - thickness + 1);
	}
}
difference() {
	union() {
		translate([0, 0, thickness]) {
			cylinder(r1 = box_radius - thickness, r2 = armband_radius, h=outdent_slope);
			translate([0, 0, outdent_slope]) {
				for(i = [0:0.1:outdent]) {
					cylinder(r1=armband_radius - i, r2=armband_radius - outdent, h=i);
				}
			}
		}
	}
	translate([0, 0, thickness + outdent + outdent_slope - pattern]) {
		leaf_love((armband_radius - outdent) * 2);
	}
}

translate([100, 0, 0]) {
	difference() {
		union() {
			cylinder(h=thickness, r=box_radius - thickness - play);
			translate([0, 0, thickness]) {
				cylinder(h=thickness, r=box_radius);
			}
		}
		translate([0, 0, thickness * 2 - pattern]) {
			leaf_love(box_radius * 2);
		}
		translate([0, 0, -1]) {
			linear_extrude(pattern + 1) {
				mirror([1, 0, 0]) {
					text("I love you!", halign="center", valign="center", size=5);
				}
			}
		}
	}
}

module leaf_love(symbol_size) {
	border_amplitude = 0.015;
	border_frequency = 13;

	linear_extrude(pattern + 1) {
		difference() {
			polygon([for(a = [0:0.1:360]) [cos(a) * symbol_size * (0.45 + cos(a * border_frequency) * border_amplitude),
			                           sin(a) * symbol_size * (0.45 + cos(a * border_frequency) * border_amplitude)]]);
			polygon([for(a = [0:0.1:360]) [cos(a) * symbol_size * (0.445 + cos(a * border_frequency) * border_amplitude),
			                           sin(a) * symbol_size * (0.445 + cos(a * border_frequency) * border_amplitude)]]);
		}
		for(a = [10:10:360]) {
			translate([cos(a) * symbol_size * (0.4475 + cos(a * border_frequency) * border_amplitude), sin(a) * symbol_size * (0.4475 + cos(a * border_frequency) * border_amplitude), 0]) {
				local_rotate = (round(cos(a * border_frequency) * 0.5 + 0.5) - 0.5) * 50;
				rotate([0, 0, a + local_rotate]) {
					heart(symbol_size / 10);
				}
			}
		}
		for(a = [90:90:360]) {
			rotate([0, 0, a]) {
				translate([0, symbol_size * -0.02, 0]) {
					heart(symbol_size);
				}
			}
		}
	}
}

module heart(symbol_size) {
	hull() {
		translate([-symbol_size * 0.1, -symbol_size * 0.24, 0]) {
			circle(symbol_size * 0.1);
		}
		circle(symbol_size * 0.001);
	}
	hull() {
		translate([symbol_size * 0.1, -symbol_size * 0.24, 0]) {
			circle(symbol_size * 0.1);
		}
		circle(symbol_size * 0.001);
	}
}

module rosetta(symbol_size) {
	linear_extrude(pattern + 1) {
		circle(symbol_size * 0.1); //Core.
		rosetta_petals(symbol_size);
		difference() { //First bordering, surrounding closely.
			offset(symbol_size * 0.037) {
				rosetta_petals(symbol_size);
			}
			offset(symbol_size * 0.03) {
				rosetta_petals(symbol_size);
			}
		}
		difference() { //Second bordering, surrounding loosely.
			offset(symbol_size * 0.007) {
				offset(symbol_size * -0.40) {
					offset(symbol_size * 0.46) {
						rosetta_petals(symbol_size);
					}
				}
			}
			offset(symbol_size * -0.40) {
				offset(symbol_size * 0.46) {
					rosetta_petals(symbol_size);
				}
			}
		}
	}
}

module rosetta_petals(symbol_size) {
	for(a = [0 : 360 / 8 : 360 - 360 / 8]) { //8 petals.
		rotate([0, 0, a]) {
			intersection() {
				translate([symbol_size * 0.25, symbol_size * 0.25, 0]) {
					circle(symbol_size * 0.3);
				}
				translate([symbol_size * 0.25, symbol_size * -0.25, 0]) {
					circle(symbol_size * 0.3);
				}
			}
		}
	}
}