//Settings.
play = 0.2;
num_width = 4;
num_length = 4;
thickness = 1;
clip_width = 10 + play * 2;
clip_depth = 1;
//Measurements.
top_width = 16.4 + play * 2;
top_length = 19.4 + play * 2;
bottom_width = 14.4 + play * 2;
bottom_length = 17.4 + play * 2;
height = 9 + play;

module slot() {
	position = (top_width - bottom_width) / 2;
	translate([position, position, 0]) {
		minkowski() {
			scale([1, 1, 0]) {
				cube([bottom_width, bottom_length, 1]);
			}
			rotate([0, 0, 45]) {
				cylinder(h=height, r1=0, r2=position * sqrt(2), $fn=4);
			}
		}
	}
}

//Main body.
total_width = top_width * num_width + thickness * (num_width + 1);
total_length = top_length * num_length + thickness * (num_length + 1);
difference() {
	cube([total_width, total_length, height + thickness]);
	for(x = [thickness : thickness + top_width : total_width]) {
		for(y = [thickness : thickness + top_length : total_length]) {
			translate([x, y, thickness]) {
				slot();
			}
		}
	}
	translate([total_width / 2 - clip_width / 2, -10, thickness]) {
		multmatrix([[1, 0, 0, 0], [0, 1, -clip_depth / height, 0], [0, 0, 1, 0], [0, 0, 0, 1]]) {
			cube([clip_width, 10 + clip_depth, height]);
		}
	}
	translate([total_width / 2 - clip_width / 2, total_length - clip_depth, thickness]) {
		multmatrix([[1, 0, 0, 0], [0, 1, clip_depth / height, 0], [0, 0, 1, 0], [0, 0, 0, 1]]) {
			cube([clip_width, 10 + clip_depth, height]);
		}
	}
}

//Lid.
translate([total_width + 10, 0, 0]) {
	cube([total_width, total_length, thickness]);
	translate([total_width / 2 - clip_width / 2 + play, -thickness - play, 0]) {
		cube([clip_width - play * 2, thickness + play + 1, thickness]);
		translate([0, 0, thickness]) {
			multmatrix([[1, 0, 0, 0], [0, 1, clip_depth / height, 0], [0, 0, 1, 0], [0, 0, 0, 1]]) {
				cube([clip_width - play * 2, thickness, height - play]);
			}
		}
	}
	translate([total_width / 2 - clip_width / 2 + play, total_length - 1, 0]) {
		cube([clip_width - play * 2, thickness + play + 1, thickness]);
		translate([0, play + 1, thickness]) {
			multmatrix([[1, 0, 0, 0], [0, 1, -clip_depth / height, 0], [0, 0, 1, 0], [0, 0, 0, 1]]) {
				cube([clip_width - play * 2, thickness, height - play]);
			}
		}
	}
}