//This is an OpenSCAD script that generates an inlay for a board game by Douglas and his friends.
//To create a 3D model for 3D printing, download OpenSCAD here: https://openscad.org/
//In that software, press F6 and then F7 to save the model as STL, which can be imported by 3D printing software.

//Dimensions of the contents, in mm.
big_card_length = 65;
big_card_width = 45;
face_card_length = 45;
face_card_width = 32;
dragon_card_length = 53;
dragon_card_width = 38;

space_items_depth = 7;
namek_items_depth = 21;
earth_items_depth = 21;
dragon_cards_depth = 1;
objective_cards_depth = 9;
event_cards_depth = 21;
face_cards_depth = 9;

pens_shenzu_length = 238;
pens_shenzu_width = 71.5;
pens_shenzu_depth = 33.8;
character_sheets_length = 216;
character_sheets_width = 154;
character_sheets_depth = 22;

box_width = 254; //Size of the cardboard box.

//Settings.
segment = 0; //If 0, print everything. Otherwise print segments 1, 2, 3 or 4.
card_play = 1; //Amount of play (mm) around each card to let them fall in more easily.
card_depth_play = 1; //Amount of extra depth for the stacks of cards so they don't slide away out of their crevice.
box_play = 0.5; //Amount of play (mm) of the inlay to fit easily inside the cardboard box.
finger_diameter = 23; //How much space to leave for fingers to pick up cards.
finger_extra_depth = 3; //So that you can pick up the cards more easily.
thickness_ver = 1; //Minimum thickness of the floor.
round_size = 2; //Radius of the rounding of outside edges.
fillet_size = 1; //Radius of the rounding of inside edges.
//$fs = 0.2; //Resolution of circles (segment length).
//$fa = 1; //Resolution of circles (degrees).
$fn = 10;

//===== Implementation below. Don't change (unless you know what you're doing) ======

//Calculations for sizes that we'll need.
total_depth = max(max(space_items_depth, namek_items_depth, earth_items_depth, dragon_cards_depth, event_cards_depth) + card_depth_play + character_sheets_depth, face_cards_depth + card_depth_play + pens_shenzu_depth) + finger_extra_depth + thickness_ver;
inlay_width = box_width - box_play * 2;
layer1_spacing = (inlay_width - pens_shenzu_width - character_sheets_width) / 3;
face_cards_spacing = (pens_shenzu_length - face_card_width * 6 - card_play * 12) / 7;
big_cards_x_spacing = (character_sheets_width - big_card_length * 2 - card_play * 4) / 3;
big_cards_y_spacing = (character_sheets_length - big_card_width * 4 - card_play * 8) / 5;

echo("Inlay size is:", str(inlay_width), str(inlay_width), str(total_depth));

module round_shape() {
	difference() {
		translate([-0.1, 0, 0]) {
			square(round_size + 0.1);
		}
		translate([round_size, 0, 0]) {
			circle(round_size);
		}
	}
}
module round_corner() {
	rotate_extrude() {
		translate([fillet_size, 0, 0]) {
			round_shape();
		}
	}
}

module hole(length, width, depth) {
	translate([fillet_size, fillet_size, -depth + fillet_size]) {
		minkowski() {
			cube([length - fillet_size * 2, width - fillet_size * 2, depth - fillet_size + 1]);
			sphere(fillet_size);
		}
	}
	translate([fillet_size, -round_size, 0]) {
		rotate([0, 90, 0]) {
			linear_extrude(length - fillet_size * 2) round_shape();
		}
	}
	translate([length - fillet_size, fillet_size, -round_size]) {
		round_corner();
	}
	translate([length, width - fillet_size, -round_size]) {
		rotate([90, 0, 0]) {
			linear_extrude(width - fillet_size * 2) round_shape();
		}
	}
	translate([length - fillet_size, width - fillet_size, -round_size]) {
		round_corner();
	}
	translate([fillet_size, width, -round_size]) {
		rotate([90, 0, 90]) {
			linear_extrude(length - fillet_size * 2) round_shape();
		}
	}
	translate([fillet_size, width - fillet_size, -round_size]) {
		round_corner();
	}
	translate([0, fillet_size, -round_size]) {
		rotate([-90, 180, 0]) {
			linear_extrude(width - fillet_size * 2) round_shape();
		}
	}
	translate([fillet_size, fillet_size, -round_size]) {
		round_corner();
	}
}

module hole_mask(length, width, depth) {
	translate([0, 0, -total_depth]) {
		cube([length, width, total_depth]);
	}
}

module circular_round(radius, angle=360) {
	rotate_extrude(angle=angle) {
		difference() {
			translate([radius - 1, 0, -1]) {
				square(round_size + 1);
			}
			translate([radius + round_size, 0, 0]) {
				circle(round_size);
			}
		}
	}
}

module finger_hole(finger_depth, depth, middle_level_rotate) {
	translate([0, 0, fillet_size]) {
		minkowski() {
			cylinder(h=finger_depth + finger_extra_depth + total_depth, r=finger_diameter / 2 - fillet_size);
			sphere(fillet_size);
		}
	}
	translate([0, 0, finger_depth + round_size]) {
		circular_round(finger_diameter / 2);
	}
	translate([0, 0, card_depth_play + finger_depth - depth]) {
		rotate([0, 0, middle_level_rotate]) {
			circular_round(finger_diameter / 2, angle=180);
		}
	}
}

module card(length, width, depth, finger_vertical = false, left_depth = -1, right_depth = -1) { //Common shape for each card.
	left_finger_depth = max(depth, left_depth);
	right_finger_depth = max(depth, right_depth);

