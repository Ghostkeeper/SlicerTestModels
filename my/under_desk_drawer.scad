width = 50;
depth = 30;
length = 200;
thickness = 2; //In the rail and weight-bearing parts.
thickness_drawer = 0.8; //Of the drawer shell.
beam_width = 5;
screw_diameter = 3;
play = 1;
$fs = 0.2;
$fa = 1;

part = "rail"; //rail or drawer.

module railside() {
	translate([0, 0, thickness]) {
		difference() {
			cube([beam_width, length, thickness * 2 + play]);
			translate([beam_width, -0.1, thickness + play]) {
				rotate([0, 135, 0]) {
					cube([thickness * 3, length + 0.2, thickness * 3]);
				}
			}
		}
	}
}

if(part == "rail") {
	//Rail base.
	difference() {
		//Main shape is a cube with 2 big holes ("windows").
		cube([width + beam_width * 2, length + beam_width, thickness]);
		translate([beam_width, beam_width, -0.1]) {
			cube([width, length / 2 - beam_width, thickness + 0.2]);
		}
		translate([beam_width, length / 2 + beam_width, -0.1]) {
			cube([width, length / 2 - beam_width, thickness + 0.2]);
		}

		//Make the middle beam a bit lower for clearance for the drawer.
		translate([beam_width, length / 2 - 0.1, thickness / 2]) {
			cube([width, beam_width + 0.2, thickness / 2 + 0.1]);
		}

		//Screw holes.
		for(dy = [beam_width / 2 : (length / 2) : length + beam_width / 2]) {
			translate([beam_width + width / 2, dy, -0.1]) {
				cylinder(h=thickness + 0.2, r=screw_diameter / 3);
			}
		}
	}
	//Rails on the side.
	railside();
	translate([beam_width * 2 + width, 0, 0]) {
		mirror([1, 0, 0]) {
			railside();
		}
	}
	//Backstop!
	translate([0, length, 0]) {
		cube([width / 3, thickness, thickness * 3 + play]);
	}
	translate([beam_width * 2 + width * 2 / 3, length, 0]) {
		cube([width / 3, thickness, thickness * 3 + play]);
	}
} else {
	//Drawer.
	difference() {
		//Hooking into rails.
		cube([width + beam_width * 2 - thickness * 2 - play * 2, length, thickness]);
		translate([beam_width - thickness - play + thickness_drawer, -0.1, -0.1]) {
			cube([width - thickness_drawer * 2, length + 0.2, thickness + 0.2]);
		}
		translate([thickness, -0.1, thickness]) {
			rotate([0, -135, 0]) {
				cube([thickness * 2, length + 0.2, thickness * 2]);
			}
		}
		translate([width + beam_width * 2 - thickness * 3 - play * 2, -0.1, thickness]) {
			rotate([0, 45, 0]) {
				cube([thickness * 2, length + 0.2, thickness * 2]);
			}
		}
	}
	translate([beam_width - thickness - play, 0, 0]) {
		translate([width / 2, thickness_drawer, 0]) {
			//Cylindrical hollow insides.
			rotate([-90, 0, 0]) {
				scale([1, (depth - thickness_drawer) / (width / 2 - thickness_drawer), 1]) {
					difference() {
						translate([0, 0, -thickness_drawer]) {
							cylinder(h=length, r=width / 2);
						}
						cylinder(h=length - thickness_drawer * 2, r=width / 2 - thickness_drawer);
						translate([-width / 2 - 0.1, 0, -thickness_drawer - 0.1]) {
							cube([width + 0.2, depth + 0.1, length + 0.2]);
						}
					}
				}
			}
		}
	}
}