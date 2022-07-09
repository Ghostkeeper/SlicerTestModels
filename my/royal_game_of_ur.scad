blocksize = 30; //Size of the squares.
spacing = 1; //Spacing between the squares.
square_inset = 0.2; //How deep the squares are inset into the board.
relief = 0.6; //Height of the pattern of the squares.
d4_rib = 20; //Rib size of the D4 dice stored in the trays (determines size of the trays).
lock_size = 10; //Size of the lock mechanism locking the trays.
lock_height = 5; //How tall the lock is. Taller makes it stiffer.
lock_opening = 6; //How wide the opening is in the lock. Smaller makes it stiffer.
lock_play = 0.2; //Play between the two components of the lock.
thickness = 1; //Thickness of the borders of the trays and board.
tile_height = 2; //Height of the playing tiles (pawns).
tile_diameter = 20; //Width of the playing tiles.
finger_size = 20; //Size of the gap to pull the trays out.

$fs = 0.7;
$fa = 1;

include_board = true;
include_squares = true;
include_trays = true;
include_tiles_p1 = true;
include_tiles_p2 = true;

//Calculations and play.
d4_height = d4_rib / 3 * sqrt(6) + 1; //1mm play.
tray_height = d4_height + thickness;
tray_gap_height = tray_height + 0.3; //0.3mm play.
height = tray_gap_height + thickness * 2;
border = tile_height + spacing * 2 + 0.3; //0.3mm play.
big_x = 4 * blocksize + 3 * spacing + 2 * border;
gap_x = 2 * blocksize + 3 * spacing - 2 * border;
board_y = 3 * blocksize + 2 * spacing + 2 * border;
tray_gap_width = blocksize + spacing - thickness;
tray_width = tray_gap_width - 0.4; //0.4mm play.
lock_radius = (lock_size - thickness) / 2;

//Game board.
if(include_board) {
	difference() {
		union() {
			cube([big_x, board_y, height]);
			translate([big_x, blocksize + spacing, 0]) {
				cube([gap_x, blocksize + 2 * border, height]);
			}
			translate([big_x + gap_x, 0, 0]) {
				cube([2 * blocksize + spacing + 2 * border, board_y, height]);
			}
		}
		//Space for trays.
		translate([big_x - gap_x - thickness - lock_size + 0.01, 0, thickness]) {
			translate([0, thickness, 0]) {
				tray_gap();
			}
			translate([0, board_y - blocksize - spacing, 0]) {
				tray_gap();
			}
		}
		//Insets for squares.
		for(x=[0:3]) for(y=[0:2]) {
			translate([border + (blocksize + spacing) * x, border + (blocksize + spacing) * y, height - square_inset]) {
				cube([blocksize, blocksize, square_inset + 0.01]);
			}
		}
		for(x=[4:5]) {
			y = 1;
			translate([border + (blocksize + spacing) * x, border + (blocksize + spacing) * y, height - square_inset]) {
				cube([blocksize, blocksize, square_inset + 0.01]);
			}
		}
		for(x=[6:7]) for(y=[0:2]) {
			translate([border + (blocksize + spacing) * x, border + (blocksize + spacing) * y, height - square_inset]) {
				cube([blocksize, blocksize, square_inset + 0.01]);
			}
		}
	}
}

module tray_gap() {
	linear_extrude(tray_gap_height) {
		difference() {
			square([gap_x + thickness + lock_size, tray_gap_width]);
			translate([lock_size - lock_radius, tray_gap_width / 2, 0]) {
				circle(lock_radius - lock_play);
			}
			translate([0, tray_gap_width / 2 - lock_opening / 2 + lock_play, 0]) {
				square([thickness + lock_radius, lock_opening - lock_play * 2]);
			}
		}
	}
}

//Squares.
if(include_squares) {
	translate([border, border, height - square_inset]) {
		//Bottom row.
		rosetta();
		translate([blocksize + spacing, 0, 0]) {
			eyes();
		}
		translate([blocksize * 2 + spacing * 2, 0, 0]) {
			circles();
		}
		translate([blocksize * 3 + spacing * 3, 0, 0]) {
			eyes();
		}
		translate([blocksize * 6 + spacing * 6, 0, 0]) {
			rosetta();
		}
		translate([blocksize * 7 + spacing * 7, 0, 0]) {
			sawtoothbig();
		}
		//Middle row.
		translate([0, blocksize + spacing, 0]) {
			squares();
			translate([blocksize + spacing, 0, 0]) {
				circles();
			}
			translate([blocksize * 2 + spacing * 2, 0, 0]) {
				sawtooths();
			}
			translate([blocksize * 3 + spacing * 3, 0, 0]) {
				rosetta();
			}
			translate([blocksize * 4 + spacing * 4, 0, 0]) {
				circles();
			}
			translate([blocksize * 5 + spacing * 5, 0, 0]) {
				sawtooths();
			}
			translate([blocksize * 6 + spacing * 6, 0, 0]) {
				eyes();
			}
			translate([blocksize * 7 + spacing * 7, 0, 0]) {
				circles();
			}
		}
		//Top row.
		translate([0, blocksize * 2 + spacing * 2, 0]) {
			rosetta();
			translate([blocksize + spacing, 0, 0]) {
				eyes();
			}
			translate([blocksize * 2 + spacing * 2, 0, 0]) {
				circles();
			}
			translate([blocksize * 3 + spacing * 3, 0, 0]) {
				eyes();
			}
			translate([blocksize * 6 + spacing * 6, 0, 0]) {
				rosetta();
			}
			translate([blocksize * 7 + spacing * 7, 0, 0]) {
				sawtoothbig();
			}
		}
	}
}

