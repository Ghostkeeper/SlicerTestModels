//Measurements.
radius = 15.7 / 2; //Inner radius.
height = 6;
bolt_radius = 4 / 2; //M4.

//Settings.
thickness = 3;
opening_width = 3;
$fs = 0.4;
$fa = 1;

//Implementation.
difference() {
	cylinder(r=radius + thickness, h=height); //Body of the ring.
	translate([0, 0, -1]) {
		cylinder(r=radius, h=height + 2); //Hole in the ring.
	}
	translate([-opening_width / 2, 0, -1]) {
		cube([opening_width, radius + thickness + 1, height + 2]); //Opening in the ring.
	}
}
difference() {
	union() {
		translate([-opening_width / 2 - thickness, radius, 0]) {
			cube([thickness, thickness * 2 + bolt_radius * 2, height]);
		}
		translate([opening_width / 2, radius, 0]) {
			cube([thickness, thickness * 2 + bolt_radius * 2, height]);
		}
	}
	translate([-opening_width / 2 - thickness - 1, radius + thickness * 1.5 + bolt_radius, height / 2]) {
		rotate([0, 90, 0]) {
			cylinder(r=bolt_radius, h=thickness * 2 + opening_width + 2);
		}
	}
}