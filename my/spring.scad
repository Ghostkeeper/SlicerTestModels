//Spring shape.

spirals = 2;
thickness = 1;
rmin = 5;
rmax = 15;
height = 10;

$fa = 1;
$fs = 0.1;

/*
 * Creates a nice spiral.
 * \param spirals   How many spirals.
 * \param thickness The thickness of the line.
 * \param rmin      The inner radius of the spiral.
 * \param rmax      The outer radius of the spiral.
 */
module archimedean_spiral(spirals = 1, thickness = 1, rmin = 50, rmax = 100) {
    s = spirals * 360;
    t = thickness;
    a = sqrt(pow(rmax - rmin, 2) / (pow(s, 2) * (pow(cos(s), 2) + pow(sin(s), 2))));
    points = [
        for(i = [0:$fa:s]) [
            (i * a + rmin) * cos(i),
            (i * a + rmin) * sin(i)
        ]
    ];
    points_inner = [
        for(i = [s:-$fa:0]) [
            (((i * a) + thickness + rmin) * cos(i)),
            (((i * a) + thickness + rmin) * sin(i))
        ]
    ];
    polygon(concat(points, points_inner));
}

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
//Axle.
cylinder(r = rmin, h = height);
cylinder(r = rmin - 0.2, h = height + 80);