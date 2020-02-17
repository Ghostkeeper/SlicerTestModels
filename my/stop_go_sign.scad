width = 80;
thickness = 10;
chamfer = 3;
outer_chamfer = 6;
axle_radius = 3;
axle_play = 1;
handle_width = 40;
fn = 10;
$fs = 0.4;
$fa = 1;

extruder = 1;

module shell() {
	difference() {
		minkowski() {
			cube([width, width, thickness]);
			scale([1, 1, 0]) {
				cylinder(r=outer_chamfer);
			}
		}
		translate([chamfer, chamfer, thickness / 2 + chamfer]) {
			minkowski() {
				cube([width - chamfer * 2, width - chamfer * 2, thickness]);
				sphere(r=chamfer);
			}
		}
	}
}

//Main body.
difference() {
	//Stopping part.
	union() {
		if(extruder == 0) {
			color([1, 0, 0]) {
				shell();
				translate([width / 2, width / 2, thickness / 2]) {
					rotate([0, 0, 360 / 16]) {
						cylinder(r=width / 3, h=thickness / 2, $fn=8);
					}
					translate([0, 0, thickness / 2]) {
						linear_extrude(height=2) {
							translate([0, 1, 0]) {
								text("DON'T", halign="center", valign="bottom");
							}
							translate([0, -1, 0]) {
								text("OPEN", halign="center", valign="top");
							}
						}
					}
				}
			}
		}

		//Opening part.
		if(extruder == 1) {
			color([0, 1, 0]) {
				mirror([0, 0, 1]) {
					shell();
					translate([width / 2, width / 2, thickness / 2]) {
						cylinder(r=width / 3, h=thickness / 2);
						translate([0, 0, thickness / 2]) {
							linear_extrude(height=2) {
								mirror([1, 0]) {
									text("OPEN", halign="center", valign="center");
								}
							}
						}
					}
				}
			}
		}
	}

	//Hole for axle.
	if(extruder == 0 || extruder == 1) {
		translate([width / 2, width - axle_radius, 0]) {
			rotate([-90, 0, 0]) {
				cylinder(r=axle_radius + axle_play, h=axle_radius + axle_play + outer_chamfer + 1);
				cylinder(r=axle_radius + axle_play + 2, h=axle_radius);
			}
		}
	}
}

//Axle.
if(extruder == 2) {
	translate([width / 2, width - axle_radius + axle_play / 2, 0]) {
		rotate([-90, 0, 0]) {
			cylinder(r=axle_radius + 2, h=axle_radius - axle_play);
			cylinder(r=axle_radius, h=outer_chamfer + 10);
			translate([0, 0, outer_chamfer + 10 - chamfer]) {
				for(i = [0:fn - 1]) {
					translate([0, 0, chamfer / fn * i]) {
						cylinder(r1=axle_radius, r2=axle_radius + chamfer / fn * i, h=chamfer - (chamfer / fn * i));
					}
				}
			}
			translate([-handle_width / 2, -thickness, outer_chamfer + 10]) {
				difference() {
					cube([handle_width, thickness * 2, thickness * 2]);
					translate([2, -1, 2]) {
						cube([4, thickness * 2 + 2, 2]);
					}
					translate([handle_width - 6, -1, 2]) {
						cube([4, thickness * 2 + 2, 2]);
					}
					translate([-1, thickness, thickness * 2]) {
						rotate([0, 90, 0]) {
							cylinder(r=6.4, h=handle_width + 2);
						}
					}
				}
			}
		}
	}
}