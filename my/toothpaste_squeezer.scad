//Settings.
hole_length = 60;
hole_width = 4.5;
thickness = 5;
fillet = 1;
grip = 10; //General "width" extending beyond the hole.
finger_radius = 8;
$fs = 0.3;
$fa = 1;

minkowski() {
	linear_extrude(height=thickness - fillet * 2) {
		difference() {
			minkowski() {
				hull() {
					square([hole_length, hole_width]);
					translate([hole_length / 2, hole_width + grip + finger_radius]) {
						circle(r=finger_radius);
					}
				}
				circle(r=grip - fillet);
			}
			translate([-fillet, -fillet]) {
				square([hole_length + fillet * 2, hole_width + fillet * 2]);
			}
			translate([hole_length / 2, hole_width + grip + finger_radius]) {
				circle(r=finger_radius + fillet);
			}
		}
	}
	sphere(r=fillet);
}