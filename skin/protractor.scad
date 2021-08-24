//Settings.
radius = 100; //Radius of the semicircle of the protractor.
width = 20; //Width of the bar and semicircle.
thickness = 1; //Total thickness of the plate.

tick_depth = 0.2; //How deep the tick marks are inset into the surface.
tick_width = 0.1; //Width of each tick.
major_tick = 10; //Distance between major tick marks, in length and degrees.
major_tick_length = 5; //Length of a major tick mark.
minor_tick = 1; //Distance between minor tick marks, in length and degrees.
minor_tick_length = 2; //Length of a minor tick mark.
$fs = 0.4; //Length resolution of the curve.
$fa = 1; //Angle resolution of the curve.

difference() {
	//Main shape.
	cylinder(r=radius, h=thickness);
	translate([-radius - 1, -radius - 1, -1]) {
		cube([2 * radius + 2, radius + 1, thickness + 2]);
	}

	//Hollow inside.
	difference() {
		translate([0, 0, -1]) {
			cylinder(r=radius - width, h=thickness + 2);
		}
		translate([-radius + width - 1, 0, -2]) {
			cube([(radius - width + 1) * 2, width, thickness + 4]);
		}
	}

	//Length ticks.
	for(x = [-radius : major_tick : radius]) {
		translate([x - tick_width / 2, -1, thickness - tick_depth]) {
			cube([tick_width, major_tick_length + 1, tick_depth + 1]);
		}
	}
	for(x = [-radius : minor_tick : radius]) {
		translate([x - tick_width / 2, -1, thickness - tick_depth]) {
			cube([tick_width, minor_tick_length + 1, tick_depth + 1]);
		}
	}

	//Angle ticks.
	for(a = [0 : major_tick : 180]) {
		rotate([0, 0, a]) {
			translate([radius - major_tick_length, -tick_width / 2, thickness - tick_depth]) {
				cube([major_tick_length + 1, tick_width, tick_depth + 1]);
			}
		}
	}
	for(a = [0 : minor_tick : 180]) {
		rotate([0, 0, a]) {
			translate([radius - minor_tick_length, -tick_width / 2, thickness - tick_depth]) {
				cube([minor_tick_length + 1, tick_width, tick_depth + 1]);
			}
		}
	}
}