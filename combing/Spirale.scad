$fa = 0.5;
$fs = 0.1;

linear_extrude(height = 10) {
    archimedean_spiral(spirals = 4, thickness = 1.2, rmin = 0.5, rmax = 20);
}

archimedean_spiral(spirals = 4, thickness = 1.2, rmin = 0.5, rmax = 20);
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