module rosetta() {
	linear_extrude(relief) {
		difference() {
			square(blocksize);
			translate([blocksize / 2, blocksize / 2, 0]) {
				circle(blocksize * 0.1); //Core.
				rosetta_petals();
				difference() { //First bordering, surrounding closely.
					offset(blocksize * 0.037) {
						rosetta_petals();
					}
					offset(blocksize * 0.03) {
						rosetta_petals();
					}
				}
				difference() { //Second bordering, surrounding loosely.
					offset(blocksize * 0.007) {
						offset(blocksize * -0.40) {
							offset(blocksize * 0.46) {
								rosetta_petals();
							}
						}
					}
					offset(blocksize * -0.40) {
						offset(blocksize * 0.46) {
							rosetta_petals();
						}
					}
				}
			}
		}
	}
}

module rosetta_petals() {
	for(a = [0 : 360 / 8 : 360 - 360 / 8]) { //8 petals.
		rotate([0, 0, a]) {
			intersection() {
				translate([blocksize * 0.25, blocksize * 0.25, 0]) {
					circle(blocksize * 0.3);
				}
				translate([blocksize * 0.25, blocksize * -0.25, 0]) {
					circle(blocksize * 0.3);
				}
			}
		}
	}
}

module circles() {
	linear_extrude(relief) {
		difference() {
			square(blocksize);	
			translate([blocksize / 2, blocksize / 2, 0]) {
				circles_circle();
			}
			translate([blocksize / 4, blocksize / 4, 0]) {
				circles_circle();
			}
			translate([blocksize * 3 / 4, blocksize / 4, 0]) {
				circles_circle();
			}
			translate([blocksize * 3 / 4, blocksize * 3 / 4, 0]) {
				circles_circle();
			}
			translate([blocksize / 4, blocksize * 3 / 4, 0]) {
				circles_circle();
			}
		}
	}
}

module circles_circle() {
	circle(blocksize * 0.08);
	difference() {
		circle(blocksize * 0.14);
		circle(blocksize * 0.13);
	}
}

module squares() {
	linear_extrude(relief) {
		difference() {
			square(blocksize);
			translate([blocksize * 0.05, blocksize * 0.05, 0]) {
				squares_border(blocksize * 0.9);
				squares_corner();
			}
			translate([blocksize * 0.475, blocksize * 0.525, 0]) {
				rotate([0, 0, 90]) {
					squares_corner();
				}
			}
			translate([blocksize * 0.525, blocksize * 0.475, 0]) {
				rotate([0, 0, -90]) {
					squares_corner();
				}
			}
			translate([blocksize * 0.95, blocksize * 0.95, 0]) {
				rotate([0, 0, 180]) {
					squares_corner();
				}
			}
		}
	}
}

module squares_corner() {
	squares_border(blocksize * 0.425);
	squares_border(blocksize * 0.1875);
	translate([blocksize * 0.09375, blocksize * 0.09375, 0]) {
		circle(r = blocksize * 0.05);
	}
	translate([blocksize * 0.2375, 0, 0]) {
		squares_border(blocksize * 0.1875);
	}
	translate([0, blocksize * 0.2375, 0]) {
		translate([blocksize * 0.09375, blocksize * 0.09375, 0]) {
			circle(r = blocksize * 0.05);
		}
		squares_border(blocksize * 0.1875);
	}
	translate([blocksize * 0.2375, blocksize * 0.2375, 0]) {
		translate([blocksize * 0.09375, blocksize * 0.09375, 0]) {
			circle(r = blocksize * 0.05);
		}
		squares_border(blocksize * 0.1875);
	}
}

module squares_border(size) {
	difference() {
		square(size);
		translate([blocksize * 0.01, blocksize * 0.01, 0]) {
			square(size - blocksize * 0.02);
		}
	}
}

module eyes() {
	linear_extrude(relief) {
		difference() {
			square(blocksize);
			eyes_eye();
			translate([blocksize * 0.55, 0, 0]) {
				eyes_eye();
			}
			translate([0, blocksize * 0.55, 0]) {
				eyes_eye();
			}
			translate([blocksize * 0.55, blocksize * 0.55, 0]) {
				eyes_eye();
			}
		}
	}
}

module eyes_eye() {
	squares_border(blocksize * 0.45);
	intersection() {
		union() {
			translate([blocksize * 0.225, blocksize * 0.225, 0]) {
				circle(blocksize * 0.05);
				difference() {
					offset(blocksize * 0.01) {
						eyes_petal();
					}
					eyes_petal();
				}
				difference() {
					offset(blocksize * 0.08) {
						eyes_petal();
					}
					offset(blocksize * 0.07) {
						eyes_petal();
					}
				}
			}
		}
		square(blocksize * 0.45);
	}
}

