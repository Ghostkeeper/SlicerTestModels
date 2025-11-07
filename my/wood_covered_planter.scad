radius = 50;
bamboo_thickness = 1;
hole_spacing = 30;
hole_radius = 2;
hole_top_spacing = 5;
height = 70;
thickness = 0.8;
bottom_thickness = 1.5;
$fs = 0.2;
$fa = 1;

difference() {
	cylinder(h=height, r=radius);
	translate([0, 0, bottom_thickness]) {
		cylinder(h=height, r=radius - thickness);
	}
	translate([0, 0, height - hole_top_spacing]) {
		for(a = [0:hole_spacing:360]) {
			rotate([90, 0, a]) {
				cylinder(h=radius * 2 + 2, r=hole_radius, center=true);
			}
		}
	}
}