diameter = 23;
thickness = 2;
width = 20;
length = 20;
hook_radius = 5;
$fs = 0.2;
$fa = 1;

radius = diameter / 2;

difference() {
	cylinder(h=width, r=radius + thickness);
	cylinder(h=width + 0.1, r=radius);
	translate([0, -thickness - radius - 0.1, -0.1]) {
		cube([radius + thickness + 0.1, diameter + thickness * 2 + 0.2, width + 0.2]);
	}
}
translate([0, radius, 0]) {
	cube([radius + length, thickness, width]);
}
translate([radius + length, radius - hook_radius, 0]) {
	difference() {
		cylinder(h=width, r=hook_radius + thickness);
		cylinder(h=width + 0.1, r=hook_radius);
		translate([-hook_radius - thickness - 0.1, -hook_radius - thickness - 0.1, -0.1]) {
			cube([hook_radius + thickness + 0.1, hook_radius * 2 + thickness * 2 + 0.2, width + 0.2]);
		}
	}
}