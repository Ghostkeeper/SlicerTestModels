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

$fs = 0.5;
$fa = 1;

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

		//Time travel logo.
		linear_extrude(1) {
			translate([30, -15, 0]) {
				scale([0.2, 0.2]) {
					polygon(points=[[-77.124, 120.486], [-77.124, 102.419], [-62.817, 94.243], [-61.135, 97.186], [-73.735, 104.386], [-73.735, 120.486]], paths=[[0, 1, 2, 3, 4, 5, 0]]);
					polygon(points=[[-73.27, 136.04], [-77.806, 135.864], [-82.251, 135.056], [-86.527, 133.638], [-90.559, 131.632], [-94.268, 129.058], [-97.578, 125.94], [-100.413, 122.299], [-102.694, 118.156], [-104.532, 112.673], [-105.246, 107.046], [-104.881, 101.446], [-103.486, 96.042], [-101.108, 91.003], [-97.796, 86.5], [-93.595, 82.701], [-91.177, 81.12], [-88.555, 79.778], [-83.488, 78.103], [-78.292, 77.463], [-73.122, 77.817], [-68.137, 79.121], [-63.494, 81.33], [-59.348, 84.403], [-55.858, 88.295], [-53.181, 92.963], [-51.668, 97.613], [-51.103, 102.38], [-51.446, 107.118], [-52.658, 111.683], [-54.7, 115.932], [-57.532, 119.719], [-61.116, 122.901], [-65.413, 125.332], [-69.646, 126.682], [-73.982, 127.174], [-78.29, 126.841], [-82.436, 125.72], [-86.29, 123.846], [-89.719, 121.252], [-92.592, 117.976], [-94.777, 114.051], [-95.964, 110.234], [-96.381, 106.328], [-96.059, 102.451], [-95.028, 98.723], [-93.32, 95.264], [-90.966, 92.193], [-87.996, 89.629], [-84.441, 87.692], [-81.041, 86.669], [-77.565, 86.327], [-74.119, 86.639], [-70.81, 87.58], [-67.746, 89.122], [-65.034, 91.238], [-62.78, 93.903], [-61.091, 97.088], [-64.24, 98.343], [-65.595, 95.798], [-67.414, 93.665], [-69.61, 91.967], [-72.094, 90.728], [-74.777, 89.972], [-77.573, 89.72], [-80.392, 89.997], [-83.148, 90.825], [-86.07, 92.424], [-88.516, 94.549], [-90.458, 97.1], [-91.868, 99.978], [-92.721, 103.079], [-92.987, 106.306], [-92.642, 109.555], [-91.656, 112.727], [-89.815, 116.027], [-87.384, 118.784], [-84.476, 120.97], [-81.205, 122.552], [-77.685, 123.499], [-74.028, 123.78], [-70.349, 123.365], [-66.76, 122.222], [-63.084, 120.137], [-60.015, 117.399], [-57.586, 114.135], [-55.834, 110.471], [-54.792, 106.532], [-54.496, 102.445], [-54.982, 98.335], [-56.284, 94.329], [-58.612, 90.278], [-61.656, 86.897], [-65.277, 84.225], [-69.335, 82.302], [-73.693, 81.166], [-78.211, 80.857], [-82.751, 81.413], [-87.174, 82.874], [-91.6, 85.446], [-95.292, 88.796], [-98.206, 92.773], [-100.3, 97.226], [-101.53, 102.003], [-101.853, 106.952], [-101.225, 111.922], [-99.605, 116.761], [-98.312, 119.259], [-96.789, 121.563], [-93.132, 125.566], [-88.798, 128.723], [-83.951, 130.987], [-78.756, 132.311], [-73.376, 132.647], [-67.975, 131.948], [-62.719, 130.168], [-57.759, 127.269], [-53.476, 123.465], [-49.996, 118.907], [-47.451, 113.749], [-44.279, 114.943], [-45.559, 117.895], [-47.115, 120.698], [-48.931, 123.331], [-50.989, 125.776], [-53.273, 128.01], [-55.766, 130.015], [-58.452, 131.769], [-61.314, 133.252], [-64.233, 134.408], [-67.213, 135.253]], paths=[[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99, 100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115, 116, 117, 118, 119, 120, 121, 122, 123, 124, 125, 126, 127, 128, 129, 130, 0, 0]]);
					polygon(points=[[-44.325, 121.9], [-44.235, 110.062], [-51.973, 119.022], [-49.798, 118.775], [-47.698, 119.212], [-45.823, 120.274], [-44.325, 121.9]], paths=[[0, 1, 2, 3, 4, 5, 6, 0]]);
				}
			}
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
		hull() {
			cube([side_panel_thickness, 0.1, side_panel_height]);
			translate([0, -jack_sleeve_length - thickness, -4]) {
				cube([side_panel_thickness, 0.1, 1]);
			}
		}

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
				dial_angle = -60;
				rotate([0, 0, -dial_angle]) {
					translate([-0.2, 0, 0]) {
						cube([0.4, 6, 2]);
					}
				}
			}
		}
	}
}