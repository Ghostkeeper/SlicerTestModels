//My phone cover and reinforcement for the headphone jack.

//Measurements of Samsung Galaxy 7 Edge
phone_width = 72.6;
phone_height = 150.9;
phone_depth = 8.0;

phone_roundness_h = 6.6; //How far in the X direction the roundness extends over the screen.
phone_roundness_v_radius = 7.0; //The vertical roundness is not exactly round. Eccentricity!
phone_roundness_corner = 10.5; //Radius of the four rounded corners.

button_volumes_y = 98.5;
button_volumes_height = 30.0;
button_volumes_depth = 4.0;
button_power_y = 88.0;
button_power_height = 17.5;
button_power_depth = 4.0;

jack_x = 19.2; //Position of centre!
jack_width = 10.3;
jack_sleeve_diameter = 10.3; //Allow 0.3mm more for inaccuracy in printing.
jack_sleeve_length = 22.0; //How long the tube for the jack is.

//Arm measurements.
arm_width_max = 80;
arm_width_min = 60;
arm_height_max = 80;
arm_height_min = 45;

//Settings
thickness = 1.05; //Align to line width for best print results.
undercut = 0.2; //How far below the phone's surface the mesh will stay.
max_overhang = 1.5; //How much the lip of the cover is allowed to overhang (barring undercut).
jack_sleeve_overhang = 3; //How far the sleeve covers the phone. Needs to be at least so that it covers the v_radius component!
jack_sleeve_diameter2 = 15; //Make it thicker at the base for strength.
jack_sleeve_endstop_length = 3; //Make the sleeve slope back down to disappear in the object.

bottom_buttons_y = 6;
buttons_depth = 2;
buttons_prominence = 1;
buttons_gap = 0.3;

//$fs = 0.5;
//$fa = 1;

//Implementation.
module body() {
	intersection() {
		union() { //Main body with rounded corners left and right.
			translate([phone_roundness_h, 0, 0]) {
				cube([phone_width - phone_roundness_h * 2, phone_height, phone_depth]);
			}
			translate([phone_roundness_h, 0, phone_depth / 2]) {
				scale([1, 1, (phone_depth / 2) / phone_roundness_h]) {
					rotate([-90, 0, 0]) {
						cylinder(r=phone_roundness_h, h=phone_height);
					}
				}
			}
			translate([phone_width - phone_roundness_h, 0, phone_depth / 2]) {
				scale([1, 1, (phone_depth / 2) / phone_roundness_h]) {
					rotate([-90, 0, 0]) {
						cylinder(r=phone_roundness_h, h=phone_height);
					}
				}
			}
		}
		union() { //Filter to cause vertical roundness.
			translate([0, phone_roundness_v_radius, phone_depth / 2]) {
				rotate([0, 90, 0]) {
					cylinder(r=phone_roundness_v_radius, h=phone_width);
				}
			}
			translate([0, phone_height - phone_roundness_v_radius, phone_depth / 2]) {
				rotate([0, 90, 0]) {
					cylinder(r=phone_roundness_v_radius, h=phone_width);
				}
			}
			translate([0, phone_roundness_v_radius, phone_depth / 2 - phone_roundness_v_radius]) {
				cube([phone_width, phone_height - phone_roundness_v_radius * 2, phone_roundness_v_radius * 2]);
			}
		}
		union() { //Filter to cause four rounded corners.
			translate([phone_roundness_corner, phone_roundness_corner, 0]) {
				cylinder(r=phone_roundness_corner, h=phone_depth);
			}
			translate([phone_width - phone_roundness_corner, phone_roundness_corner, 0]) {
				cylinder(r=phone_roundness_corner, h=phone_depth);
			}
			translate([phone_width - phone_roundness_corner, phone_height - phone_roundness_corner, 0]) {
				cylinder(r=phone_roundness_corner, h=phone_depth);
			}
			translate([phone_roundness_corner, phone_height - phone_roundness_corner, 0]) {
				cylinder(r=phone_roundness_corner, h=phone_depth);
			}
			translate([phone_roundness_corner, 0, 0]) {
				cube([phone_width - phone_roundness_corner * 2, phone_height, phone_depth]);
			}
			translate([0, phone_roundness_corner, 0]) {
				cube([phone_width, phone_height - phone_roundness_corner * 2, phone_depth]);
			}
		}
	}
}

