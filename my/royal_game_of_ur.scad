blocksize = 30;
height = 20;
spacing = 1;
relief = 0.4;
d4_rib = 20;
lock_size = 10;
thickness = 1;
tile_height = 2;

$fs = 0.7;
$fa = 1;

//Calculations
d4_height = d4_rib / 3 * sqrt(6) + 1; //1mm play.
border = tile_height + spacing * 2;

//Game board.
difference() {
	union() {
		cube([4 * blocksize + 3 * spacing + 2 * border, 3 * blocksize + 2 * spacing + 2 * border, height]);
		translate([4 * blocksize + 3 * spacing + 2 * border, blocksize + spacing, 0]) {
			cube([2 * blocksize + 3 * spacing - 2 * border, blocksize + 2 * border, height]);
		}
		translate([6 * blocksize + 6 * spacing, 0, 0]) {
			cube([2 * blocksize + spacing + 2 * border, 3 * blocksize + 2 * spacing + 2 * border, height]);
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