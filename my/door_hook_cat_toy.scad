width_small = 13.5;
width_large = 40;
ridge_depth = 7.3;
toy_radius = 4.4 / 2;

thickness = 2;
length = 40;
depth = 40;
$fs = 0.3;
$fa = 1;


difference() {
	union() {
		cube([length, width_large + thickness * 2, thickness + ridge_depth + depth]);
		translate([length / 2, 0, 0]) {
			hull() {
				cylinder(r=toy_radius + thickness, h=depth / 2);
				translate([0, -toy_radius, 0]) {
					cylinder(r=toy_radius + thickness, h=depth / 2);
				}
			}
		}
	}
	translate([-1, thickness, thickness]) {
		cube([length + 2, width_small, ridge_depth + depth + 1]);
	}
	translate([-1, thickness, thickness + ridge_depth]) {
		cube([length + 2, width_large, depth + 1]);
	}
	translate([length / 2, -toy_radius, -1]) {
		cylinder(r=toy_radius, h=depth / 2 + 2);
	}
}