module arm() {
	hull() {
		translate([phone_width / 2, -jack_sleeve_length - thickness, 0]) {
			translate([0, 0, -arm_height_max / 2]) {
				rotate([-90, 0, 0]) {
					scale([arm_width_max / arm_height_max, 1, 0]) {
						cylinder(r=arm_height_max / 2, h=1);
					}
				}
			}
			translate([0, jack_sleeve_length + phone_height + thickness * 2, -arm_height_min / 2]) {
				rotate([-90, 0, 0]) {
					scale([arm_width_min / arm_height_min, 1, 0]) {
						cylinder(r=arm_height_min / 2, h=1);
					}
				}
			}
		}
	}
}

module elastic_hook(x) {
	//Hook for the elastic band to attach the thing to my arm.
	thickness = 2;
	length = 10;
	move_up = 10;
	extra_slope = 5; //Extra slope to "hook" the elastic band in.
	
	translate([phone_width / 2 - arm_width_max / 2, -jack_sleeve_length, -arm_height_max / 2 + move_up]) {
		rotate([atan2((arm_height_max - arm_height_min) / 2, jack_sleeve_length + phone_height), 0, 0]) {
			translate([0, x, 0]) { //Yeah, actually Y. Oh well.
				rotate([extra_slope, 0, 0]) {
					cube([arm_width_max, length, thickness]);
					translate([0, length, 0]) {
						rotate([-extra_slope + 180, 0, 0]) {
							cube([arm_width_max, thickness, arm_width_max]);
						}
					}
				}
			}
		}
	}
}

//Render the main shell.
difference() {
	hull() {
		minkowski() {
			body();
			sphere(r=thickness);
		}

		//Bottom side bump.
		translate([jack_sleeve_diameter2 / 2, -thickness - jack_sleeve_length, phone_depth / 2]) {
			rotate([-90, 0, 0]) {
				cylinder(r1=jack_sleeve_diameter / 2 + thickness, r2=jack_sleeve_diameter2 / 2 + thickness, h=jack_sleeve_length + jack_sleeve_overhang + thickness);
				translate([0, 0, jack_sleeve_length + jack_sleeve_overhang + thickness]) {
					cylinder(r1=jack_sleeve_diameter2 / 2 + thickness, r2=phone_depth / 2, h=jack_sleeve_endstop_length);
				}
			}
		}
		translate([phone_width - jack_sleeve_diameter2 / 2, -thickness - jack_sleeve_length, phone_depth / 2]) {
			rotate([-90, 0, 0]) {
				cylinder(r1=jack_sleeve_diameter / 2 + thickness, r2=jack_sleeve_diameter2 / 2 + thickness, h=jack_sleeve_length + jack_sleeve_overhang + thickness);
				translate([0, 0, jack_sleeve_length + jack_sleeve_overhang + thickness]) {
					cylinder(r1=jack_sleeve_diameter2 / 2 + thickness, r2=phone_depth / 2, h=jack_sleeve_endstop_length);
				}
			}
		}

		arm();
	}
	body(); //Room for the phone.
	arm(); //Room for the arm.

	elastic_hook(20);
	elastic_hook(jack_sleeve_length + phone_height - 30);

	//Hole for the jack plug.
	translate([jack_x, -thickness - jack_sleeve_length, phone_depth / 2]) {
		rotate([-90, 0, 0]) {
			cylinder(r=jack_sleeve_diameter / 2, h=jack_sleeve_length + jack_sleeve_overhang + thickness);
		}
	}

	//Remove top cover.
	inset = min(sqrt(1 - pow((phone_depth / 2 - undercut) / phone_roundness_v_radius, 2)) * phone_roundness_v_radius / (phone_depth / 2 - undercut), max_overhang); //cos(sin-1(h)) = sqrt(1 - h^2)
	translate([-thickness + inset, -thickness + inset, phone_depth - undercut]) {
		cube([phone_width + thickness * 2 - inset * 2, phone_height + thickness * 2 - inset * 2, jack_sleeve_diameter2]);
	}

	//Apply maximum overhang.
	intersection() {
		union() {
			translate([phone_roundness_corner, phone_roundness_corner, phone_depth / 2]) {
				cylinder(r=phone_roundness_corner, h=phone_depth / 2);
			}
			translate([phone_width - phone_roundness_corner, phone_roundness_corner, phone_depth / 2]) {
				cylinder(r=phone_roundness_corner, h=phone_depth / 2);
			}
			translate([phone_width - phone_roundness_corner, phone_height - phone_roundness_corner, phone_depth / 2]) {
				cylinder(r=phone_roundness_corner, h=phone_depth / 2);
			}
			translate([phone_roundness_corner, phone_height - phone_roundness_corner, phone_depth / 2]) {
				cylinder(r=phone_roundness_corner, h=phone_depth / 2);
			}
			translate([phone_roundness_corner, 0, phone_depth / 2]) {
				cube([phone_width - phone_roundness_corner * 2, phone_height, phone_depth / 2]);
			}
			translate([0, phone_roundness_corner, phone_depth / 2]) {
				cube([phone_width, phone_height - phone_roundness_corner * 2, phone_depth / 2]);
			}
		}
		translate([max_overhang, max_overhang, phone_depth / 2]) {
			cube([phone_width - max_overhang * 2, phone_height - max_overhang * 2, phone_depth / 2]);
		}
	}

	//Subtract holes for buttons, peripherals, etc.
	//Volume buttons.
	translate([-thickness, button_volumes_y, phone_depth / 2 - button_volumes_depth / 2]) {
		cube([thickness + phone_roundness_h, button_volumes_height, button_volumes_depth]);
	}
	//Power button.
	translate([phone_width - phone_roundness_h, button_power_y, phone_depth / 2 - button_power_depth / 2]) {
		cube([thickness + phone_roundness_h, button_power_height, button_power_depth]);
	}

	//Buttons on bottom side.
	translate([0, -jack_sleeve_length - thickness + bottom_buttons_y, phone_depth / 2 + jack_sleeve_diameter / 2 + thickness]) {
		rotate([atan2((jack_sleeve_diameter2 - jack_sleeve_diameter) / 2, jack_sleeve_length + jack_sleeve_overhang + thickness), 0, 0]) {
			translate([25 - buttons_gap, -buttons_gap, -buttons_depth]) {
				cube([15 + buttons_gap * 2, 12 + buttons_gap * 2, buttons_depth + 1]);
			}
			translate([43 - buttons_gap, -buttons_gap, -buttons_depth]) {
				cube([15 + buttons_gap * 2, 12 + buttons_gap * 2, buttons_depth + 1]);
			}
		}
	}
}

