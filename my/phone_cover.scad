//My phone cover and reinforcement for the headphone jack.

//Measurements of Samsung Galaxy 7 Edge
phone_width = 72.6;
phone_height = 150.9;
phone_depth = 8.0;

phone_roundness_h = 6.6; //How far in the X direction the roundness extends over the screen.
phone_roundness_v_radius = 7.0; //The vertical roundness is not exactly round. Eccentricity!
phone_roundness_corner = 10.5; //Radius of the four rounded corners.

button_volumes_y = 97.0;
button_volumes_height = 30.0;
button_power_y = 88.0;
button_power_height = 17.5;

camera_x = 18.5;
camera_y = 117.0;
camera_width = 25.1;
camera_height = 15.2;

jack_x = 19.2; //Position of centre!
jack_width = 5.0;
charger_x = phone_width / 2; //Position of centre!
charger_width = 12.0; //A bit more than necessary for large chargers.
microphone_x = 45.0;
microphone_width = 12.5;

//Settings
thickness = 0.7; //Align to line width for best print results.
undercut = 0.2; //How far below the phone's surface the mesh will stay.
$fs = 2; //Low-res to debug with.
$fa = 4;

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
	minkowski() {
		body();
		sphere(r=thickness);
	}
	body();
	translate([-thickness, -thickness, phone_depth - undercut]) {
		cube([phone_width + thickness * 2, phone_height + thickness * 2, thickness + undercut]);
	}
}