module eyes_petal() {
	intersection() {
		translate([blocksize * 0.2, 0, 0]) {
			circle(r = blocksize * 0.3);
		}
		translate([blocksize * -0.2, 0, 0]) {
			circle(r = blocksize * 0.3);
		}
	}
}

module sawtooths() {
	linear_extrude(relief) {
		difference() {
			square(blocksize);
			translate([blocksize / 4, blocksize / 4, 0]) {
				sawtooths_saw();
			}
			translate([blocksize * 3 / 4, blocksize / 4, 0]) {
				sawtooths_saw();
			}
			translate([blocksize * 3 / 4, blocksize * 3 / 4, 0]) {
				sawtooths_saw();
			}
			translate([blocksize / 4, blocksize * 3 / 4, 0]) {
				sawtooths_saw();
			}
		}
	}
}

module sawtooths_saw() {
	difference() {
		sawtooths_shape(blocksize * 0.5);
		offset(delta=blocksize * -0.01) {
			sawtooths_shape(blocksize * 0.5);
		}
	}
	circle(blocksize * 0.05);
	translate([blocksize * -0.08, blocksize * -0.08, 0]) {
		circle(blocksize * 0.05);
	}
	translate([blocksize * 0.08, blocksize * -0.08, 0]) {
		circle(blocksize * 0.05);
	}
	translate([blocksize * 0.08, blocksize * 0.08, 0]) {
		circle(blocksize * 0.05);
	}
	translate([blocksize * -0.08, blocksize * 0.08, 0]) {
		circle(blocksize * 0.05);
	}
}

module sawtooths_shape(size) {
	rotate([0, 0, 45]) {
		square([size * sqrt(2) * 7 / 8, size * sqrt(2) / 8], center=true);
		square([size * sqrt(2) * 3 / 8, size * sqrt(2) * 5 / 8], center=true);
		square([size * sqrt(2) * 5 / 8, size * sqrt(2) * 3 / 8], center=true);
		square([size * sqrt(2) / 8, size * sqrt(2) * 7 / 8], center=true);
	}
}

module sawtoothbig() {
	linear_extrude(relief) {
		difference() {
			square(blocksize);
			translate([blocksize / 2, blocksize / 2, 0]) {
				difference() {
					sawtooths_shape(blocksize);
					offset(delta=blocksize * -0.01) {
						sawtooths_shape(blocksize);
					}
				}
				sawtooths_saw();
			}
		}
	}
}

if(include_trays) {
	translate([lock_size, board_y + 5, 0]) {
		tray();
	}
	translate([lock_size, board_y + tray_width + 10, 0]) {
		tray();
	}
}

module tray() {
	tray_length = gap_x + thickness;
	difference() {
		cube([tray_length, tray_width, tray_height]);
		translate([thickness, thickness, thickness]) {
			difference() {
				cube([tray_length - thickness * 2, tray_width - thickness * 2, tray_height - thickness + 0.01]);
				translate([tray_length - thickness, tray_width / 2 - thickness, 0]) {
					cylinder(h=tray_height - thickness, r1=finger_size / 2 + thickness, r2=thickness);
				}
			}
		}
		translate([tray_length, tray_width / 2, thickness]) {
			cylinder(h=tray_height - thickness * 2, r1=finger_size / 2, r2=0);
		}
	}
	translate([tray_length - thickness, 0, thickness]) {
		cube([thickness, tray_width, thickness]); //Lip to catch the finger on.
	}
	//The lock clip.
	translate([-lock_radius, tray_width / 2, 0]) {
		linear_extrude(lock_height) {
			difference() {
				circle(lock_radius + thickness);
				circle(lock_radius);
				translate([-lock_radius - thickness, -lock_opening / 2, 0]) {
					square([thickness + lock_radius, lock_opening]);
				}
			}
		}
	}
}

translate([lock_size + gap_x + thickness + 5, board_y + 5, 0]) {
	if(include_tiles_p1) {
		for(i = [0:6]) { //7 tiles per player.
			translate([(tile_diameter + 1) * i + tile_diameter / 2, tile_diameter / 2, 0]) {
				tile();
			}
		}
	}
	if(include_tiles_p2) {
		for(i = [0:6]) {
			translate([(tile_diameter + 1) * i + tile_diameter / 2, tile_diameter * 1.5 + 1 , 0]) {
				tile();
			}
		}
	}
}

module tile() {
	linear_extrude(tile_height) {
		difference() {
			circle(tile_diameter / 2);
			circle(blocksize * 0.05);
			translate([blocksize * -0.08, blocksize * -0.08, 0]) {
				circle(blocksize * 0.05);
			}
			translate([blocksize * 0.08, blocksize * -0.08, 0]) {
				circle(blocksize * 0.05);
			}
			translate([blocksize * 0.08, blocksize * 0.08, 0]) {
				circle(blocksize * 0.05);
			}
			translate([blocksize * -0.08, blocksize * 0.08, 0]) {
				circle(blocksize * 0.05);
			}
		}
	}
}