	hole(length + card_play * 2, width + card_play * 2, depth + card_depth_play);
	translate([0, 0, -depth - card_depth_play]) {
		if(!finger_vertical) {
			translate([length / 2 + card_play, 0, -finger_extra_depth - right_finger_depth + depth]) {
				finger_hole(right_finger_depth, depth, 0);
			}
			translate([length / 2 + card_play, width + card_play * 2, -finger_extra_depth - left_finger_depth + depth]) {
				finger_hole(left_finger_depth, depth, 180);
			}
		} else {
			translate([0, width / 2 + card_play, -finger_extra_depth - right_finger_depth + depth]) {
				finger_hole(right_finger_depth, depth, 270);
			}
			translate([length + card_play * 2, width / 2 + card_play, -finger_extra_depth - left_finger_depth + depth]) {
				finger_hole(left_finger_depth, depth, 90);
			}
		}
	}
}

//Shapes used to create the box.
intersection() {
	difference() {
		translate([round_size, round_size, 0]) {
			minkowski() {
				cube([inlay_width - round_size * 2, inlay_width - round_size * 2, total_depth - round_size]);
				difference() {
					sphere(round_size);
					translate([-round_size, -round_size, -round_size]) {
						cube([round_size * 2, round_size * 2, round_size]);
					}
				}
			}
		}
		//Layer 1: Pens, shenzu and character sheets.
		translate([layer1_spacing, inlay_width / 2 - pens_shenzu_length / 2, total_depth]) {
			hole(pens_shenzu_width, pens_shenzu_length, pens_shenzu_depth);
		}
		translate([layer1_spacing * 2 + pens_shenzu_width, inlay_width / 2 - character_sheets_length / 2, total_depth]) {
			hole(character_sheets_width, character_sheets_length, character_sheets_depth);
		}

		//Layer 2: All the cards!
		intersection() {
			for(y = [0:face_cards_spacing + face_card_width + card_play * 2:pens_shenzu_length - face_card_width - card_play * 2]) {
				translate([layer1_spacing + pens_shenzu_width / 2 - face_card_length / 2 - card_play, inlay_width / 2 - pens_shenzu_length / 2 + face_cards_spacing + y, total_depth - pens_shenzu_depth]) {
					card(face_card_length, face_card_width, face_cards_depth, finger_vertical=true);
				}
			}
			translate([layer1_spacing, inlay_width / 2 - pens_shenzu_length / 2, total_depth]) {
				hole_mask(pens_shenzu_width, pens_shenzu_length, pens_shenzu_depth);
			}
		}
		intersection() {
			union() {
				translate([layer1_spacing * 2 + pens_shenzu_width + big_cards_x_spacing, inlay_width / 2 - character_sheets_length / 2 + big_cards_y_spacing, total_depth - character_sheets_depth]) {
					card(big_card_length, big_card_width, objective_cards_depth);
					translate([0, big_card_width + card_play * 2 + big_cards_y_spacing, 0]) {
						card(big_card_length, big_card_width, objective_cards_depth);
					}
					translate([0, big_card_width * 2 + card_play * 4 + big_cards_y_spacing * 2, 0]) {
						card(big_card_length, big_card_width, objective_cards_depth, left_depth=event_cards_depth);
					}
					translate([0, big_card_width * 3 + card_play * 6 + big_cards_y_spacing * 3, 0]) {
						card(big_card_length, big_card_width, event_cards_depth);
					}
				}
				translate([layer1_spacing * 2 + pens_shenzu_width + big_cards_x_spacing * 2 + big_card_length + card_play * 2, inlay_width / 2 - character_sheets_length / 2 + big_cards_y_spacing, total_depth - character_sheets_depth]) {
					card(big_card_length, big_card_width, space_items_depth, left_depth=namek_items_depth);
					translate([0, big_card_width + card_play * 2 + big_cards_y_spacing, 0]) {
						card(big_card_length, big_card_width, namek_items_depth);
					}
					translate([0, big_card_width * 2 + card_play * 4 + big_cards_y_spacing * 2, 0]) {
						card(big_card_length, big_card_width, earth_items_depth);
					}
					translate([big_card_length / 2 - dragon_card_length / 2, big_card_width * 3 + card_play * 6 + big_cards_y_spacing * 3 + big_card_width / 2 - dragon_card_width / 2, 0]) {
						card(dragon_card_length, dragon_card_width, dragon_cards_depth, right_depth=earth_items_depth);
					}
				}
			}
			translate([layer1_spacing * 2 + pens_shenzu_width, inlay_width / 2 - character_sheets_length / 2, total_depth]) {
				hole_mask(character_sheets_width, character_sheets_length, character_sheets_depth);
			}
		}
	}
	if(segment == 1) {
		cube([layer1_spacing * 2 + pens_shenzu_width, box_width / 2, total_depth]);
	}
	if(segment == 2) {
		translate([0, box_width / 2, 0]) {
			cube([layer1_spacing * 2 + pens_shenzu_width, box_width / 2, total_depth]);
		}
	}
	if(segment == 3) {
		translate([layer1_spacing * 2 + pens_shenzu_width, 0, 0]) {
			cube([box_width - layer1_spacing * 2 - pens_shenzu_width, box_width / 2, total_depth]);
		}
	}
	if(segment == 4) {
		translate([layer1_spacing * 2 + pens_shenzu_width, box_width / 2, 0]) {
			cube([box_width - layer1_spacing * 2 - pens_shenzu_width, box_width / 2, total_depth]);
		}
	}
}