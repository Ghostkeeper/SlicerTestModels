ribs_total_width = 42.2;
rib_width = 1.9;
rib_depth = 2.8;
rib_spacing = 4.0;
rpi_height = 27; //Excluding the ribs.
nvme_width = 56.5;
nvme_length = 88.1;
nvme_pin_x = 3.2;
nvme_close_pin_y = 4.2;
nvme_far_pin_y = 62.5;
nvme_height = 30;
ribbon_offset_x = 2.5;
ribbon_width = 10;



t = 1; //Thickness.
p = 0.2; //Play.
space = 1;
rib_connector_length = 20;
screw_radius = 1.5;
$fa = 1;
$fs = 0.1;

difference() {
	cube([nvme_width + t * 2, nvme_length + t * 2, nvme_height + t]);
	translate([t, t, t]) {
		cube([nvme_width, nvme_length, nvme_height + t + 1]);
	}
	translate([t + nvme_width / 2 - ribbon_width / 2 - ribbon_offset_x, -1, t]) {
		cube([ribbon_width, t + 2, nvme_height + 1]);
	}
	translate([t + nvme_pin_x, t + nvme_close_pin_y, -1]) {
		cylinder(h=t + 2, r=screw_radius);
	}
	translate([t + nvme_width - nvme_pin_x, t + nvme_close_pin_y, -1]) {
		cylinder(h=t + 2, r=screw_radius);
	}
	translate([t + nvme_pin_x, t + nvme_far_pin_y, -1]) {
		cylinder(h=t + 2, r=screw_radius);
	}
	translate([t + nvme_width - nvme_pin_x, t + nvme_far_pin_y, -1]) {
		cylinder(h=t + 2, r=screw_radius);
	}
}

translate([t + nvme_width / 2 - ribs_total_width / 2 - rib_width, -space - rib_connector_length, 0]) {
	cube([rib_width, rib_connector_length + space + t, rib_depth]);
}
translate([t + nvme_width / 2 + ribs_total_width / 2, -space - rib_connector_length, 0]) {
	cube([rib_width, rib_connector_length + space + t, rib_depth]);
}
translate([t + nvme_width / 2 - ribs_total_width / 2 - rib_width + rib_spacing, -space - rib_connector_length, 0]) {
	cube([rib_width, rib_connector_length + space + t, rib_depth]);
}
translate([t + nvme_width / 2 + ribs_total_width / 2 - rib_spacing, -space - rib_connector_length, 0]) {
	cube([rib_width, rib_connector_length + space + t, rib_depth]);
}
translate([t + nvme_width / 2 - ribs_total_width / 2 - rib_width + rib_spacing * 2, -space - rib_connector_length, 0]) {
	cube([rib_width, rib_connector_length + space + t, rib_depth]);
}
translate([t + nvme_width / 2 + ribs_total_width / 2 - rib_spacing * 2, -space - rib_connector_length, 0]) {
	cube([rib_width, rib_connector_length + space + t, rib_depth]);
}
translate([t + nvme_width / 2 - ribs_total_width / 2 - rib_width, -space, 0]) {
	cube([rib_width * 2 + ribs_total_width, space + t, t]);
}