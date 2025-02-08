height = 17;
width = 160;
handle_corner_lift = 3;

depth = 190;
thickness = 1;
handle_width = 50;
handle_depth = 20;
handle_height = 10;
handle_rounding = 2;
first_box_width = 30;
second_box_width = 30;
second_box_separator = 60;
$fs = 0.2;
$fa = 1;


module tray() {
	//Body.
	difference() {
		cube([width, depth, height]);
		translate([thickness, thickness, thickness]) {
			cube([width - thickness * 2, depth - thickness * 2, height - thickness + 1]);
		}
	}

	//Handle.
	translate([width / 2 - handle_width / 2 + handle_rounding, -handle_depth + handle_rounding, 0]) {
		difference() {
			minkowski() {
				difference() {
					cube([handle_width - handle_rounding * 2, handle_depth - handle_rounding, handle_height - 1]);
					translate([0, handle_depth / 2 - handle_rounding, -1]) {
						cylinder(h=handle_height + 2, r=handle_depth / 2 - handle_rounding);
					}
					translate([handle_width - handle_rounding * 2, handle_depth / 2 - handle_rounding, -1]) {
						cylinder(h=handle_height + 2, r=handle_depth / 2 - handle_rounding);
					}
				}
				cylinder(h=1, r=handle_rounding);
			}
			translate([-handle_rounding, handle_depth - handle_rounding, -1]) {
				cube([handle_width, handle_rounding, handle_height + 2]);
			}
			translate([-handle_rounding, -handle_rounding, handle_corner_lift]) {
				rotate([-asin(handle_corner_lift / handle_depth), 0, 0]) {
					translate([0, 0, -100]) {
						#cube(100);
					}
				}
			}
		}
	}

	//Inner walls.
	translate([thickness + first_box_width, 0, thickness]) {
		cube([thickness, depth, height - thickness]);
	}
	translate([thickness * 2 + first_box_width + second_box_width, 0, thickness]) {
		cube([thickness, depth, height - thickness]);
	}
	translate([thickness * 2 + first_box_width, thickness + second_box_separator, thickness]) {
		cube([second_box_width, thickness, height - thickness]);
	}
}

module modifier_mesh() {
	translate([thickness, thickness, 0]) {
		cube([width - thickness * 2, depth - thickness * 2, thickness]);
	}
}

tray();
//modifier_mesh();