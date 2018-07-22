//Settings.
bracket_width = 6;
thickness = 3;
hook_width = 10;
diagonal_height = 40;
rim_lip_angle = 10;
$fa = 1;
$fs = 0.1;

//Measurements.
diameter = 54;
cap_height = 15;
stick_diameter = 15;
jar_total_height = 100; //Actually 93.5 but allow some play.

//Calculations.
radius = diameter / 2;
stick_radius = stick_diameter / 2;
connector_dist = radius + bracket_width - thickness;

//Base rim.
module rim() {
	difference() {
		union() {
			translate([-radius - bracket_width, 0, 0]) {
				cube([(radius + bracket_width) * 2, radius + bracket_width, thickness]);
			}
			rotate([-rim_lip_angle, 0, 0]) {
				cylinder(h=thickness, r=radius + bracket_width);
			}
		}
		cylinder(h=thickness, r=radius);
		translate([-radius, -radius - bracket_width, 0]) {
			cube([radius * 2, radius + bracket_width, thickness + sin(rim_lip_angle) * (radius + bracket_width)]);
		}
		translate([-radius - bracket_width, 0, -sin(rim_lip_angle) * (radius + bracket_width)]) {
			cube([(radius + bracket_width) * 2, radius + bracket_width, sin(rim_lip_angle) * (radius + bracket_width)]);
		}
	}
}
rim();
translate([0, 0, -jar_total_height - thickness]) {
	rim();
}



//Connector.
translate([-radius - bracket_width, radius + bracket_width, 0]) {
	translate([0, 0, -jar_total_height - thickness]) {
		cube([(radius + bracket_width) * 2, thickness, thickness * 2 + cap_height + jar_total_height]);
	}
	translate([0, 0, thickness + cap_height]) {
		multmatrix(m = [
		[1, 0, 0, 0],
		[0, 1, -1, 0],
		[0, 0, 1, 0]
	]) {
			cube([(radius + bracket_width) * 2, thickness, diagonal_height]);
		}
	}
}

//Hooks.
module hook() {
	translate([0, 0, stick_diameter / 2 + thickness]) {
		rotate([0, 90, 0]) {
			rotate_extrude(angle = 360) {
				translate([stick_diameter / 2, 0]) {
					square([thickness, hook_width]);
				}
			}
		}
	}
	cube([hook_width, thickness, thickness]);
}
translate([-radius - bracket_width, connector_dist - diagonal_height + thickness, diagonal_height + cap_height + thickness]) {
	hook();
}
translate([radius + bracket_width - hook_width, connector_dist - diagonal_height + thickness, diagonal_height + cap_height + thickness]) {
	hook();
}