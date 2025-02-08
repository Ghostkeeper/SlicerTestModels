frame_width = 18.6;
height = 20;
thickness = 2;
brush_width = 10.2;
bump_width = 2;
bump_thickness = 0.7;
play = 0.2;
$fn = 90;

//Inner clip.
difference() {
	cube([frame_width + thickness * 2, frame_width + thickness, height]);
	translate([thickness, -1, -1]) {
		cube([frame_width, frame_width + 1, height + 2]);
	}
}
for(y=[bump_width / 2 : bump_width : frame_width - bump_width / 2]) {
	translate([0, y, 0]) {
		scale([bump_thickness / bump_width * 2, 1, 1]) {
			cylinder(h=height, r=bump_width / 2, $fn=4);
		}
	}
	translate([frame_width + thickness * 2, y, 0]) {
		scale([bump_thickness / bump_width * 2, 1, 1]) {
			cylinder(h=height, r=bump_width / 2, $fn=4);
		}
	}
}
translate([frame_width / 2 + thickness, frame_width + thickness, 0]) {
	difference() {
		cylinder(h=height + frame_width / 2 + thickness, r=frame_width / 2 + thickness);
		translate([-frame_width / 2 - thickness, -frame_width / 2 - thickness, -1]) {
			cube([frame_width + thickness * 2, frame_width / 2 + thickness, height + frame_width / 2 + thickness + 2]);
		}
		translate([-frame_width / 2 - thickness, 0, 0]) {
			multmatrix([[1, 0, 0, 0], [0, 1, 0.5, 0], [0, 0, 1, 0], [0, 0, 0, 1]]) {
				cube([frame_width + thickness * 2, frame_width + thickness * 2, height + frame_width + thickness * 2]);
			}
		}
		hull() {
			translate([0, brush_width / 2, -1]) {
				cylinder(h=height + frame_width / 2 + thickness + 2, r=brush_width / 2);
			}
			translate([0, frame_width / 2 + thickness, -1]) {
				cylinder(h=height + frame_width / 2 + thickness + 2, r=brush_width / 2);
			}
		}
		translate([frame_width / 2 + thickness, 0, height + frame_width / 2 + thickness]) {
			rotate([0, -90, 0]) {
				cylinder(h=frame_width + thickness * 2, r=frame_width / 2 + thickness);
			}
		}
	}
}
translate([-thickness * 2 - play * 2, -thickness * 2 - play * 2, 0]) {
	translate([0, 0, height - thickness]) {
		cube([thickness * 3 + play * 2, thickness * 3 + play * 2 + frame_width, thickness]);
	}
	cube([thickness * 3 + play * 2, thickness, height]);
	cube([thickness, thickness * 3 + play * 2 + frame_width, height]);
}
translate([thickness + frame_width, -thickness * 2 - play * 2, 0]) {
	translate([0, 0, height - thickness]) {
		cube([thickness * 3 + play * 2, thickness * 3 + play * 2 + frame_width, thickness]);
	}
	cube([thickness * 3 + play * 2, thickness, height]);
	translate([thickness * 2 + play * 2, 0, 0]) {
		cube([thickness, thickness * 3 + play * 2 + frame_width, height]);
	}
}

//Outer clip.
translate([frame_width + thickness * 2 + 10, 0, 0]) {
	difference() {
		cube([frame_width + thickness * 4 + play * 2, frame_width + thickness * 2 + play, height - thickness]);
		translate([thickness, thickness, -1]) {
			cube([frame_width + thickness * 2 + play * 2, frame_width + thickness + play + 1, height - thickness + 2]);
		}
		for(y=[thickness + bump_width / 2 : bump_width : thickness + frame_width - bump_width / 2]) {
			translate([thickness + play, y, -1]) {
				minkowski() {
					scale([bump_thickness / bump_width * 2, 1, 1]) {
						cylinder(h=height - thickness + 2, r=bump_width / 2, $fn=4);
					}
					scale([1, 1, 0]) {
						cylinder(h=1, r=play);
					}
				}
			}
			translate([thickness * 3 + play + frame_width, y, -1]) {
				minkowski() {
					scale([bump_thickness / bump_width * 2, 1, 1]) {
						cylinder(h=height - thickness + 2, r=bump_width / 2, $fn=4);
					}
					scale([1, 1, 0]) {
						cylinder(h=1, r=play);
					}
				}
			}
		}
	}
}