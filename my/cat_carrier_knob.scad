//Measurements.
pole_width = 5.04;
knob_width = 7.92;
knob_height = 3.00;

//Parameters.
extra_height = 2;
chamfer_height = 2;
thickness = 1;
hole_extra_play = 1;
stretch = 0.5;

$fa = 2;
$fs = 0.2;

cylinder(r=knob_width / 2, h=knob_height);
translate([0, 0, knob_height]) {
	cylinder(r=pole_width / 2, h=extra_height);
	translate([0, 0, extra_height]) {
		cylinder(r1=pole_width / 2, r2=knob_width / 2 + thickness + stretch, h=chamfer_height);
		translate([0, 0, chamfer_height]) {
			difference() {
				cylinder(r=knob_width / 2 + thickness + stretch, h=knob_height + thickness * 2);
				translate([0, 0, thickness]) {
					cylinder(r=knob_width / 2 + stretch, h=knob_height);
					cylinder(r=pole_width / 2 + hole_extra_play + stretch, h=knob_height + thickness);
				}
			}
		}
	}
}