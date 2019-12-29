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

//Settings
thickness = 1.05; //Align to line width for best print results.
undercut = 0.2; //How far below the phone's surface the mesh will stay.
max_overhang = 1.5; //How much the lip of the cover is allowed to overhang (barring undercut).
jack_sleeve_overhang = 3; //How far the sleeve covers the phone. Needs to be at least so that it covers the v_radius component!
jack_sleeve_diameter2 = 15; //Make it thicker at the base for strength.
jack_sleeve_endstop_length = 3; //Make the sleeve slope back down to disappear in the object.

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

//Render the main shell.
difference() {
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
		}
		translate([jack_x, -thickness - jack_sleeve_length, phone_depth / 2]) {
			rotate([-90, 0, 0]) {
				cylinder(r=jack_sleeve_diameter / 2, h=jack_sleeve_length + jack_sleeve_overhang + thickness);
				translate([-jack_sleeve_diameter2 / 2 - thickness, phone_depth / 2 + thickness, 0]) {
					cube([jack_sleeve_diameter2, jack_sleeve_diameter2, jack_sleeve_length + jack_sleeve_endstop_length * 2 + thickness]);
				}
			}
		}
	}
	body(); //Hollow out!

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
	//Audio jack.
	translate([jack_x, -thickness, phone_depth / 2]) {
		rotate([-90, 0, 0]) {
			cylinder(r=jack_width / 2, h=inset + 0.4);
		}
	}

	//Due to rounding errors in sqrt() and pow() calls, we need to flatten the bottom again properly.
	translate([-phone_width, -phone_height, -phone_depth - thickness]) {
		cube([phone_width * 3, phone_height * 3, phone_depth]);
	}
}