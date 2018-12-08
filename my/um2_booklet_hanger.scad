booklet_height = 145;
booklet_thickness = 20.5;
booklet_ledge = 30;
hanger_width = 10;
thickness = 2;
ledge_thickness = 3.8;
panel_thickness = 6.6;
$fs = 0.1;
$fa = 1;

cube([booklet_height + thickness, thickness, hanger_width]);
translate([booklet_height, thickness, 0]) {
	cube([thickness, booklet_thickness, hanger_width]);
	translate([-booklet_ledge, booklet_thickness, 0]) {
		cube([booklet_ledge + thickness, thickness, hanger_width]);
	}
}
translate([0, -panel_thickness, 0]) {
	cube([thickness, panel_thickness, hanger_width]);
	translate([0, -thickness, 0]) {
		cube([thickness + ledge_thickness, thickness, hanger_width]);
	}
}