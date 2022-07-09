blocksize = 30; //Size of the squares.
spacing = 1; //Spacing between the squares.
relief = 0.4; //Height of the pattern of the squares.
d4_rib = 20; //Rib size of the D4 dice stored in the trays (determines size of the trays).
lock_size = 10; //Size of the lock mechanism locking the trays.
thickness = 1; //Thickness of the borders of the trays and board.
tile_height = 2; //Height of the playing tiles (pawns).

$fs = 0.7;
$fa = 1;

//Calculations
d4_height = d4_rib / 3 * sqrt(6) + 1; //1mm play.
height = d4_height + thickness * 3;
border = tile_height + spacing * 2 + 0.3; //0.3mm play.
big_x = 4 * blocksize + 3 * spacing + 2 * border;
gap_x = 2 * blocksize + 3 * spacing - 2 * border;
board_y = 3 * blocksize + 2 * spacing + 2 * border;
tray_width = blocksize + spacing - thickness;
tray_height = d4_height + thickness;

//Game board.
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
}

module tray_gap() {
	lock_radius = lock_size / 3;
	linear_extrude(tray_height) {
		difference() {
			square([gap_x + thickness + lock_size, tray_width]);
			translate([lock_size - lock_radius, tray_width / 2, 0]) {
				circle(lock_radius);
			}
			translate([0, tray_width / 2 - lock_radius, 0]) {
				difference() {
					square(lock_radius * 2);
					translate([lock_radius, lock_radius / -sqrt(2), 0]) {
						circle(lock_radius * sqrt(1 + 1 / sqrt(2)));
					}
					translate([lock_radius, lock_radius * 2 + lock_radius / sqrt(2), 0]) {
						circle(lock_radius * sqrt(1 + 1 / sqrt(2)));
					}
				}
			}
		}
	}
}

//Squares.
translate([border, border, height]) {
	//Bottom row.
	translate([spacing, 0, 0]) {
		rosetta();
	}
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
		translate([spacing, 0, 0]) {
			squares();
		}
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
		translate([spacing, 0, 0]) {
			rosetta();
		}
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