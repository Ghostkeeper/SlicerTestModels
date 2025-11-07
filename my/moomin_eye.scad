diameter = 15;
thickness = 2;
base_thickness = 0.5;
$fs = 0.1;
$fa = 1;

//Calculations.
curve_thickness = thickness - base_thickness;
radius = diameter / 2;
sphere_radius = (radius * radius + curve_thickness * curve_thickness) / (2 * curve_thickness);

intersection() {
	linear_extrude(thickness) {
		difference() {
			circle(radius);
			circle(radius * 0.9);
		}
		translate([radius * 0.31, 0, 0]) {
			circle(radius * 0.6);
		}
	}
	translate([0, 0, thickness - sphere_radius]) {
		sphere(sphere_radius);
	}
}