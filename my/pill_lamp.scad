outer_radius = 7.5 / 2;
thickness = 0.4;
straight_length = 12.5 - outer_radius * 2;
rim = 5.5 - outer_radius;
spacing = 0.1;
$fs = 0.3;
$fa = 1;

inner_radius = outer_radius - thickness;

module pill(radius) {
	sphere(r = radius);
	rotate([0, 90, 0]) {
		cylinder(h=straight_length, r=radius);
	}
	translate([straight_length, 0, 0]) {
		sphere(r = radius);
	}
}
module cylinder_pill(radius) {
	rotate([-90, 0, 0]) {
		cylinder(h=rim, r=radius);
		translate([straight_length, 0, 0]) {
			cylinder(h=rim, r=radius);
		}
	}
	translate([0, 0, -radius]) {
		cube([straight_length, rim, radius * 2]);
	}
}

color("#404040") {
	difference() {
		pill(outer_radius);
		pill(inner_radius);
		translate([-outer_radius, -outer_radius, -outer_radius]) {
			cube([outer_radius * 2 + straight_length, outer_radius, outer_radius]);
		}
		translate([-outer_radius, 0, -outer_radius]) {
			cube([outer_radius * 2 + straight_length, outer_radius, outer_radius * 2]);
		}
	}
	difference() {
		cylinder_pill(outer_radius);
		cylinder_pill(inner_radius);
	}
}
color("white") {
	difference() {
		pill(inner_radius - spacing);
		translate([-outer_radius, 0, -outer_radius]) {
			cube([outer_radius * 2 + straight_length, outer_radius, outer_radius * 2]);
		}
	}
	cylinder_pill(inner_radius - spacing);
}