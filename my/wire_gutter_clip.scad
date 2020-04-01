//Measurements.
wire_radius = 4.2 / 2;
screw_radius = 3 / 2; //M3 screw.
screw_head_radius = 5 / 2;

//Settings.
play = 0.2;
thickness = 1.5;
leverage = 5; //Some leverage at the other end to push against.
              //This allows carrying more weight without bending the clip.
extra_wire_height = 2; //Allow the wire to be not entirely squished against the desk.
screw_hole_thickness = 4.15; //Tune manually to make screw head sit flush.
$fs = 0.5;
$fa = 1;

//Calculations.
width = (screw_radius + thickness + play) * 2;
height = wire_radius * 2 + extra_wire_height + play + thickness;
wire_x = leverage + screw_head_radius + thickness + wire_radius + play;

//Design.
difference() {
	//Main body.
	hull() {
		translate([-width / 2, -width / 2, 0]) {
			cube([width + wire_x + wire_radius + play + thickness, width, thickness]);
		}
		translate([wire_x, -width / 2, wire_radius + play + extra_wire_height]) {
			rotate([-90, 0, 0]) {
				cylinder(r=wire_radius + play + thickness, h=width);
			}
		}
	}

	//Hole for wire.
	translate([wire_x, -width / 2 - 1, wire_radius + play + extra_wire_height]) {
		rotate([-90, 0, 0]) {
			cylinder(r=wire_radius + play, h=width + 2);
		}
	}
	translate([wire_x - wire_radius - play, -width / 2 - 1, -1]) {
		cube([wire_radius * 2 + play * 2, width + 2, extra_wire_height + wire_radius + 1]);
	}

	//Hole for screw.
	translate([leverage, 0, -1]) {
		cylinder(r=screw_radius, h=height + 2);
	}
	translate([leverage, 0, screw_hole_thickness]) {
		cylinder(r=screw_head_radius + play, h=height + 2);
	}
}