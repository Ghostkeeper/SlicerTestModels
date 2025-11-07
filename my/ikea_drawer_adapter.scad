length = 233;
back_hook_depth = 9.3;
back_hook_height = 10;
bottom_hole_diameter = 6.5;
bottom_hole_depth = 9.1;
bottom_hole_offset = 11;
back_thickness = 3;
back_protrusion = 1;
back_hor_protrusion = 6;
width = 6.3 * 2;
height = 6.3 * 2 - 3.6;
bar_diameter = 12.8;
thickness = 2;
$fn = 180;

difference() {
	union() {
		cube([length, width, height + back_hook_height]);
		translate([0, width, height]) {
			cube([length, bar_diameter, back_hook_height]);
		}
	}
	translate([bottom_hole_offset, width / 2, -0.1]) {
		cylinder(h=0.1 + bottom_hole_depth, r=bottom_hole_diameter / 2);
	}
	translate([length - back_thickness - back_hook_depth, -0.1, height + thickness - back_protrusion]) {
		cube([back_thickness, bar_diameter + width + 0.2, back_hook_height + 0.1]);
	}
	translate([-0.1, bar_diameter / 2, height + thickness + bar_diameter / 2]) {
		rotate([0, 90, 0]) {
			cylinder(h=length + 0.2 - back_thickness - back_hook_depth, r=bar_diameter / 2);
		}
	}
}