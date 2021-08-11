use <text_on.scad>

//Measurements.
height = 90;
diameter = 37.6;
bottom_height = height - 42;
cable_height = 5.5;
cable_width = 3.5;

//Settings.
thickness = 0.7;
bottom_diameter = 80;
memoir = "Y+C 2021-8-14";
spoke_radius = 120 / 2; //Should be the same as the bottom diameter of the lithophane.
spoke_thickness = 1;
spoke_width = 5;
spoke_lip = 3;
play = 0.2;
$fn = 180;

//Calculations.
radius = diameter / 2;
bottom_radius = bottom_diameter / 2;

//Design.

//Base.
rotate([0, 0, -5]) {
	text_on_cylinder(memoir, [0, 0, 0], r1=bottom_radius + thickness, r2=radius + thickness + play, h=bottom_height, size=10);
}
difference() {
	cylinder(h=bottom_height, r1=bottom_radius + thickness, r2=radius + thickness + play);
	cylinder(h=bottom_height, r1=bottom_radius, r2=radius + play);
	hull() {
		translate([-bottom_radius - thickness - 1, -cable_width / 2, 0]) {
			cube([thickness + 5, cable_width, cable_height - cable_width / 2]);
		}
		translate([-bottom_radius - thickness - 1, 0, cable_height - cable_width / 2]) {
			rotate([0, 90, 0]) {
				cylinder(r=cable_width / 2, h=thickness + 5);
			}
		}
	}
}
//Neck.
translate([0, 0, bottom_height]) {
	difference() {
		cylinder(h=height - bottom_height, r=radius + thickness + play);
		cylinder(h=height - bottom_height + 1, r=radius + play);
	}
}
//Spokes.
difference() {
	translate([0, 0, height - spoke_thickness / 2]) {
		cube([(spoke_radius + play) * 2, spoke_width, spoke_thickness], center=true);
		cube([spoke_width, (spoke_radius + play) * 2, spoke_thickness], center=true);
	}
	translate([0, 0, height - spoke_thickness - 1]) {
		cylinder(h = spoke_thickness + 2, r=radius + play);
	}
}
for(a = [0:90:270]) {
	rotate([0, 0, a]) {
		translate([spoke_radius + play, -spoke_width / 2, height - spoke_thickness]) {
			cube([spoke_thickness, spoke_width, spoke_thickness + spoke_lip]);
		}
	}
}