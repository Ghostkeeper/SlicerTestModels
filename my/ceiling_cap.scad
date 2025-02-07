diameter = 150;
s1_x = 20;
s1_y = 130;
s2_x = 130;
s2_y = 20;
top_width = 100 / 2;

slope = 10;
height = 20;
curve_n = 30;
thickness_hor = 2;
thickness_ver = 2;

function sigmoid(x) = 1 / (1 + exp(-(-x + 0.5) * 10));

module cap_shape(width, hole_radius, slope_offset) {
    points = concat([for(a = [0:89]) for(n = [0:curve_n - 1]) [min(cos(a) * width / 2, hole_radius / sin(a)), sin(a) * width / 2 * n / curve_n + min(sin(a) * width / 2, hole_radius) * (1 - n / curve_n), sigmoid(n / curve_n) * (sin(slope) * cos(a) * width / 2 + slope_offset)]], [for(a = [90:270]) for(n = [0:curve_n - 1]) [cos(a) * (hole_radius + n / curve_n * (width / 2 - hole_radius)), sin(a) * (hole_radius + n / curve_n * (width / 2 - hole_radius)), sigmoid(n / curve_n) * (sin(slope) * cos(a) * hole_radius + slope_offset)]], [for(a = [270:359]) for(n = [0:curve_n - 1]) [max(cos(a) * width / 2, hole_radius / sin(a)), sin(a) * width / 2 * n / curve_n + max(sin(a) * width / 2, -hole_radius) * (1 - n / curve_n), sigmoid(n / curve_n) * (sin(slope) * cos(a) * width / 2 + slope_offset)]]);
    faces = concat([for(ai = [0:359]) [for(n = [0:curve_n - 1]) curve_n * ai + n, for(n = [curve_n - 1:-1:0]) curve_n * ((ai + 1) % 360) + n]], [[for(ai = [0:359]) ai * curve_n]], [[for(ai = [359:-1:0]) ai * curve_n + curve_n - 1]]);
    polyhedron(points, faces, 6);
}

difference() {
    cap_shape(diameter, top_width, height);
    cap_shape(diameter - thickness_hor, top_width - thickness_hor, height - thickness_ver);
    rotate([0, -slope, 0]) {
        translate([height, -top_width + thickness_hor, -100]) {
            cube([diameter, top_width * 2 - thickness_hor * 2, 100 + height - thickness_ver]);
        }
    }
}