width = 74;
height = 6.6 + 30 + 125.6;
thickness = 8.8;
jack_x = 14.4 + 0.3;
jack_z_offset = -0.5;
jack_width = 10.5;
usb_x = width / 2;
usb_width = 14;
usb_thickness = 8;
mic_x = 57;
mic_width = 14.5;
mic_thickness = 5;
speaker_x = 21.8;
speaker_width = 2;
cam_x = 43.5;
cam_width = 24.9;
cam_y = 125.1;
cam_height = 30;
speaker_top_x = cam_x + 3.5;
speaker_top_z = 0.7;
volume_y = 90.6;
volume_height = 45;
volume_indent = 2;
radius = 8;
bottom_curve_radius = 5;
bottom_curve_indent = 2;

strength = 1;
jack_strength = 2;
jack_sleeve_length = 22;
bottom_shelf_width = 3.8;
$fn = 181;

bottom_curve_center = sin(acos(1 - bottom_curve_indent / bottom_curve_radius)) * bottom_curve_radius;

module phone() {
	translate([radius, radius, 0]) {
		intersection() {
			minkowski() {
				cube([width - radius * 2, height - radius * 2, thickness - 1]);
				cylinder(h=1, r=radius);
			}
			hull() {
				translate([-radius + bottom_curve_center, -radius, bottom_curve_radius]) {
					rotate([-90, 0, 0]) {
						cylinder(h=height, r=bottom_curve_radius);
					}
				}
				translate([width - radius - bottom_curve_center, -radius, bottom_curve_radius]) {
					rotate([-90, 0, 0]) {
						cylinder(h=height, r=bottom_curve_radius);
					}
				}
			}
		}
	}
}

difference() {
	union() {
		minkowski() {
			phone();
			sphere(strength);
		}
		translate([jack_x, -strength - jack_sleeve_length, thickness / 2 + jack_z_offset]) {
			rotate([-90, 0, 0]) {
				cylinder(h=jack_sleeve_length + 0.001, r1=jack_width / 2 + strength, r2=jack_width / 2 + jack_strength);
				translate([0, 0, jack_sleeve_length]) {
					difference() {
						cylinder(h=strength, r=jack_width / 2 + jack_strength);
						translate([-jack_width / 2 - jack_strength, -jack_width / 2 - jack_strength, 0]) {
							cube([jack_width + jack_strength * 2, jack_width / 2 + jack_strength, 3]);
						}
					}
				}
			}
		}
	}
	translate([-strength, bottom_shelf_width, thickness]) {
		multmatrix([[1, 0, 0, 0], [0, 1, -1, 0], [0, 0, 1, 0], [0, 0, 0, 1]]) {
			translate([bottom_curve_radius + strength, bottom_curve_radius + strength, 0]) {
				minkowski() {
					cube([width - bottom_curve_radius * 2, height + 1, strength]);
					scale([1, 1, 0]) {
						cylinder(h=1, r=bottom_curve_radius + strength);
					}
				}
			}
		}
	}
	phone();
	translate([jack_x, -strength - jack_sleeve_length - 1, thickness / 2 + jack_z_offset]) {
		rotate([-90, 0, 0]) {
			cylinder(h=strength + jack_sleeve_length + 2, r=jack_width / 2);
		}
	}
	translate([0, -jack_sleeve_length - strength - 1, -strength - jack_strength + jack_z_offset]) {
		#cube([width, jack_sleeve_length + strength + height + 1, jack_strength - jack_z_offset]);
	}
	translate([speaker_x, 1, thickness / 2]) {
		rotate([90, 0, 10]) {
			cylinder(h=strength + 100, r=speaker_width / 2);
		}
	}
	translate([speaker_top_x, height - 1, thickness / 2 + speaker_top_z]) {
		rotate([-90, 0, 10]) {
			cylinder(h=strength + 100, r=speaker_width / 2);
		}
	}
	translate([usb_x - usb_width / 2, -strength - 1, thickness / 2 - usb_thickness / 2]) {
		cube([usb_width, strength + 2, usb_thickness]);
	}
	translate([mic_x - mic_width / 2, -strength - 1, thickness / 2 - mic_thickness / 2]) {
		cube([mic_width, strength + 2, mic_thickness]);
	}
	translate([width - 1, volume_y, thickness / 2 - volume_indent]) {
		multmatrix([[1, 0, 0, 0], [0, 1, 1, 0], [0, 0, 1, 0], [0, 0, 0, 1]]) {
			cube([strength + 2, volume_height, thickness]);
		}
		multmatrix([[1, 0, 0, 0], [0, 1, -1, 0], [0, 0, 1, 0], [0, 0, 0, 1]]) {
			cube([strength + 2, volume_height, thickness]);
		}
	}
	translate([cam_x, cam_y, -strength - 1]) {
		cube([cam_width, cam_height, strength + 2]);
	}
}
//Jack sleeve to join up exactly to the phone.
translate([jack_x, -strength, thickness / 2 + jack_z_offset]) {
	difference() {
		rotate([-90, 0, 0]) {
			cylinder(h=3, r1=jack_width / 2 + jack_strength, r2=jack_width / 2);
		}
		translate([-jack_width / 2 - jack_strength, 0, -jack_width / 2 - jack_strength]) {
			cube([jack_width + jack_strength * 2, 3, jack_width / 2 + jack_strength + thickness / 2]);
		}
	}
}