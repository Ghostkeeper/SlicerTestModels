$fs = 0.3;
$fa = 1;
tolerance = 0.2;

length = 165;

base_chamfer = 2.6;
base_thickness = 5;
base_width = 31.3;
screw_radius = 3.9 / 2 + tolerance;
screw_x = 13.8 + screw_radius;
screw_y = 6.3 + screw_radius;

grab_thickness = 15.1;
grab_inner_thickness = 7.4;
grab_radius = 2.3 + tolerance;
grab_width = 24.7 + grab_radius;

handle_angle = 20; //Degrees.
handle_length = 40;
handle_radius = 20 / 2; //Also thickness, as the handle bars are exactly half the width of the handle.
handle_width = 25;

module screw_hole() {
	screw_hole_length = 10.4 - screw_radius * 2;
	screw_shallow_radius = 10.6 / 2;
	screw_shallow_depth = 1.1;

	hull() {
		cylinder(r=screw_radius, h=base_thickness + 1);
		translate([0, screw_hole_length, 0]) {
			cylinder(r=screw_radius, h=base_thickness + 1);
		}
	}
	hull() {
		cylinder(r=screw_shallow_radius, h=screw_shallow_depth);
		translate([0, screw_hole_length, 0]) {
			cylinder(r=screw_shallow_radius, h=screw_shallow_depth);
		}
	}
}

module base_plate() {
	difference() {
		translate([base_chamfer, base_chamfer, base_chamfer]) {
			minkowski() {
				cube([length - base_chamfer * 2, base_width - base_chamfer * 2, grab_thickness - base_chamfer * 2]);
				sphere(r=base_chamfer);
			}
		}
		translate([screw_x, screw_y, 0]) {
			screw_hole();
		}
		translate([length - screw_x, screw_y, 0]) {
			screw_hole();
		}

		translate([0, 0, base_thickness + grab_radius]) {
			minkowski() {
				cube([length, grab_width - grab_radius, grab_inner_thickness - grab_radius * 2]);
				sphere(r=grab_radius);
			}
		}
		translate([0, 0, base_thickness + grab_inner_thickness / 2]) {
			cube([length, grab_width - grab_radius, grab_thickness]);
		}
	}
}

module handle() {
	difference() {
		hull() {
			translate([base_chamfer, 0, 0]) {
				sphere(r=base_chamfer);
			}
			translate([base_chamfer, 0, handle_radius * 2 - base_chamfer * 2]) {
				sphere(r=base_chamfer);
			}
			translate([length - base_chamfer, 0, 0]) {
				sphere(r=base_chamfer);
			}
			translate([length - base_chamfer, 0, handle_radius * 2 - base_chamfer * 2]) {
				sphere(r=base_chamfer);
			}
			translate([handle_radius, handle_length, handle_radius - base_chamfer]) {
				sphere(r=handle_radius);
			}
			translate([length - handle_radius, handle_length, handle_radius - base_chamfer]) {
				sphere(r=handle_radius);
			}
		}
		translate([-1, -base_chamfer, handle_radius - base_chamfer]) {
			cube([length + 2, handle_length + base_chamfer, handle_radius + 1]);
		}
		translate([handle_width, -base_chamfer - 1, -base_chamfer - 1]) {
			cube([length - handle_width * 2, handle_length + base_chamfer + 1, handle_radius + 2]);
		}
		rotate([-handle_angle, 0, 0]) {
			translate([0, -10, 0]) {
				cube([length, 10, handle_radius * 2]);
			}
		}
	}
	//The actual handle.
	hull() {
		translate([handle_radius, handle_length, handle_radius - base_chamfer]) {
			sphere(r=handle_radius);
		}
		translate([length - handle_radius, handle_length, handle_radius - base_chamfer]) {
			sphere(r=handle_radius);
		}
	}
}

base_plate();
translate([0, base_width - base_chamfer, base_chamfer]) {
	rotate([handle_angle, 0, 0]) {
		handle();
	}
}