//Buttons on bottom side.
translate([0, -jack_sleeve_length - thickness + bottom_buttons_y, phone_depth / 2 + jack_sleeve_diameter / 2 + thickness]) {
	rotate([atan2((jack_sleeve_diameter2 - jack_sleeve_diameter) / 2, jack_sleeve_length + jack_sleeve_overhang + thickness), 0, 0]) {
		translate([25, 0, -buttons_depth]) {
			cube([15, 12, buttons_depth + buttons_prominence]);
		}
		translate([43, 0, -buttons_depth]) {
			cube([15, 12, buttons_depth + buttons_prominence]);
		}
	}
}

//Side panel.
side_panel_thickness = 2;
side_panel_height = 20;
side_panel_length = 90;
side_panel_angle = 45;
translate([-thickness, 0, phone_depth / 2]) {
	translate([-side_panel_thickness, 0, side_panel_thickness]) {
		//An attempt to sorta close the gap between the round shell and the panel.
		cube([side_panel_thickness * 2, side_panel_length, side_panel_thickness]);
	}

	rotate([0, -side_panel_angle, 0]) {
		//Actual panel.
		cube([side_panel_thickness, side_panel_length, side_panel_height]);

		rotate([90, 0, 90]) {
			//Date display.
			translate([4, 7, side_panel_thickness]) {
				linear_extrude(1) {
					//Font download: https://www.dafont.com/led-dot-matrix.font
					text("2020.1.1", font="LED Dot\\-Matrix");
				}
			}

			//Dial.
			translate([side_panel_length - 10, 12, side_panel_thickness]) {
				cylinder(r1=5, r2=3, h=5);
				translate([-0.2, 0, 0]) {
					cube([0.4, 6, 2]);
				}
			}
		}
	}
}