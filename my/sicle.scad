//Settings.
radius = 100;
width = 10;
height = 3;
angle_range = 240; //degrees
rounding = 2;
incline = 20; //degrees
$fn = 100;

//Implementation.
rounding_factor = rounding / width;

module slice(angle) { //Creates one "rib" of the arc. This is a 2D disc in 3D space.
	scale_factor = cos(angle / (angle_range / 2) * 90); //Make ribs towards the ends smaller.
	translate([radius, 0, 0]) {
		rotate([90, 0, 0]) { //Rib stands upright.
			scale([rounding_factor + (1 - rounding_factor) * scale_factor, rounding_factor + (1 - rounding_factor) * height / width * scale_factor, 0]) { //Rib is elliptical, and has 0 thickness.
				cylinder(r=width, h=1);
			}
		}
	}
}
module endstop(angle) {
	rotate([0, 0, angle]) {
		translate([radius, 0, 0]) {
			sphere(r=rounding);
		}
	}
}

rotate([0, -incline, 0]) {
	angle_step = angle_range / ($fn - 1);
	for(a = [-angle_range/2 : angle_step : angle_range/2 - angle_step/2]) {
		hull() {
			rotate([0, 0, a]) {
				slice(a);
			}
			rotate([0, 0, a + angle_step]) {
				slice(a + angle_step);
			}
		}
	}
	endstop(-angle_range / 2);
	endstop(angle_range / 2);
}