booklet_height = 145;
booklet_thickness = 20.5;
booklet_ledge = 30;
booklet_width = 93;
thickness = 2;
ledge_thickness = 3.8;
panel_thickness = 6.6;
$fs = 0.1;
$fa = 1;

cube([booklet_height + thickness, thickness, booklet_width]);
translate([booklet_height, thickness, 0]) {
	cube([thickness, booklet_thickness, booklet_width]);
	translate([-booklet_ledge, booklet_thickness, 0]) {
		cube([booklet_ledge + thickness, thickness, booklet_width]);
	}
}
translate([0, -panel_thickness, 0]) {
	cube([thickness, panel_thickness, booklet_width]);
	translate([0, -thickness, 0]) {
		cube([thickness + ledge_thickness, thickness, booklet_width]);
	}
}