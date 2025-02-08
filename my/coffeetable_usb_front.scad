thickness = 1.2000000000;
depth = 40;
length1 = 200;
length2 = 234.8;
cable_sleeve_depth = 10;
$fn = 180;
render1 = false;
render2 = true;

height = 18; //USB hub measures 18mm.
usb_z = 5.7;
usb_height = 5.7;
usb1_x = 16;
usb2_x = 37;
usb_width = 13;
usb_hub_width = 66;
hdmi_x = 140;
hdmi_width = 20.9;
hdmi_height = 11.3 + 0.3;
hdmi_depth = 29.4;
hdmi_inner_width = 12;
switch_x = 170;
switch_width = 26.7;
switch_height = 16.5 + 0.1;
switch_depth = 3.5;
switch_inner_width = 20;
cable_x = 215;
cable_diameter = 9;

if(render1) {
	difference() {
		union() {
			cube([length1, thickness, height]);
			translate([0, 0, height]) {
				cube([length1, thickness + depth, thickness]);
			}
			translate([usb_hub_width, thickness, 0]) { //Rib for strength.
				intersection() {
					rotate([45, 0, 0]) {
						cube([thickness, height * 1.5, height * 1.5]);
					}
					cube([thickness, height, height]);
				}
			}
			translate([hdmi_x - thickness, thickness, 0]) { //Chamber for HDMI adapter.
				cube([hdmi_width + thickness * 2, hdmi_depth, height]);
			}
		}

		//The ports.
		translate([usb1_x, -1, height - usb_height - usb_z]) {
			cube([usb_width, thickness + 2, usb_height]);
		}
		translate([usb2_x, -1, height - usb_height - usb_z]) {
			cube([usb_width, thickness + 2, usb_height]);
		}
		translate([hdmi_x, -1, height / 2 - hdmi_height / 2]) {
			cube([hdmi_width, 1 + hdmi_depth, hdmi_height]);
			translate([(hdmi_width - hdmi_inner_width) / 2, hdmi_depth + thickness - 1, 0]) {
				cube([hdmi_inner_width, thickness + 2, hdmi_height]);
			}
		}
	}
}

if(render2) {
	translate([length1 + 10, 0, 0]) {
		difference() {
			union() {
				cube([length2, thickness, height]);
				translate([0, 0, height]) {
					cube([length2, thickness + depth, thickness]);
				}
				translate([length2 / 2, thickness, 0]) { //Rib for strength.
					intersection() {
						rotate([45, 0, 0]) {
							cube([thickness, height * 1.5, height * 1.5]);
						}
						cube([thickness, height, height]);
					}
				}
				//Chamber for switch.
				translate([switch_x - thickness, thickness, height / 2 - switch_height / 2 - thickness]) {
					cube([switch_width + thickness * 2, switch_depth, switch_height + thickness * 2]);
				}
				//Cable sleeve.
				translate([cable_x, 0, height / 2]) {
					rotate([-90, 0, 0]) {
						cylinder(h=cable_sleeve_depth, r=cable_diameter / 2 + thickness);
					}
				}
				translate([cable_x - cable_diameter / 2 - thickness, 0, height / 2]) {
					cube([cable_diameter + thickness * 2, cable_sleeve_depth, height / 2]);
				}
			}

			//Switch.
			translate([switch_x, -1, height / 2 - switch_height / 2]) {
				cube([switch_width, 1 + switch_depth, switch_height]);
				translate([(switch_width - switch_inner_width) / 2, switch_depth + thickness - 1, 0]) {
					cube([switch_inner_width, thickness + 2, switch_height]);
				}
			}

			//Cable hole.
			translate([cable_x, -1, height / 2]) {
				rotate([-90, 0, 0]) {
					cylinder(h=cable_sleeve_depth + 2, r=cable_diameter / 2);
				}
			}

			//Switch is a bit too low with thickness, so cut off from the bottom if needed.
			translate([0, 0, -10]) {
				cube([length1, 10, 10]);
			}
		}
	}
}