//Measurements
width = 65.5;
length = 134;
thickness_radius = 3.8 / 2;

//Settings
thickness = 1;
clip_size = 20;
play = 0.2;
$fa = 1;
$fs = 0.2;

//Calculations
distance = width - thickness_radius * 2;

difference() {
	union() {
		translate([-thickness_radius - play - thickness, 0, -thickness_radius - play - thickness]) {
			cube([width + play * 2 + thickness * 2, length, thickness + play + thickness_radius]);
		}
		rotate([-90, 0, 0]) {
			cylinder(h=clip_size, r=thickness_radius + play + thickness);
			translate([distance, 0, 0]) {
				cylinder(h=clip_size, r=thickness_radius + play + thickness);
			}
			translate([0, 0, length - clip_size]) {
				cylinder(h=clip_size, r=thickness_radius + play + thickness);
			}
			translate([distance, 0, length - clip_size]) {
				cylinder(h=clip_size, r=thickness_radius + play + thickness);
			}
		}
	}
	hull() {
		rotate([-90, 0, 0]) {
			cylinder(h=length, r=thickness_radius + play);
			translate([distance, 0, 0]) {
				cylinder(h=length, r=thickness_radius + play);
			}
		}
	}
	cube([distance, length, 100]);
	translate([distance / 2, length / 2, -thickness_radius - play - thickness]) {
		linear_extrude(thickness / 2) {
			mirror([1, 0, 0]) {
				text("RASP", halign="center", valign="center");
			}
		}
	}
}