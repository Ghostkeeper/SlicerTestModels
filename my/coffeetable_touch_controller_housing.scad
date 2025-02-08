width = 30;
length = 95;
height = 8;
screw_offset = 3.6;
band_width = 67;
band_offset = 20;
serial_width = 7.5;

thickness = 1;
spacing_below = 5;
component_below = 2;
mount_radius = 4.5 / 2;
screw_radius = 2 / 2;
$fs = 0.2;
$fa = 2;

module mount_point() {
	translate([screw_offset, screw_offset, -1]) {
		cylinder(h=spacing_below, r=mount_radius);
	}
	cube([screw_offset, screw_offset + mount_radius, spacing_below - component_below]);
	cube([screw_offset + mount_radius, screw_offset, spacing_below - component_below]);
}

difference() {
	cube([length + thickness * 2, width + thickness * 2, height + spacing_below + thickness]);
	translate([thickness, thickness, thickness]) {
		difference() {
			cube([length, width, height + spacing_below + 1]);

			mount_point();
			translate([length, 0, 0]) {
				mirror([1, 0, 0]) {
					mount_point();
				}
			}
			translate([length, width, 0]) {
				mirror([1, 1, 0]) {
					mount_point();
				}
			}
			translate([0, width, 0]) {
				mirror([0, 1, 0]) {
					mount_point();
				}
			}
		}
	}
	translate([thickness + band_offset, thickness + width - 1, thickness + spacing_below]) {
		cube([band_width, thickness + 2, height + 1]);
	}
	translate([-1, thickness + width / 2 - serial_width / 2, thickness + spacing_below]) {
		cube([thickness + 2, serial_width, height + 1]);
	}

	translate([thickness + screw_offset, thickness + screw_offset, -1]) {
		cylinder(h=thickness + spacing_below + 2, r=screw_radius);
	}
	translate([thickness + length - screw_offset, thickness + screw_offset, -1]) {
		cylinder(h=thickness + spacing_below + 2, r=screw_radius);
	}
	translate([thickness + screw_offset, thickness + width - screw_offset, -1]) {
		cylinder(h=thickness + spacing_below + 2, r=screw_radius);
	}
	translate([thickness + length - screw_offset, thickness + width - screw_offset, -1]) {
		cylinder(h=thickness + spacing_below + 2, r=screw_radius);
	}
}