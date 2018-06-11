$fa = 1;
$fs = 0.1;
play = 0.2;
notch_size = 1;

/*
 * Creates a nice spiral.
 * \param spirals   How many spirals.
 * \param thickness The thickness of the line.
 * \param rmin      The inner radius of the spiral.
 * \param rmax      The outer radius of the spiral.
 */
module archimedean_spiral(spirals = 1, thickness = 1, rmin = 50, rmax = 100) {
    total_angle = spirals * 360;
    incline = sqrt(pow(rmax - rmin, 2) / (pow(total_angle, 2) * (pow(cos(total_angle), 2) + pow(sin(total_angle), 2))));
    points = [
        for(i = [0:$fa:total_angle]) [
            (i * incline + rmin) * cos(i),
            (i * incline + rmin) * sin(i)
        ]
    ];
    points_inner = [
        for(i = [total_angle:-$fa:0]) [
            (((i * incline) + thickness + rmin) * cos(i)),
            (((i * incline) + thickness + rmin) * sin(i))
        ]
    ];
    polygon(concat(points, points_inner));
}

module wheel(spirals = 2, thickness = 1, rmin = 5, rmax = 15, height = 10, notch_size = 1) {
	linear_extrude(height = height) {
		archimedean_spiral(spirals = spirals, thickness = thickness, rmin = rmin, rmax = rmax);
		rotate([0, 0, 180]) {
			archimedean_spiral(spirals = spirals, thickness = thickness, rmin = rmin, rmax = rmax);
		}
	}

	difference() {
		cylinder(r = rmin + thickness, h = height);
		cylinder(r = rmin, h = height);
	}
	difference() {
		cylinder(r = rmax + thickness, h = height);
		cylinder(r = rmax, h = height);
	}
	translate([-rmin, 0, height / 2]) {
		cylinder(r1 = notch_size, r2 = 0, h = notch_size, $fn = 4);
	}
}

module axle(radius = 5, wheel_width = 10, length = 80, gear_notch_pos = 25, notch_size = 1) {
	cylinder(r = radius, h = wheel_width);
	difference() {
		cylinder(r = radius - play, h = length);
		translate([-radius + play, 0, gear_notch_pos]) {
			cylinder(r1 = notch_size, r2 = 0, h = notch_size, $fn = 4);
		}
		translate([-radius + play, 0, length - wheel_width / 2]) {
			cylinder(r1 = notch_size, r2 = 0, h = notch_size, $fn = 4);
		}
	}
}

car_width = 60;
axle_radius = 5;
wheel_width = 10;
wheel(height = wheel_width, rmin = axle_radius, notch_size = notch_size);
translate([40, 0, 0])
	wheel(height = wheel_width, rmin = axle_radius, notch_size = notch_size);

axle(radius = axle_radius, wheel_width = wheel_width, length = wheel_width * 2 + car_width, notch_size = notch_size);